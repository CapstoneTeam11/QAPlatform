package com.qaproject.controller;

import com.qaproject.dao.FollowerDao;
import com.qaproject.dao.UserDao;
import com.qaproject.dto.ClassroomDto;
import com.qaproject.dto.ClassroomInvitationDto;
import com.qaproject.dto.FollowerDto;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.ClassroomUser;
import com.qaproject.entity.User;
import com.qaproject.util.DashboardUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by TADUCTUNG on 10-Jun-15.
 */
@Controller
public class StudentController {
    @Autowired
    UserDao userDao;
    @Autowired
    FollowerDao followerDao;
    @Autowired
    DashboardUtilities dashboardUtilities;

    @RequestMapping(value = "/studentdashboard",method = RequestMethod.GET)
    public String studentdashboard(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession();// Phan quyen user
        User user = (User) session.getAttribute("user");
        if(user.getRoleId().getId()==2){
            return "403";
        }

        List<FollowerDto> followedTeachers = dashboardUtilities.loadFollowedTeachers(user.getId(), 0);
        List<ClassroomDto> joinedClassrooms = dashboardUtilities.loadJoinedClassrooms(user.getId(), 0);
        List<ClassroomInvitationDto> invitations = dashboardUtilities.loadClassroomInvitations(user.getId(),0);

        if (followedTeachers.size()==0 && joinedClassrooms.size()==0 && invitations.size()==0){
            return "studentdashboardWelcome";
        }
        model.addAttribute("invitations",invitations);
        model.addAttribute("followedTeachers", followedTeachers);
        model.addAttribute("joinedClassrooms", joinedClassrooms);
        return "studentdashboard";
    }

}
