package com.qaproject.controller;

import com.qaproject.dao.ClassroomDao;
import com.qaproject.dao.ClassroomUserDao;
import com.qaproject.dao.PostDao;
import com.qaproject.dao.UserDao;
import com.qaproject.entity.*;
import com.qaproject.util.NewsFeedUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Minh on 6/10/2015.
 */
@Controller
public class NewsFeedController {
    @Autowired
    HttpSession session;
    @Autowired
    UserDao userDao;
    @Autowired
    ClassroomDao classroomDao;
    @Autowired
    PostDao postDao;
    @Autowired
    ClassroomUserDao classroomUserDao;
    @Autowired
    NewsFeedUtilities newsFeedUtilities;

    /**
     * MinhKH
     * Controller get suggested classrooms
     * @param model
     * @return String
     */
    @RequestMapping(value= "/newsfeed", method= RequestMethod.GET)
    public String suggestClass(ModelMap model){
        //Check is User
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return "redirect:/";
        }
        User currentUser = userDao.find(user.getId());
        List<ClassroomUser> classroomUsers = classroomUserDao.findByUser(currentUser);
        boolean isJoined = false;
        // Check if user have joined class
        for (ClassroomUser classroomUser:classroomUsers) {
            if (classroomUser.getApproval()==1){
                isJoined=true;
            }
        }

        //get suggested classrooms
        Category category = user.getCategoryId();
        List<Classroom> suggestedClassrooms = classroomDao.findByCategory(category);

        //get suggested posts - materials
        List<Post> suggestedQuestions = newsFeedUtilities.getNewsFeedQuestions(user.getId(),0,10);
        List<Post> suggestedArticles = new ArrayList<Post>();
        List<Material> suggestedMaterials = new ArrayList<Material>();

        //Check if User is teacher
        if (user.getRoleId().getId()==2){
        }

        //Check if User is student
        if (user.getRoleId().getId()==1){
            if (!isJoined) {
                model.addAttribute("suggestedClassrooms",suggestedClassrooms);
            }
        }

        for (int i =0;i<suggestedClassrooms.size(); i++){
            Classroom currentSuggestedClassroom = suggestedClassrooms.get(i);
            List<Post> currentSuggestedPosts = currentSuggestedClassroom.getPostList();
            suggestedMaterials.addAll(currentSuggestedClassroom.getMaterialList());
            //classify posts
            for (int j=0; j<currentSuggestedPosts.size(); j++){
                Post currentSuggestedPost = currentSuggestedPosts.get(j);
                if (currentSuggestedPost.getPostType()==1) {
                    //suggestedQuestions.add(currentSuggestedPost);
                }
                if (currentSuggestedPost.getPostType()==2) {
                    suggestedArticles.add(currentSuggestedPost);
                }
            }
        }



        model.addAttribute("materials", suggestedMaterials);
        model.addAttribute("questions",suggestedQuestions);
        model.addAttribute("articles",suggestedArticles);
        return "newsfeed";
    }
}
