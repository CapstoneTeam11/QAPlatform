package com.qaproject.controller;

import com.qaproject.dao.impl.UserDaoImpl;
import com.qaproject.dto.UserWithRoleDto;
import com.qaproject.entity.Category;
import com.qaproject.entity.Role;
import com.qaproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by TADUCTUNG on 31-May-15.
 */
@Controller
public class UserController {
    @Autowired
    UserDaoImpl userDao;
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(@ModelAttribute("userWithRole")UserWithRoleDto userRole) {
        System.out.print(userRole.toString());
        User user = new User();
        user.setAboutMe("hehe");

        user.setEmail(userRole.getEmail());
        user.setPassword(userRole.getPassword());
        if(userRole.getRole().equalsIgnoreCase("student")){
           user.setRoleId(new Role(1));
        }else{
            user.setRoleId(new Role(2));
        }

        userDao.persist(user);
        return "notification";
    }
}
