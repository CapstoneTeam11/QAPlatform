package com.qaproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.messaging.SessionSubscribeEvent;

/** **/
@Controller
public class HelloController {

    @Autowired
    SimpMessagingTemplate template;
//
//    @Autowired
//    SessionSubscribeEvent subscribeEvent;

    private void updateAddUI(Post post) {
        template.convertAndSend("/topic/addPost",post);
    }

    @MessageMapping("/addPost")
    public void addStock(Post post) throws Exception {
        updateAddUI(post);
    }

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