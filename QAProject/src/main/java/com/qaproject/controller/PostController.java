package com.qaproject.controller;

import com.qaproject.dao.ClassroomDao;
import com.qaproject.dao.PostDao;
import com.qaproject.dao.TagDao;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.Post;
import com.qaproject.entity.TagPost;
import com.qaproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
    HttpSession session;


    @RequestMapping(value = "/post/view/{id}",method = RequestMethod.GET)
    public String view(@PathVariable Integer id, ModelMap model) {
        Post post = postDao.find(id);
        model.addAttribute("post",post);
        return "question";
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

}
