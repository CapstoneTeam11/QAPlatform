package com.qaproject.controller;

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
    @RequestMapping(value = "/studentdashboard",method = RequestMethod.GET)
    public String studentdashboard(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession();// Phan quyen user
        User user = (User) session.getAttribute("user");
        if(user.getRoleId().getId()==2){
            return "403";
        }
        List<Follower> followers = user.getListTeacherFollow();
        List<Classroom> joinedClassrooms = new ArrayList<Classroom>();
        List<ClassroomUser> classroomUsers = user.getClassroomUserList();
        for (int i=0; i<classroomUsers.size();i++){
            joinedClassrooms.add(classroomUsers.get(i).getClassroomId());
        }
        if (followers.size()==0 && joinedClassrooms.size()==0){
            return "studentdashboardWelcome";
        }
        model.addAttribute("followers", followers);
        model.addAttribute("joinedClassrooms", joinedClassrooms);
        return "studentdashboard";
    }
}
