package com.qaproject.controller;

import com.qaproject.dao.PostDao;
import com.qaproject.dao.PostInvitationDao;
import com.qaproject.dao.UserDao;
import com.qaproject.entity.Post;
import com.qaproject.entity.PostInvitation;
import com.qaproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
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

    @RequestMapping(value = "/teacherInvitation",method = RequestMethod.POST)
    public String teacherInvitation(@RequestParam List<Integer> userId,
                                    @RequestParam("postId") Integer postId) {
        //authorize
        Post post = postDao.find(postId);
        for (int i = 0; i < userId.size(); i++) {
            User user = userDao.find(userId.get(i));
            PostInvitation postInvitation = new PostInvitation();
            postInvitation.setPostId(post);
            postInvitation.setTeacherId(user);
            postInvitationDao.persist(postInvitation);
        }
        return "redirect:/post/view"+postId;
    }
}
