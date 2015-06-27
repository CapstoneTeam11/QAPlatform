package com.qaproject.controller;

import com.qaproject.dao.PostDao;
import com.qaproject.dao.PostInvitationDao;
import com.qaproject.dao.UserDao;
import com.qaproject.entity.Post;
import com.qaproject.entity.PostInvitation;
import com.qaproject.entity.User;
import com.qaproject.util.Constant;
import com.qaproject.util.NotificationUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by khangtnse60992 on 6/10/2015.
 */
@Controller
public class PostInvitationController {

    @Autowired
    PostInvitationDao postInvitationDao;

    @Autowired
    UserDao userDao;

    @Autowired
    PostDao postDao;

    @Autowired
    HttpSession session;

    @Autowired
    NotificationUtilities notificationUtilities;

    @RequestMapping(value = "/teacherInvitation",method = RequestMethod.POST)
    public String teacherInvitation(@RequestParam List<Integer> userId,
                                    @RequestParam("postId") Integer postId) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/";
        }

        //authorize
        Post post = postDao.find(postId);
        for (int i = 0; i < userId.size(); i++) {
            User teacher = userDao.find(userId.get(i));
            PostInvitation postInvitation = new PostInvitation();
            postInvitation.setPostId(post);
            postInvitation.setTeacherId(teacher);
            postInvitationDao.persist(postInvitation);
        }

        //Notification - MinhKH
        User sender = userDao.find(user.getId());
        Post object = post;
        if (object!=null) {
            List<PostInvitation> postInvitations = postInvitationDao.findLastInvitationsByTeachers(userId);
            List<User> receivers = new ArrayList<User>();
            if (postInvitations!=null) {
                for (PostInvitation postInvitation:postInvitations) {
                    receivers.add(postInvitation.getTeacherId());
                }
            }
            notificationUtilities.insertNotification(receivers,sender,object.getId(),
                    Constant.NT_INVITE_TO_ANSWER_POST, Constant.IV_FALSE);
        }

        return "redirect:/post/view/"+postId;
    }

    @RequestMapping(value = "/removeInvitation",method = RequestMethod.POST)
    @ResponseBody
    public String removeInvitation(@RequestParam Integer invitationId) {
        //authorize
        PostInvitation postInvitation = postInvitationDao.find(invitationId);
        try {
            postInvitationDao.delete(postInvitation);
        } catch (Exception e){
            return "NG";
        }
        return "OK";
    }
}
