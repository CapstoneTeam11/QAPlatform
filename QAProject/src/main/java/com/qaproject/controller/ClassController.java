package com.qaproject.controller;

import com.qaproject.dao.CategoryDao;
import com.qaproject.dao.ClassroomDao;
import com.qaproject.dao.ClassroomUserDao;
import com.qaproject.dao.TagClassroomDao;
import com.qaproject.dao.impl.*;
import com.qaproject.dto.UserWithRoleDto;
import com.qaproject.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by TADUCTUNG on 03-Jun-15.
 */

@Controller
public class ClassController {
    @Autowired
    ClassroomDaoImpl classroomDao;
    @Autowired
    TagClassroomDaoImpl tagClassroomDao;
    @Autowired
    TagDaoImpl tagDao;
    @Autowired
    CategoryDaoImpl categoryDao;
    @Autowired
    ClassroomUserDaoImpl classroomUserDao;
    @Autowired
    UserDaoImpl userDao;
    @RequestMapping(value = "/createClass",method = RequestMethod.GET)
    public String createClass(ModelMap model) {
        List<Category> categoryList = categoryDao.findAll();
        model.addAttribute("categories",categoryList);
        return "createClass";
    }
    @RequestMapping(value= "/createClass1",method= RequestMethod.GET)
    @ResponseBody
    public String register(@RequestParam("classroomName") String classroomName,@RequestParam("classroomDescription") String classroomDescription,
                           @RequestParam("categoryId") String categoryId, @RequestParam("tag") String tag, Model model) {

        Classroom room = new Classroom();
        Category category = new Category();
        category.setId(Integer.parseInt(categoryId));
        room.setCategoryId(category);
        room.setClassroomDescription(classroomDescription);
        room.setClassroomName(classroomName);
        classroomDao.persist(room);
        String[] tagList = tag.split(",");
        for (int i = 0; i<= tagList.length-1; i++){
            TagClassroom tagClassroom = new TagClassroom();
            tagClassroom.setClassroomId(room);
            String tagName = tagList[i].trim();
            Tag tagFind = tagDao.tagsByName(tagName).get(0);
            if(tagFind == null){
                Tag tagNew = new Tag();
                tagNew.setTagName(tagName);
                tagNew.setTagCount(0);
                tagDao.persist(tagNew);
                tagFind = tagNew;
            }
            tagClassroom.setTagId(tagFind);
            tagClassroomDao.persist(tagClassroom);
            tagFind.setTagCount(tagFind.getTagCount()+1);
            tagDao.merge(tagFind);
        }

        return "OK";
    }
    @RequestMapping(value= "/requestJoinClass/{id}",method= RequestMethod.GET)
    @ResponseBody
    public String requestJoinClass(@PathVariable("id") String classroomId, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        if (user == null){
            return "NG";
        }
        ClassroomUser classroomUser = new ClassroomUser();
        Classroom classroom = new Classroom();
        classroom.setId(Integer.parseInt(classroomId));
        classroomUser.setClassroomId(classroom);
        classroomUser.setUserId(user);
        classroomUser.setType(1);
        try{
            classroomUserDao.persist(classroomUser);
        }catch (Exception e){
            return "NG";
        }
        return "OK";
    }
    @RequestMapping(value= "/inviteJoinClass/{id}",method= RequestMethod.POST)
    @ResponseBody
    public String inviteJoinClass(@RequestParam("studentName") String studentName, @PathVariable("id") String classroomId,
                                  Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String[] listStudentName = studentName.split(",");
        boolean flag = false;
        for (int i =0; i< listStudentName.length; i++){
            User user = userDao.find(studentName);
            if( user!=null ){
                ClassroomUser classroomUser = new ClassroomUser();
                Classroom classroom = new Classroom();
                classroom.setId(Integer.parseInt(classroomId));
                classroomUser.setClassroomId(classroom);
                classroomUser.setUserId(user);
                classroomUser.setType(2);
                classroomUserDao.persist(classroomUser);
            }else{
                flag = true;
            }
        }
        if (flag){
            return "NG";
        }
        return "OK";
    }
}
