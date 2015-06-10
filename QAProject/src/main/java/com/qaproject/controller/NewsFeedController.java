package com.qaproject.controller;

import com.qaproject.dao.ClassroomDao;
import com.qaproject.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
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
    ClassroomDao classroomDao;

    /**
     * MinhKH
     * Controller get suggested classrooms
     * @param model
     * @return String
     */
    @RequestMapping(value= "/newsfeed/welcome", method= RequestMethod.GET)
    public String suggestClass(ModelMap model){
        //Check is User
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return "redirect:/";
        }

        //get suggested classrooms
        Category category = user.getCategoryId();
        List<Classroom> suggestedClassrooms = classroomDao.findByCategory(category);

        //get suggested posts - materials
        List<Post> suggestedQuestions = new ArrayList<Post>();
        List<Post> suggestedArticles = new ArrayList<Post>();
        List<Material> suggestedMaterials = new ArrayList<Material>();
        for (int i =0;i<suggestedClassrooms.size(); i++){
            Classroom currentSuggestedClassroom = suggestedClassrooms.get(i);
            List<Post> currentSuggestedPosts = currentSuggestedClassroom.getPostList();
            suggestedMaterials.addAll(currentSuggestedClassroom.getMaterialList());
            //classify posts
            for (int j=0; j<currentSuggestedPosts.size(); j++){
                Post currentSuggestedPost = currentSuggestedPosts.get(j);
                if (currentSuggestedPost.getPostType()==1) {
                    suggestedQuestions.add(currentSuggestedPost);
                }
                if (currentSuggestedPost.getPostType()==2) {
                    suggestedArticles.add(currentSuggestedPost);
                }
            }
        }

        //Check if User is student
        if (user.getRoleId().getId()==1){
            model.addAttribute("suggestedClassrooms",suggestedClassrooms);
        }

        model.addAttribute("materials", suggestedMaterials);
        model.addAttribute("questions",suggestedQuestions);
        model.addAttribute("articles",suggestedArticles);
        return "newsfeed";
    }
}
