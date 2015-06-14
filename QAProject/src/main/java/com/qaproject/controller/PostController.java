package com.qaproject.controller;

import com.qaproject.dao.*;
import com.qaproject.dto.AnswerDto;
import com.qaproject.dto.PostDto;
import com.qaproject.dto.WantAnswerDto;
import com.qaproject.entity.*;
import com.qaproject.util.ConvertEntityDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by khangtnse60992 on 6/4/2015.
 */
@Controller
public class PostController {

    @Autowired
    ClassroomDao classroomDao;
    @Autowired
    PostDao postDao;
    @Autowired
    TagDao tagDao;
    @Autowired
	TagPostDao tagPostDao;
    @Autowired
    HttpSession session;
    @Autowired
    UserDao userDao;
    @Autowired
    WantAnswerDao wantAnswerDao;
    @Autowired
    SimpMessagingTemplate template;

    @MessageMapping("/addPost")
    public void addStock(AnswerDto answerDto) throws Exception {
        //Need to edit subcrible
        Post parentId = postDao.find(answerDto.getParentId());
        Post post = new Post();
        post.setBody(answerDto.getBody());
        post.setLastEditedDate(new Date());
        post.setCreationDate(new Date());
        post.setPostType(3);
        post.setParentId(answerDto.getParentId());
        post.setOwnerClassId(parentId.getOwnerClassId());
        post.setOwnerUserId(userDao.find(answerDto.getOwnerId()));
        postDao.persist(post);
        PostDto postDto = ConvertEntityDto.convertPostEntityToDto(post);
        template.convertAndSend("/topic/addPost/"+answerDto.getParentId(),postDto);
    }

    @RequestMapping(value = "/post/view/{id}",method = RequestMethod.GET)
    public String view(@PathVariable Integer id, ModelMap model) {
        //check if not parent Post return 404.
        Post post = postDao.find(id);
        User user = (User) session.getAttribute("user");
		//get related postId - MinhKH
        List<Integer> tagIds = new ArrayList<Integer>();
        for (int i= 0; i<post.getTagPostList().size(); i++) {
            tagIds.add(post.getTagPostList().get(i).getTagId().getId());
        }
        List<Integer> relatedPostIds = tagPostDao.findRelatedPostIds(tagIds);
        List<Post> relatedPosts = new ArrayList<Post>();
        for(int i=0; i<relatedPostIds.size(); i++){
            int currentRelatedPostId = relatedPostIds.get(i);
            if (currentRelatedPostId!=post.getId()){
                Post relatedPost = postDao.find(currentRelatedPostId);
                relatedPosts.add(relatedPost);
            }
        }
        //get List Post answer
        List<Post> postAnswers = postDao.findPostChilds(id,1);
        model.addAttribute("post",post);
        model.addAttribute("relatedPosts", relatedPosts);
        model.addAttribute("postAnswers", postAnswers);
        WantAnswerPost wantAnswerPost =post.checkWantToAnswer(user.getId());
        if(wantAnswerPost!=null) {
            model.addAttribute("wantAnswer",wantAnswerPost);
        }
        if (post.getPostType()==1){
            return "question";
        }
        return "article";
    }
    @RequestMapping(value = "/post/create/{id}",method = RequestMethod.GET)
    public String createDispath(@PathVariable Integer id, ModelMap model) {
        model.addAttribute("classId",id);
        return "createPost";
    }
    @RequestMapping(value = "/post/create",method = RequestMethod.POST)
    public String create(@RequestParam Integer classId,
                         @RequestParam List<Integer> tagId,
                         @RequestParam String postName,
                         @RequestParam Integer postType,
                         @RequestParam String postDetail,
                         ModelMap model) {
        //Check is User
        User user = (User) session.getAttribute("user");
        Classroom classroom = classroomDao.find(classId);
        if(user==null) {
            return "redirect:/";
        }
        //Check User have joint to Class
        if(classroom.checkUserExist(user)==false){
            return "redirect:/";
        }
        Post post = new Post();
        post.setTitle(postName);
        post.setPostType(postType);
        post.setOwnerClassId(classroom);
        post.setOwnerUserId(user);
        post.setBody(postDetail);
        post.setCreationDate(new Date());
        post.setLastEditedDate(new Date());
        //Create List TagPost
        List<TagPost> tagPosts = new ArrayList<TagPost>();
        for(int i = 0 ; i < tagId.size();i++) {
            TagPost tagPost = new TagPost();
            tagPost.setPostId(post);
            tagPost.setTagId(tagDao.find(tagId.get(i)));
            tagPosts.add(tagPost);
        }
        post.getTagPostList().addAll(tagPosts);
        postDao.persist(post);
        return "redirect:/post/view/"+post.getId();
    }
    @RequestMapping(value = "/post/wantAnswer",method = RequestMethod.POST,produces = "application/json")
    public @ResponseBody String addWantAnswer(@ModelAttribute("wantAnswerDto")WantAnswerDto wantAnswerDto) {
        //authorize
        WantAnswerPost wantAnswerPost = new WantAnswerPost();
        wantAnswerPost.setPostId(postDao.find(wantAnswerDto.getPostId()));
        wantAnswerPost.setUserId(userDao.find(wantAnswerDto.getUserId()));
        try {
            wantAnswerDao.persist(wantAnswerPost);
        } catch (Exception e) {
            e.printStackTrace();
            return "NG";
        }
        //Send notification
        return String.valueOf(wantAnswerPost.getId());
    }
    @RequestMapping(value = "/post/dontWantAnswer",method = RequestMethod.POST,produces = "application/json")
    public @ResponseBody String removeWantAnswer(@ModelAttribute("wantAnswerDto")WantAnswerDto wantAnswerDto) {
        //authorize
        try {
            WantAnswerPost wantAnswerPost = wantAnswerDao.find(wantAnswerDto.getId());
            wantAnswerDao.remove(wantAnswerPost);
        } catch (Exception e) {
            e.printStackTrace();
            return "NG";
        }
        //Send notification
        return "OK";
    }
}
