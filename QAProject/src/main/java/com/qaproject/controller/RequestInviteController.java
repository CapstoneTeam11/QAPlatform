package com.qaproject.controller;

import com.qaproject.dao.ClassroomUserDao;
import com.qaproject.dto.ReturnObjectWithStatus;
import com.qaproject.entity.ClassroomUser;
import com.qaproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

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
    @ResponseBody
    public ReturnObjectWithStatus acceptRequest(@RequestParam Integer requestId,
                                @RequestParam Integer ownerClassroomId,
                                @RequestParam Integer currentClassroomId,
                         ModelMap model) {
        //Check is User
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return new ReturnObjectWithStatus("NG", 0); //no session
        }

        //Check current User is classroom's owner
        if(user.getId()!=ownerClassroomId) {
            return new ReturnObjectWithStatus("NG", currentClassroomId); //not owner
        }

        ClassroomUser classroomUser = classroomUserDao.find(requestId);
        if (classroomUser!=null) {
            classroomUser.setApproval(1);
            classroomUserDao.merge(classroomUser);
        }

        return new ReturnObjectWithStatus("OK", currentClassroomId);
    }

    @RequestMapping(value = "/ignoreRequest",method = RequestMethod.POST)
    @ResponseBody
    public ReturnObjectWithStatus ingoreRequest(@RequestParam Integer requestId,
                                                @RequestParam Integer ownerClassroomId,
                                                @RequestParam Integer currentClassroomId,
                                                ModelMap model) {
        //Check is User
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return new ReturnObjectWithStatus("NG", 0); //no session
        }

        //Check current User is classroom's owner
        if(user.getId()!=ownerClassroomId) {
            return new ReturnObjectWithStatus("NG", currentClassroomId); //not owner
        }

        ClassroomUser classroomUser = classroomUserDao.find(requestId);
        if (classroomUser!=null) {
            classroomUser.setApproval(2);
            classroomUserDao.merge(classroomUser);
        }

        return new ReturnObjectWithStatus("OK", currentClassroomId);
    }
    @RequestMapping(value = "/removeStudent",method = RequestMethod.POST)
    @ResponseBody
    public ReturnObjectWithStatus removeStudent(@RequestParam String studentId,
                                                @RequestParam String classId,
                                                @RequestParam String ownerId,
                                                ModelMap model) {
        //Check is User
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return new ReturnObjectWithStatus("NG", 0); //no session
        }
        List<ClassroomUser> classroomUsers = classroomUserDao.findByUserClassroomWithApprove(Integer.parseInt(studentId), Integer.parseInt(classId));
        //Check current User is classroom's owner
        if(classroomUsers != null && classroomUsers.size()>0) {
            if (user.getId() != Integer.parseInt(ownerId)) {
                return new ReturnObjectWithStatus("NG", classroomUsers.get(0).getClassroomId().getId()); //not owner
            }
            classroomUsers.get(0).setApproval(2);
            classroomUserDao.merge(classroomUsers.get(0));
            return new ReturnObjectWithStatus("OK", classroomUsers.get(0).getClassroomId().getId());
        }
        else{
            return new ReturnObjectWithStatus("NG", 0); //no session
        }
    }

    /**
     * TungTD: handelClass function
     * @param type: type = 1: cancelJoinClass, type = 2: acceptInvitation, type =3: leaveClass
     * @param classId
     * @return
     */
    @RequestMapping(value = "/handleClass",method = RequestMethod.POST)
    @ResponseBody
    public ReturnObjectWithStatus leaveClass(@RequestParam Integer classId, @RequestParam Integer type) {
        //Check is User
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return new ReturnObjectWithStatus("NG", 0); //no session
        }
        List<ClassroomUser> classroomUsers = classroomUserDao.findByUserClassroom(user.getId(), classId);
        ClassroomUser classroomUser = null;
        if(classroomUsers == null){
            return new ReturnObjectWithStatus("NG", classId);
        }
        classroomUser = classroomUsers.get(0);
        //Check current User is classroom's owner
        if(user.getId()!= classroomUser.getUserId().getId()) {
            return new ReturnObjectWithStatus("NG", classId); //not owner
        }


        if (classroomUser!=null) {
            if (type == 1){ //type = 1: cancelJoinClass
                classroomUserDao.remove(classroomUser);
            } else if (type == 2){ //type = 2: acceptInvitation
                classroomUser.setApproval(1);
                classroomUserDao.merge(classroomUser);
            } else if (type == 3){
                classroomUser.setApproval(2);
                classroomUserDao.merge(classroomUser);
            }
        }

        return new ReturnObjectWithStatus("OK", classId);
    }

}
