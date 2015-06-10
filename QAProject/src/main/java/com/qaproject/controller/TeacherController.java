package com.qaproject.controller;

import com.qaproject.dao.FollowerDao;
import com.qaproject.dao.impl.FollowerImpl;
import com.qaproject.entity.Follower;
import com.qaproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by TADUCTUNG on 08-Jun-15.
 */
@Controller
public class TeacherController {
    @Autowired
    FollowerDao followerDao;
    @RequestMapping(value = "/followTeacher/",method = RequestMethod.GET)
    @ResponseBody
    public String followTeacher(Model model, @RequestParam(value = "teacherId")String teacherId,
                                HttpServletRequest request) {
        HttpSession session =  request.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null){
            return "NG";
        }
        Follower follower = new Follower();
        follower.setFollowerId(user);
        follower.setTeacherId(new User(Integer.parseInt(teacherId)));
        try {
            followerDao.persist(follower);
        } catch (Exception e){
            return "NG";
        }
        return "OK";
    }
    @RequestMapping(value = "/unfollowTeacher/",method = RequestMethod.GET)
    @ResponseBody
    public String unfollowTeacher(Model model, @RequestParam(value = "teacherId")String teacherId,
                                HttpServletRequest request) {
        HttpSession session =  request.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null){
            return "NG";
        }
        Follower follower = followerDao.findByTeacherId(Integer.parseInt(teacherId), user);
        try {
            followerDao.delete(follower);
        } catch (Exception e){
            return "NG";
        }
        return "OK";
    }
    @RequestMapping(value = "/teacherdashboard",method = RequestMethod.GET)
        public String teacherdashboard(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession();// Phan quyen user
        User user = (User) session.getAttribute("user");
        if(user.getRoleId().getId()==1){
            return "403";
        }
        return "teacherdashboard";
    }

}
