package com.qaproject.controller;

import com.qaproject.dao.*;
import com.qaproject.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Minh on 6/19/2015.
 */
@Controller
public class ProfileController {
    @Autowired
    UserDao userDao;
    @Autowired
    FollowerDao followerDao;
    @Autowired
    PostDao postDao;
    @Autowired
    ClassroomDao classroomDao;
    @Autowired
    ClassroomUserDao classroomUserDao;
    @Autowired
    HttpSession session;


    @RequestMapping(value = "/profile/view/{id}", method = RequestMethod.GET)
    public String view(@PathVariable Integer id, ModelMap model) {
        boolean isFollow = false;
        User user = (User)session.getAttribute("user");
        if (user==null) {
            return "redirect:/";
        }

        User userProfile = userDao.find(id);
        if (userProfile==null) {
            return "404";
        }
        if (userProfile.getRoleId().getId()==2){ //if userProfile is teacher
            List<Follower> followedTeachers = followerDao.findByFollower(user);
            for (Follower followedTeacher:followedTeachers) {
                if (followedTeacher.getTeacherId().equals(userProfile)){
                    isFollow = true;
                }
            }
        }

        List<Post> questions = postDao.findQuestionsByOwnerUser(userProfile);
        List<Post> articles = postDao.findArticlesByOwnerUser(userProfile);
        List<Classroom> classrooms = new ArrayList<Classroom>();

        if (userProfile.getRoleId().getId()==1){ // if user is student, find joined classrooms
            List<ClassroomUser> classroomUsers = classroomUserDao.findByUserWithApproved(userProfile);
            if (classroomUsers!=null) {
                for (ClassroomUser classroomUser : classroomUsers){
                    classrooms.add(classroomUser.getClassroomId());
                }
            }
        }
        if (userProfile.getRoleId().getId()==2){ // if user is teacher, find owner classrooms
            classrooms = classroomDao.findByOwnerUser(user.getId());
        }


        model.addAttribute("questionCount", (questions!=null) ? questions.size():0);
        model.addAttribute("articleCount", (articles!=null) ? articles.size():0);
        model.addAttribute("classroomCount", classrooms.size());
        model.addAttribute("questions",questions);
        model.addAttribute("articles",articles);
        model.addAttribute("classrooms",classrooms);
        model.addAttribute("isFollow",isFollow);
        model.addAttribute("userProfile", userProfile);

        return "profile";
    }
}
