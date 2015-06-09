package com.qaproject.controller;

import com.qaproject.dao.impl.CategoryDaoImpl;
import com.qaproject.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/** **/
@Controller
public class HelloController {
//
//    @Autowired
//    SimpMessagingTemplate template;
//
//    @Autowired
//    SessionSubscribeEvent subscribeEvent;

//    private void updateAddUI(Post post) {
//        template.convertAndSend("/topic/addPost",post);
//    }
//
//    @MessageMapping("/addPost")
//    public void addStock(Post post) throws Exception {
//        updateAddUI(post);
//    }
    @Autowired
    CategoryDaoImpl categoryDao;
	@RequestMapping(value = "/",method = RequestMethod.GET)
     public String printWelcome(ModelMap model) {
        List<Category> categoryList = categoryDao.findAll();
        model.addAttribute("categories",categoryList);
        return "welcome";
    }
    @RequestMapping(value = "/homepage",method = RequestMethod.GET)
    public String homepage(ModelMap model) {
    return "homepage";
}
    @RequestMapping(value = "/classroom",method = RequestMethod.GET)
    public String classroom(ModelMap model) {
        return "classroom";
    }
    @RequestMapping(value = "/question",method = RequestMethod.GET)
    public String question(ModelMap model) {
        return "question";
    }
    @RequestMapping(value = "/article",method = RequestMethod.GET)
    public String article(ModelMap model) {
        return "article";
    }
    @RequestMapping(value = "/newsfeed",method = RequestMethod.GET)
    public String newsfeed(ModelMap model) {
        return "newsfeed";
    }
    @RequestMapping(value = "/studentdashboard",method = RequestMethod.GET)
    public String studentdashboard(ModelMap model) {
        return "studentdashboard";
    }
    @RequestMapping(value = "/teacherdashboard",method = RequestMethod.GET)
    public String teacherdashboard(ModelMap model) {
        return "teacherdashboard";
    }
    @RequestMapping(value = "/profile",method = RequestMethod.GET)
    public String profile(ModelMap model) {
        return "profile";
    }
    @RequestMapping(value = "/material",method = RequestMethod.GET)
    public String material(ModelMap model) {
        return "material";
    }
    @RequestMapping(value = "/teacherdashboardWelcome",method = RequestMethod.GET)
    public String teacherdashboardWelcome(ModelMap model) {
        return "teacherdashboardWelcome";
    }
    @RequestMapping(value = "/classroomWelcome",method = RequestMethod.GET)
    public String classroomWelcome(ModelMap model) {
        return "classroomWelcome";
    }
}