package com.qaproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/** **/
@Controller
public class HelloController {
	@RequestMapping(value = "/",method = RequestMethod.GET)
     public String printWelcome(ModelMap model) {
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
}