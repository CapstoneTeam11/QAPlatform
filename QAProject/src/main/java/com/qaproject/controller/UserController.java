package com.qaproject.controller;

import com.qaproject.dao.RoleDao;
import com.qaproject.dao.impl.UserDaoImpl;
import com.qaproject.dto.ClassroomDto;
import com.qaproject.dto.UserWithRoleDto;
import com.qaproject.entity.Category;
import com.qaproject.entity.Role;
import com.qaproject.entity.User;
import com.sun.javafx.sg.PGShape;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by TADUCTUNG on 31-May-15.
 */
@Controller
public class UserController {
    @Autowired
    UserDaoImpl userDao;
    @Autowired
    RoleDao roleDao;

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(@ModelAttribute("userWithRole")UserWithRoleDto userRole) {
        System.out.print(userRole.toString());
        User user = new User();
        user.setAboutMe("hehe");
        user.setEmail(userRole.getEmail());
        user.setPassword(userRole.getPassword());
        if(userRole.getRole().equalsIgnoreCase("student")){
           user.setRoleId(roleDao.find(1));
        }else{
            user.setRoleId(roleDao.find(2));
        }

        userDao.persist(user);
        return "notification";
    }
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, Model model, HttpServletRequest request){
        if (username == null || password == null){
            return "NG";
        }
        List<User> users = userDao.login(username, password);
        if(users.size()>0){
            HttpSession session = request.getSession();
            session.setAttribute("user", users.get(0));
            return "OK";
        }else{
            return "NG";
        }
    }
    @RequestMapping(value = "/a",method = RequestMethod.GET)
    public String a() {
        return "a";
    }
}
