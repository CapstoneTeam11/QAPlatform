package com.qaproject.controller;

import com.qaproject.dao.RoleDao;
import com.qaproject.dao.impl.CategoryDaoImpl;
import com.qaproject.dao.impl.UserDaoImpl;
import com.qaproject.dto.StudentDto;
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

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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
    @Autowired
    CategoryDaoImpl categoryDao;
    @RequestMapping(value = "/editProfile",method = RequestMethod.GET)
    public String editProfile(Model model, HttpServletRequest request) {
        HttpSession session =  request.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null){
            return "welcome";
        }
        List<Category> categoryList = categoryDao.findAll();
        model.addAttribute("categories",categoryList);
        model.addAttribute("user", user);
        return "editProfile";
    }
    @RequestMapping(value = "/editProfileData",method = RequestMethod.POST)
    @ResponseBody
    public String editProfileData( @RequestParam("displayName") String displayName, @RequestParam("cate") String cate,
                                   @RequestParam("aboutMe") String aboutMe, Model model, HttpServletRequest request) {
        HttpSession session =  request.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null){
            return "NG";
        }
        user.setCategoryId(new Category(Integer.parseInt(cate)));
        user.setAboutMe(aboutMe);
        user.setDisplayName(displayName);
        try {
            userDao.merge(user);
        } catch (Exception e){
            return "NG";
        }
        return "OK";
    }
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

    /**
     *
     * @param classroomId: class id
     * @param username: student name to suggest email
     * @param response
     * @return list all student not in class
     */
    @RequestMapping(value = "/findAllStudentNotInClass/{id}/{username}",method = RequestMethod.GET)
    @ResponseBody
    public List<StudentDto> findAllStudentNotInClass(@PathVariable("id") String classroomId,@PathVariable("username") String username, HttpServletResponse response) {
        List<User> userList = userDao.findAllStudentNotInClass(Integer.parseInt(classroomId), username);
        List<StudentDto> userNameList = new ArrayList<StudentDto>();
        for (int i = 0; i < userList.size(); i++) {
            userNameList.add(new StudentDto(userList.get(i).getEmail(), userList.get(i).getId()));
        }
        response.addHeader("Access-Control-Allow-Origin", "*");
        return userNameList;
    }
    @RequestMapping(value = "/findAllStudent/{username}",method = RequestMethod.GET)
    @ResponseBody
    public List<StudentDto> findAllStudent(@PathVariable("username") String username, HttpServletResponse response) {
        List<User> userList = userDao.findAllStudent(username);
        List<StudentDto> userNameList = new ArrayList<StudentDto>();
        for (int i = 0; i < userList.size(); i++) {
            userNameList.add(new StudentDto(userList.get(i).getEmail(), userList.get(i).getId()));
        }
        response.addHeader("Access-Control-Allow-Origin", "*");
        return userNameList;
    }
    @RequestMapping(value = "/getProfile",method = RequestMethod.GET)
    public String getProfile(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        model.addAttribute("userProfile", user);
        return "profile";
    }
}
