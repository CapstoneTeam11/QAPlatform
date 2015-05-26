package com.qaproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by khangtnse60992 on 5/23/2015.
 */
@Controller
public class NotificationController {
    @RequestMapping(value = "/notifi",method = RequestMethod.GET)
    public String printWelcome(ModelMap model) {
        return "notification";
    }
    @RequestMapping(value = "/createPost",method = RequestMethod.GET)
    public String createPost(ModelMap model) {
        return "createPost";
    }
    @RequestMapping(value = "/createClass",method = RequestMethod.GET)
    public String createClass(ModelMap model) {
        return "createClass";
    }
}
