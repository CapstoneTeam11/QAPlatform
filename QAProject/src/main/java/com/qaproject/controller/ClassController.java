package com.qaproject.controller;

import com.qaproject.dao.*;
import com.qaproject.dao.impl.*;
import com.qaproject.dto.ReturnObjectWithStatus;
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
    ClassroomDao classroomDao;
    @Autowired
    TagClassroomDao tagClassroomDao;
    @Autowired
    TagDao tagDao;
    @Autowired
    CategoryDao categoryDao;
    @Autowired
    ClassroomUserDao classroomUserDao;
    @Autowired
    UserDao userDao;
    @Autowired
    HttpSession session;

    @RequestMapping(value = "/createClass",method = RequestMethod.GET)
    public String createClass(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        if(user == null){
            return "welcome";
        }else if(user.getRoleId().getId()==1){
            return "redirect:403";
        }
        List<Category> categoryList = categoryDao.findAll();
        model.addAttribute("categories",categoryList);
        model.addAttribute("user",user);
        return "createClass";
    }
    @RequestMapping(value= "/createClass1",method= RequestMethod.POST)
//    @ResponseBody
    public String register(
                           @RequestParam("classroomName") String classroomName,
                           @RequestParam("classroomDescription") String classroomDescription,
                           @RequestParam("categoryId") String categoryId,
                           @RequestParam("tag") String tag,
                           @RequestParam("studentList") String studentList, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
//        ReturnObjectWithStatus objectWithStatus =new ReturnObjectWithStatus();
        if(user == null){
//            objectWithStatus.setStatus("NG");
            return "redirect:403";
        }else if(user.getRoleId().getId()==1){
//            objectWithStatus.setStatus("403");
            return "redirect:403";
        }
        Classroom room = new Classroom();
        Category category = new Category();
        category.setId(Integer.parseInt(categoryId));
        room.setCategoryId(category);
        room.setClassroomDescription(classroomDescription);
        room.setClassroomName(classroomName);
        room.setOwnerUserId(user);
        classroomDao.persist(room);
        String[] tagList = tag.split(",");
        for (int i = 0; i<= tagList.length-1; i++){
            TagClassroom tagClassroom = new TagClassroom();
            tagClassroom.setClassroomId(room);
            String tagId = tagList[i].trim();
            Tag tagFind = tagDao.find(Integer.parseInt(tagId));
//            if(tagFind == null){
//                Tag tagNew = new Tag();
//                tagNew.setTagName(tagName);
//                tagNew.setTagCount(0);
//                tagDao.persist(tagNew);
//                tagFind = tagNew;
//            }
            tagClassroom.setTagId(tagFind);
            tagClassroomDao.persist(tagClassroom);
            tagFind.setTagCount(tagFind.getTagCount()+1);
            tagDao.merge(tagFind);
        }
        String[] listStudentId = studentList.split(",");
        boolean flag = false;
        for (int i =0; i< listStudentId.length; i++){
                ClassroomUser classroomUser = new ClassroomUser();
                Classroom classroom = new Classroom();
                classroom.setId(room.getId());
                classroomUser.setClassroomId(classroom);
                classroomUser.setUserId(new User(Integer.parseInt(listStudentId[i])));
                classroomUser.setType(2);
                classroomUser.setApproval(0);
                classroomUserDao.persist(classroomUser);
        }

//        objectWithStatus.setId(room.getId());
//        objectWithStatus.setStatus("OK");
        return "redirect:/classroom/"+room.getId();
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
        classroomUser.setApproval(0);
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
        String[] listStudentId = studentName.split(",");
        boolean flag = false;
        for (int i =0; i< listStudentId.length; i++){
            User user = userDao.find(Integer.parseInt(listStudentId[i]));
            if( user!=null ){
                ClassroomUser classroomUser = new ClassroomUser();
                Classroom classroom = new Classroom();
                classroom.setId(Integer.parseInt(classroomId));
                classroomUser.setClassroomId(classroom);
                classroomUser.setUserId(user);
                classroomUser.setType(2);
                classroomUser.setApproval(0);
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


    @RequestMapping(value = "/classroom/{id}",method = RequestMethod.GET)
    public String classroom(ModelMap model, @PathVariable(value = "id") String id) {
        User userSession = (User) session.getAttribute("user");
        if(userSession==null) {
            return "redirect:403";
        }
        Classroom classroom = classroomDao.find(Integer.parseInt(id));
        int idOwner = classroom.getOwnerUserId().getId();
        User user = userDao.find(idOwner);

        //get posts, materials, request to join - MinhKH
        List<Post> posts = classroom.getPostList();
        List<Material> materials = classroom.getMaterialList();
        List<ClassroomUser> classroomUsers = classroomUserDao.findByClassroom(classroom);


        //classify classroomUser - MinhKH
        List<ClassroomUser> joinRequests = new ArrayList<ClassroomUser>();
        List<ClassroomUser> students = new ArrayList<ClassroomUser>();
        for (int i=0;i<classroomUsers.size();i++){
            ClassroomUser currentClassroomUser = classroomUsers.get(i);
            if(currentClassroomUser.getType()==1&&currentClassroomUser.getApproval()==0){
                joinRequests.add(currentClassroomUser);
            }
            if (currentClassroomUser.getApproval()==2) {
                students.add(currentClassroomUser);
            }
        }

        if (posts.size()==0 && materials.size()==0 && joinRequests.size()==0 && students.size()==0) {
            model.addAttribute("classroom", classroom);
            model.addAttribute("userOwner", user);
            model.addAttribute("user", userSession);
            return "classroomWelcome";
        }

        //classify post - MinhKH
        List<Post> questions = new ArrayList<Post>();
        List<Post> articles = new ArrayList<Post>();
        for (int i=0; i<posts.size();i++){
            Post currentPost = posts.get(i);
            if (currentPost.getPostType()==1){
                questions.add(currentPost);
            }
            if (currentPost.getPostType()==2){
                articles.add(currentPost);
            }
        }

        model.addAttribute("questions",questions);
        model.addAttribute("articles",articles);
        model.addAttribute("materials",materials);
        model.addAttribute("joinRequests",joinRequests);
        model.addAttribute("students",students);
        model.addAttribute("classroom", classroom);
        model.addAttribute("userOwner", user);
        model.addAttribute("user", userSession);
        return "classroom";
    }

}



