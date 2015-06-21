package com.qaproject.controller;

import com.qaproject.dao.FollowerDao;
import com.qaproject.dao.UserDao;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.ClassroomUser;
import com.qaproject.entity.Follower;
import com.qaproject.entity.User;
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

    @RequestMapping(value = "/studentdashboard",method = RequestMethod.GET)
    public String studentdashboard(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession();// Phan quyen user
        User user = (User) session.getAttribute("user");
        if(user.getRoleId().getId()==2){
            return "403";
        }

        //get currentUser for updated classrooms, followers and invitation
        User currentUser = userDao.find(user.getId());

        List<Follower> followedTeachers = followerDao.findByFollower(currentUser);
        List<Classroom> classrooms = new ArrayList<Classroom>();
        List<ClassroomUser> classroomUsers = currentUser.getClassroomUserList();
        List<ClassroomUser> invitations = new ArrayList<ClassroomUser>();

        for (int i=0; i<classroomUsers.size();i++){
            ClassroomUser currentClassroomUser = classroomUsers.get(i);
            if (currentClassroomUser.getApproval()==0 && currentClassroomUser.getType()==2) {
                invitations.add(currentClassroomUser);
            }
            if (currentClassroomUser.getApproval()==1){
                classrooms.add(currentClassroomUser.getClassroomId());
            }
        }
        if (followedTeachers.size()==0 && classrooms.size()==0 && invitations.size()==0){
            return "studentdashboardWelcome";
        }
        model.addAttribute("invitations",invitations);
        model.addAttribute("followedTeachers", followedTeachers);
        model.addAttribute("classrooms", classrooms);
        return "studentdashboard";
    }

}
