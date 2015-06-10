package com.qaproject.controller;

import com.qaproject.dao.ClassroomDao;
import com.qaproject.entity.Category;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
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
        //Check if User is not student
        if (user.getRoleId().getId()!=1){
            return "newsfeed";
        }
        Category category = user.getCategoryId();
        List<Classroom> suggestedClassrooms = classroomDao.findByCategory(category);
        model.addAttribute("suggestedClassrooms",suggestedClassrooms);
        for (int i =0;i<suggestedClassrooms.size(); i++){
            System.out.println(suggestedClassrooms.get(i).getId()+ "-" + suggestedClassrooms.get(i).getClassroomName());
        }
        return "newsfeed";
    }
}
