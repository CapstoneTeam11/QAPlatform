package com.qaproject.controller;

import com.qaproject.dao.ClassroomUserDao;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.ClassroomUser;
import com.qaproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * Created by Minh on 6/10/2015.
 */
@Controller
public class RequestInviteController {
    @Autowired
    HttpSession session;
    @Autowired
    ClassroomUserDao classroomUserDao;

    @RequestMapping(value = "/acceptRequest",method = RequestMethod.POST)
    public String acceptRequest(@RequestParam Integer requestId,
                                @RequestParam Integer ownerClassroomId,
                                @RequestParam Integer currentClassroomId,
                         ModelMap model) {
        //Check is User
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return "redirect:/";
        }

        //Check current User is classroom's owner
        if(user.getId()!=ownerClassroomId) {
            return "redirect:/classroom/"+currentClassroomId;
        }

        ClassroomUser classroomUser = classroomUserDao.find(requestId);
        if (classroomUser!=null) {
            classroomUser.setApproval(1);
            classroomUserDao.merge(classroomUser);
        }

        return "redirect:/classroom/"+currentClassroomId;
    }
}
