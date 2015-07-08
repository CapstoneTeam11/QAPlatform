package com.qaproject.controller;

import com.qaproject.dao.*;
import com.qaproject.dto.*;
import com.qaproject.entity.*;
import com.qaproject.util.Constant;
import com.qaproject.util.ConvertEntityDto;
import com.qaproject.util.DashboardUtilities;
import com.qaproject.util.NotificationUtilities;
import org.springframework.beans.factory.annotation.Autowired;
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
    FollowerDao followerDao;
    @Autowired
    ClassroomUserDao classroomUserDao;
    @Autowired
    DashboardUtilities dashboardUtilities;
    @Autowired
    NotificationUtilities notificationUtilities;
    @Autowired
    NotificationDao notificationDao;
    @Autowired
    TagMaterialDao tagMaterialDao;
    @Autowired
    MaterialDao materialDao;
    @Autowired
    SimpMessagingTemplate template;

    @RequestMapping(value = "/post/add", method = RequestMethod.POST,produces = "application/json")
    public @ResponseBody String addStock(@ModelAttribute PostDto postDto) throws Exception {
        //Need to edit subcrible
        Post parentId = postDao.find(postDto.getParentId());
        Post post = new Post();
        post.setBody(postDto.getBody());
        post.setLastEditedDate(new Date());
        post.setCreationDate(new Date());
        post.setPostType(3);
        post.setAcceptedAnswerId(0);
        post.setParentId(postDto.getParentId());
        post.setOwnerClassId(parentId.getOwnerClassId());
        post.setOwnerUserId(userDao.find(postDto.getOwnerId()));
        postDao.persist(post);

        User user = (User) session.getAttribute("user");
        if (user==null) {
            return "NG";
        }
        //Notification - MinhKH
        User sender = userDao.find(user.getId());
        Post parent = postDao.find(post.getParentId());
        //Edit realtime KhangTN
        postDto = ConvertEntityDto.convertPostEntityToDto(post);
        List<User> receivers = userDao.findUserNotificationByPost(parent.getId());
            for (User receiver : receivers){
                if(receiver.getId()!=user.getId()) {
                Notification notification = new Notification();
                notification.setReceiverId(receiver);
                notification.setSenderId(sender);
                notification.setObjectId(parentId.getId());
                notification.setNotificationType(Constant.NT_USER_REPLY);
                notification.setIsViewed(Constant.IV_FALSE);
                notificationDao.persist(notification);
                NotificationDto notificationDto  = ConvertEntityDto.convertNotificationEntityToDto(notification,notification.getNotificationType(),parentId);
                template.convertAndSend("/topic/notice/" + receiver.getId(), notificationDto);
                }
            }
            template.convertAndSend("/topic/discussion/" + parentId.getId(), postDto);
        return "OK";
    }

    @RequestMapping(value = "/post/view/{id}", method = RequestMethod.GET)
    public String view(@PathVariable Integer id, ModelMap model) {
        //check if not parent Post return 404.
        Post post = postDao.find(id);
        if (post == null || 0 != post.getParentId()) {
            return "404";
        }

        User user = (User) session.getAttribute("user");
        if (user != null) {
            if (0 != post.getStatus()) {
                //check user can comment or not .
                if (user.getId() == post.getOwnerUserId().getId()) {
                    //check user is post owner
                    post.setIsComment(1);
                }
                if (0 == post.getIsComment()) {
                    // check user is class's teacher
                    if (user.getId() == post.getOwnerClassId().getOwnerUserId().getId()) {
                        post.setIsComment(1);
                    }
                }
                if (0 == post.getIsComment() && user.getRoleId().getId() == Constant.TEACHER) {
                    // check user was invitated
                    List<PostInvitation> postInvitations = post.getPostInvitationList();
                    for (int i = 0; i < postInvitations.size(); i++) {
                        if (user.getId() == postInvitations.get(i).getTeacherId().getId()) {
                            post.setIsComment(1);
                            break;
                        }
                    }

                }
                if (0 == post.getIsComment()) {
                    //check List User in Classrom
                    List<ClassroomUser> classroomUsers = post.getOwnerClassId().getClassroomUserList();
                    for (int i = 0; i < classroomUsers.size(); i++) {
                        if (user.getId() == classroomUsers.get(i).getUserId().getId()) {
                            post.setIsComment(1);
                            break;
                        }
                    }
                }
            }
        }

        //get tag list of post
        List<Integer> tagIds = new ArrayList<Integer>();
        for (int i = 0; i < post.getTagPostList().size(); i++) {
            tagIds.add(post.getTagPostList().get(i).getTagId().getId());
        }

        //get related questions - MinhKH
        List<Integer> relatedQuestionIds = tagPostDao.findRelatedQuestionIds(tagIds,10);
        List<Post> relatedQuestions = new ArrayList<Post>();
        if (relatedQuestionIds != null) {
            for (int i = 0; i < relatedQuestionIds.size(); i++) {
                int currentRelatedQuestionId = relatedQuestionIds.get(i);
                if (currentRelatedQuestionId != post.getId()) {
                    Post relatedQuestion = postDao.find(currentRelatedQuestionId);
                    relatedQuestions.add(relatedQuestion);
                }
            }
        }

        //get related articles
        List<Post> relatedArticles = new ArrayList<Post>();
        List<Integer> relatedArticlesIds = tagPostDao.findRelatedArticlesIds(tagIds,10);
        if (relatedArticlesIds != null) {
            for (int i = 0; i < relatedArticlesIds.size(); i++) {
                int currentRelatedArticlesId = relatedArticlesIds.get(i);
                if (currentRelatedArticlesId != post.getId()) {
                    Post relatedArticle = postDao.find(currentRelatedArticlesId);
                    relatedArticles.add(relatedArticle);
                }

            }
        }

        //get related materials
        List<Material> relatedMaterials = new ArrayList<Material>();
        List<Integer> relatedMaterialIds = tagMaterialDao.findRelatedMaterialIds(tagIds,10);
        if (relatedMaterialIds != null) {
            for (int i = 0; i < relatedMaterialIds.size(); i++) {
                int currentRelatedMaterialId = relatedMaterialIds.get(i);
                    Material relatedMaterial = materialDao.find(currentRelatedMaterialId);
                relatedMaterials.add(relatedMaterial);
            }
        }


        //get List Post answer
        List<Post> postAnswers = postDao.findPostChilds(id, 0);
        model.addAttribute("post", post);
        model.addAttribute("relatedArticles", relatedArticles);
        model.addAttribute("relatedMaterials", relatedMaterials);
        model.addAttribute("relatedQuestions", relatedQuestions);
        model.addAttribute("postAnswers", postAnswers);
        if (user != null) {
            WantAnswerPost wantAnswerPost = post.checkWantToAnswer(user.getId());
            if (wantAnswerPost != null) {
                model.addAttribute("wantAnswer", wantAnswerPost);
            }
        }
        if (post.getPostType() == 1) {
            return "question";
        }
        return "article";
    }

    @RequestMapping(value = "post/view/{id}/{lastestId}", produces = "application/json", method = RequestMethod.GET)
    public
    @ResponseBody
    List<PostDto> loadMoreAnswer(@PathVariable Integer id, @PathVariable Integer lastestId) {
        List<PostDto> postDtos = null;
        try {
            postDtos = postDao.loadMoreAnswer(id, lastestId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postDtos;
    }

    @RequestMapping(value = "/post/create/{id}", method = RequestMethod.GET)
    public String createDispath(@PathVariable Integer id, ModelMap model) {
        Classroom classroom = classroomDao.find(id);
        if (classroom==null) {
            return "404";
        }
        model.addAttribute("classroom",classroom);
        return "createPost";
    }

    @RequestMapping(value = "/post/update/{id}", method = RequestMethod.GET)
    public String updateDispath(@PathVariable Integer id, ModelMap model) {
        Post post = postDao.find(id);
        User user = (User) session.getAttribute("user");
        //validate authorize
        if (post == null) {
            return "404";
        }
        if (user == null) {
            return "redirect:/";
        }
        if (post.getOwnerUserId().getId() != user.getId()) {
            return "403";
        }
        Classroom classroom = post.getOwnerClassId();
        model.addAttribute("classroom",classroom);
        model.addAttribute("post", post);
        return "createPost";
    }

    @RequestMapping(value = "/post/create", method = RequestMethod.POST)
    public String create(@RequestParam Integer classId,
                         @RequestParam List<Integer> tagId,
                         @RequestParam(required = false) List<String> newTag,
                         @RequestParam String postName,
                         @RequestParam Integer postType,
                         @RequestParam String postDetail,
                         ModelMap model) {
        //Check is User
        User user = (User) session.getAttribute("user");
        Classroom classroom = classroomDao.find(classId);
        if (user == null) {
            return "redirect:/";
        }
        //Check User have joint to Class
        if (classroom.checkUserExist(user) == false) {
            return "redirect:/";
        }
        Post post = new Post();
        post.setTitle(postName);
        post.setPostType(postType);
        post.setOwnerClassId(classroom);
        post.setOwnerUserId(user);
        post.setBody(postDetail);
        post.setViewer(0);
        post.setAcceptedAnswerId(0);
        post.setParentId(0);
        post.setStatus(1);
        post.setCreationDate(new Date());
        post.setLastEditedDate(new Date());
        //Create List TagPost
        List<TagPost> tagPosts = new ArrayList<TagPost>();
        for (int i = 0; i < tagId.size(); i++) {
            TagPost tagPost = new TagPost();
            tagPost.setPostId(post);
            tagPost.setTagId(tagDao.find(tagId.get(i)));
            tagPosts.add(tagPost);
        }
        if (newTag != null) {
            for (int i = 0; i < newTag.size(); i++) {
                TagPost tagPost = new TagPost();
                tagPost.setPostId(post);
                Tag tag = new Tag();
                tag.setTagName(newTag.get(i));
                tagDao.persist(tag);
                tagPost.setTagId(tag);
                tagPosts.add(tagPost);
            }
        }
        post.getTagPostList().addAll(tagPosts);
        classroom.setActiveTime(new Date());
        postDao.persist(post);
        classroomDao.merge(classroom);
        
        //Notification - MinhKH
        List<ClassroomUser> inClassStudents = classroomUserDao.findByClassroom(classroom);
        ClassroomUser classroomTeacher = new ClassroomUser();
        classroomTeacher.setUserId(classroom.getOwnerUserId());;
        inClassStudents.add(classroomTeacher);
        if (inClassStudents!=null){
            if(user.getRoleId().getId()==Constant.STUDENT) {
                for (ClassroomUser classroomUser : inClassStudents){
                    if(user.getId()!=classroomUser.getUserId().getId()){
                        Notification notification = new Notification();
                        notification.setReceiverId(classroomUser.getUserId());
                        notification.setSenderId(user);
                        notification.setObjectId(post.getId());
                        notification.setNotificationType(Constant.NT_STUDENT_CREATE_POST);
                        notification.setIsViewed(Constant.IV_FALSE);
                        notificationDao.persist(notification);
                        NotificationDto notificationDto  = ConvertEntityDto.convertNotificationEntityToDto(notification,notification.getNotificationType(),post);
                        template.convertAndSend("/topic/notice/" + classroomUser.getUserId().getId(), notificationDto);
                    }

                }

            } else {
                List<User> users = userDao.findUserNotificationByCreatePostTeacher(classroom.getOwnerUserId().getId(),classroom.getId());
                for (User userInvi : users){
                    if(user.getId()!=userInvi.getId()){
                        Notification notification = new Notification();
                        notification.setReceiverId(userInvi);
                        notification.setSenderId(user);
                        notification.setObjectId(post.getId());
                        notification.setNotificationType(Constant.NT_TEACHER_CREATE_POST);
                        notification.setIsViewed(Constant.IV_FALSE);
                        notificationDao.persist(notification);
                        NotificationDto notificationDto  = ConvertEntityDto.convertNotificationEntityToDto(notification,notification.getNotificationType(),post);
                        template.convertAndSend("/topic/notice/" + userInvi.getId(), notificationDto);
                    }

                }
            }

        }


        return "redirect:/post/view/" + post.getId();
    }


    @RequestMapping(value = "/post/update", method = RequestMethod.POST)
    public String update(@RequestParam Integer id,
                         @RequestParam List<Integer> tagId,
                         @RequestParam(required = false) List<String> newTag,
                         @RequestParam String postName,
                         @RequestParam Integer postType,
                         @RequestParam String postDetail,
                         ModelMap model) {
        //Check is User
        User user = (User) session.getAttribute("user");
        Post post = postDao.find(id);
        if (user == null) {
            return "redirect:/";
        }
        if (post == null) {
            return "404";
        }
        post.setTitle(postName);
        post.setPostType(postType);
        post.setBody(postDetail);
        post.setViewer(0);
        post.setAcceptedAnswerId(0);
        post.setParentId(0);
        post.setLastEditedDate(new Date());
        //Create List TagPost
        List<TagPost> tagPosts = new ArrayList<TagPost>();
        for (int i = 0; i < tagId.size(); i++) {
            TagPost tagPost = new TagPost();
            tagPost.setPostId(post);
            tagPost.setTagId(tagDao.find(tagId.get(i)));
            tagPosts.add(tagPost);
        }
        if (newTag != null) {
            for (int i = 0; i < newTag.size(); i++) {
                TagPost tagPost = new TagPost();
                tagPost.setPostId(post);
                Tag tag = new Tag();
                tag.setTagName(newTag.get(i));
                tagDao.persist(tag);
                tagPost.setTagId(tag);
                tagPosts.add(tagPost);
            }
        }
        post.getTagPostList().clear();
        post.getTagPostList().addAll(tagPosts);
        postDao.merge(post);
        return "redirect:/post/view/" + post.getId();
    }

    @RequestMapping(value = "/post/wantAnswer", method = RequestMethod.POST, produces = "application/json")
    public
    @ResponseBody
    String addWantAnswer(@ModelAttribute("wantAnswerDto") WantAnswerDto wantAnswerDto) {
        //authorize
        User user = (User) session.getAttribute("user");
        WantAnswerPost wantAnswerPost = new WantAnswerPost();
        wantAnswerPost.setPostId(postDao.find(wantAnswerDto.getPostId()));
        wantAnswerPost.setUserId(user);
        try {
            wantAnswerDao.persist(wantAnswerPost);
        } catch (Exception e) {
            e.printStackTrace();
            return "NG";
        }
        //Send notification
        return String.valueOf(wantAnswerPost.getId());
    }

    @RequestMapping(value = "/post/dontWantAnswer", method = RequestMethod.POST, produces = "application/json")
    public
    @ResponseBody
    String removeWantAnswer(@ModelAttribute("wantAnswerDto") WantAnswerDto wantAnswerDto) {
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

    @RequestMapping(value = "/post/acceptAnswer", method = RequestMethod.POST, produces = "application/json")
    public
    @ResponseBody
    String acceptAnswer(@ModelAttribute("acceptAnswerDto") AcceptAnswerDto acceptAnswerDto) {
        //authorize
        try {
            Post post;
            Integer idUnaccept = acceptAnswerDto.getIdUnaccept();
            Integer id = acceptAnswerDto.getId();
            post = postDao.find(id);
            //remove post was accepted before .
            List<Post> posts = postDao.findRepliesWasAcceptedByParentId(post.getParentId());
            if (posts != null) {
                for (int i = 0; i < posts.size(); i++) {
                    Post postUn = posts.get(i);
                    postUn.setAcceptedAnswerId(Constant.UNACCEPT_ANSWER);
                    postDao.merge(postUn);
                }
            }
            post.setAcceptedAnswerId(Constant.ACCEPT_ANSWER);
            postDao.merge(post);
        } catch (Exception e) {
            e.printStackTrace();
            return "NG";
        }
        //Send notification
        return "OK";
    }

    @RequestMapping(value = "/post/removeAcceptAnswer/{id}", method = RequestMethod.POST, produces = "application/json")
    public
    @ResponseBody
    String removeAcceptAnswer(@PathVariable Integer id) {
        //authorize
        try {
            Post post = postDao.find(id);
            post.setAcceptedAnswerId(0);
            postDao.merge(post);
        } catch (Exception e) {
            e.printStackTrace();
            return "NG";
        }
        //Send notification
        return "OK";
    }

    @RequestMapping(value = "dashboard/postInvitation/{lastId}", produces = "application/json",
            method = RequestMethod.GET)
    public
    @ResponseBody
    List<PostInvitationDto> loadPostInvitation(@PathVariable Integer lastId) {
        User user = (User) session.getAttribute("user");
        List<PostInvitationDto> postInvitationDtos = null;
        try {
            postInvitationDtos = dashboardUtilities.loadPostInvitations(user.getId(), lastId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postInvitationDtos;
    }

    @RequestMapping(value = "/post/updateAnswer", method = RequestMethod.POST, produces = "application/json")
    public
    @ResponseBody
    String updateAnswer(@ModelAttribute(value = "postDto") PostDto postDto) {
        try {
            Post post = postDao.find(postDto.getId());
            post.setBody(postDto.getBody());
            post.setLastEditedDate(new Date());
            postDao.merge(post);
        } catch (Exception e) {
            e.printStackTrace();
            return "NG";
        }
        return "OK";
    }

    @RequestMapping(value = "/post/updateAnswer/{id}", method = RequestMethod.GET, produces = "application/json")
    public
    @ResponseBody
    String updateAnswer(@PathVariable Integer id) {
        Post post;
        String body = "";
        try {
            post = postDao.find(id);
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
        if (post != null) {
            body = post.getBody();
        }
        return body;
    }

    @RequestMapping(value = "/post/deleteAnswer", method = RequestMethod.POST, produces = "application/json")
    public
    @ResponseBody
    String deleteAnswer(@ModelAttribute(value = "postDto") PostDto postDto) {
        //authorize
        Post post;
        try {
            post = postDao.find(postDto.getId());
            postDao.remove(post);
        } catch (Exception e) {
            e.printStackTrace();
            return "NG";
        }
        return "OK";
    }

    @RequestMapping(value = "/post/deletePost", method = RequestMethod.POST)
    public String deletePost(@RequestParam Integer id) {
        //authorize
        Post post;
        Integer classId;
        try {
            post = postDao.find(id);
            classId = post.getOwnerClassId().getId();
            postDao.remove(post);
        } catch (Exception e) {
            e.printStackTrace();
            return "NG";
        }
        return "redirect:/classroom/" + classId;
    }

    @RequestMapping(value = "/post/closePost", method = RequestMethod.POST)
    public String closePost(@RequestParam Integer id) {
        //authorize
        Post post = null;
        try {
            post = postDao.find(id);
            post.setStatus(Constant.CLOSE_POST);
            postDao.merge(post);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/post/view/" + post.getId();
    }

    @RequestMapping(value = "/post/openPost", method = RequestMethod.POST)
    public String openPost(@RequestParam Integer id) {
        //authorize
        Post post = null;
        try {
            post = postDao.find(id);
            post.setStatus(Constant.OPEN_POST);
            postDao.merge(post);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/post/view/" + post.getId();
    }
    @RequestMapping(value = "/post/count/{id}", method = RequestMethod.POST,produces = "application/json")
    public String updateView(@PathVariable Integer id) {
        //authorize
        Post post = null;
        try {
            post = postDao.find(id);
            if(post.getViewer()==null) {
                post.setViewer(0);
            } else {
                post.setViewer(post.getViewer()+1);
            }
            postDao.merge(post);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/post/view/" + post.getId();
    }

}
