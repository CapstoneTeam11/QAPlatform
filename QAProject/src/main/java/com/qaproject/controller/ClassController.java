package com.qaproject.controller;

import com.qaproject.dao.*;
import com.qaproject.dto.*;
import com.qaproject.entity.*;
import com.qaproject.util.*;
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
    FollowerDao followerDao;
    @Autowired
    NotificationUtilities notificationUtilities;
    @Autowired
    DashboardUtilities dashboardUtilities;
    @Autowired
    ClassroomUtilities classroomUtilities;
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
    public String createClass(@RequestParam("classroomName") String classroomName,
                           @RequestParam("classroomDescription") String classroomDescription,
                           @RequestParam("categoryId") String categoryId,
                           @RequestParam("tag") String tag,
                           @RequestParam(value = "newTag", required = false)  List<String> newTag,
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
        room.setStatus(1);
        classroomDao.persist(room);
        String[] tagList = tag.split(",");
        for (int i = 0; i<= tagList.length-1; i++){
            if(Integer.parseInt(tagList[i].trim())>0){
                TagClassroom tagClassroom = new TagClassroom();
                tagClassroom.setClassroomId(room);
                String tagId = tagList[i].trim();
                Tag tagFind = tagDao.find(Integer.parseInt(tagId));
                tagClassroom.setTagId(tagFind);
                tagClassroomDao.persist(tagClassroom);
                tagFind.setTagCount(tagFind.getTagCount()+1);
                tagDao.merge(tagFind);
            }
        }
        if (newTag != null) {
            for (int i = 0; i < newTag.size(); i++) {
                Tag tagNew = new Tag();
                tagNew.setTagName(newTag.get(i));
                tagNew.setTagCount(0);
                tagDao.persist(tagNew);
                TagClassroom tagClassroom = new TagClassroom();
                tagClassroom.setClassroomId(room);
                tagClassroom.setTagId(tagNew);
                tagClassroomDao.persist(tagClassroom);
                tagNew.setTagCount(tagNew.getTagCount()+1);
                tagDao.merge(tagNew);
            }
        }
        String[] listStudentId = studentList.split(",");
        boolean flag = false;
        for (int i =0; i< listStudentId.length; i++){
                // make unique row invite
                List<ClassroomUser> checkClassromUsers = classroomUserDao.findByUserClassroom(user.getId(), room.getId());
                if(checkClassromUsers == null || checkClassromUsers.size()==0) {
                    ClassroomUser classroomUser = new ClassroomUser();
                    Classroom classroom = new Classroom();
                    classroom.setId(room.getId());
                    classroomUser.setClassroomId(classroom);
                    classroomUser.setUserId(new User(Integer.parseInt(listStudentId[i])));
                    classroomUser.setType(2);
                    classroomUser.setApproval(0);
                    classroomUserDao.persist(classroomUser);
                }else{
                    ClassroomUser classroomUser = checkClassromUsers.get(0);
                    classroomUser.setType(1);
                    classroomUser.setApproval(0);
                    classroomUserDao.merge(classroomUser);
                }
        }

        //Notification - MinhKH
        List<Follower> followers = followerDao.findByTeacher(user.getId());
        List<User> receivers = new ArrayList<User>();
        User sender = userDao.find(user.getId());
        Classroom object = classroomDao.findLastCreatedClassroomByOwner(sender);

        if (followers!=null) {
            for (Follower follower:followers){
                receivers.add(follower.getFollowerId());
            }
        }
        if(object!=null) {
            Integer objectId = object.getId();
            notificationUtilities.insertNotification(receivers,sender,objectId, Constant.NT_TEACHER_CREATE_CLASS,
                    Constant.IV_FALSE);
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
        // make unique row invite
        List<ClassroomUser> checkClassromUsers = classroomUserDao.findByUserClassroom(user.getId(), Integer.parseInt(classroomId));
        if(checkClassromUsers == null || checkClassromUsers.size()==0) {
            ClassroomUser classroomUser = new ClassroomUser();
            Classroom classroom = new Classroom();
            classroom.setId(Integer.parseInt(classroomId));
            classroomUser.setClassroomId(classroom);
            classroomUser.setUserId(user);
            classroomUser.setType(1);
            classroomUser.setApproval(0);
            try {
                classroomUserDao.persist(classroomUser);
            } catch (Exception e) {
                return "NG";
            }
        } else {
            ClassroomUser classroomUser = checkClassromUsers.get(0);
            classroomUser.setType(1);
            classroomUser.setApproval(0);
            classroomUserDao.merge(classroomUser);
        }

        //Notification - MinhKH
        User sender = userDao.find(user.getId());
        ClassroomUser object = classroomUserDao.findLastRequestByStudent(sender);
        if (object!=null) {
            User receiver = object.getClassroomId().getOwnerUserId();
            notificationUtilities.insertNotification(receiver,sender,object.getId(),
                    Constant.NT_REQUEST_TO_JOIN_CLASS,Constant.IV_FALSE);
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
                // make unique row invite
                List<ClassroomUser> checkClassromUsers = classroomUserDao.findByUserClassroom(user.getId(), Integer.parseInt(classroomId));
                if(checkClassromUsers == null || checkClassromUsers.size()==0){
                    ClassroomUser classroomUser = new ClassroomUser();
                    Classroom classroom = new Classroom();
                    classroom.setId(Integer.parseInt(classroomId));
                    classroomUser.setClassroomId(classroom);
                    classroomUser.setUserId(user);
                    classroomUser.setType(2);
                    classroomUser.setApproval(0);
                    classroomUserDao.persist(classroomUser);
                }else {
                    ClassroomUser classroomUser = checkClassromUsers.get(0);
                    classroomUser.setType(2);
                    classroomUser.setApproval(0);
                    classroomUserDao.merge(classroomUser);
                }
            }else{
                flag = true;
            }
        }

        User user = (User) session.getAttribute("user");
        if (user==null) {
            return "NG";
        }
        //Notification - MinhKH
        User sender = userDao.find(user.getId());
        Classroom object = classroomDao.find(Integer.parseInt(classroomId));
        List<User> receivers = new ArrayList<User>();
        if (object!=null && listStudentId!=null) {
            List<Integer> iStudentIds = new ArrayList<Integer>();
            for (int i =0 ; i<listStudentId.length; i++){
                Integer iStudentId = null;
                try {
                    iStudentId = Integer.parseInt(listStudentId[i]);
                } catch (NumberFormatException e){
                    e.printStackTrace();
                }
                iStudentIds.add(iStudentId);
            }
            List<ClassroomUser> classroomUsers = classroomUserDao.findLastInvitationsByStudents(iStudentIds);
            if (classroomUsers!=null){
                for(ClassroomUser classroomUser : classroomUsers) {
                    receivers.add(classroomUser.getUserId());
                }
            }
            notificationUtilities.insertNotification(receivers,sender,object.getId(),
                    Constant.NT_INVITE_TO_JOIN_CLASS,Constant.IV_FALSE);
        }

        if (flag){
            return "NG";
        }
        return "OK";
    }


    @RequestMapping(value = "/classroom/{id}",method = RequestMethod.GET)
    public String classroom(ModelMap model, @PathVariable(value = "id")Integer id) {
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return "redirect:403";
        }
        Classroom classroom = classroomDao.find(id);
        int idOwner = classroom.getOwnerUserId().getId();
        User ownerClassroom = userDao.find(idOwner);

        //get questions, articles, materials, request to join - MinhKH
        List<PostDto> questions = classroomUtilities.loadQuestions(id, 0);
        List<PostDto> articles = classroomUtilities.loadArticles(id,0);
        List<MaterialDto> materials = classroomUtilities.loadMaterials(id,0);
        List<RequestDto> requests = classroomUtilities.loadRequests(id,0);
        List<StudentDto> students = classroomUtilities.loadStudents(id,0);



        if (questions.size()==0 && articles.size()==0 && materials.size()==0 && requests.size()==0
                && students.size() ==0) {
            model.addAttribute("classroom", classroom);
            model.addAttribute("userOwner", ownerClassroom);
            model.addAttribute("user", user);
            return "classroomWelcome";
        }


        // check if acceptRequest or not
        List<ClassroomUser> checkClassroomUsers = classroomUserDao.findByUserClassroom(user.getId(), id);
        ClassroomUser checkClassroomUser = null;
        if(checkClassroomUsers != null && checkClassroomUsers.size()>0){
            checkClassroomUser = checkClassroomUsers.get(0);
        }
        model.addAttribute("questions",questions);
        model.addAttribute("articles",articles);
        model.addAttribute("materials",materials);
        model.addAttribute("requests",requests);
        model.addAttribute("students",students);
        model.addAttribute("classroom", classroom);
        model.addAttribute("userOwner", ownerClassroom);
        model.addAttribute("user", user);
        model.addAttribute("checkClassroomUser", checkClassroomUser);
        return "classroom";
    }

    @RequestMapping(value = "/classroom/question",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<PostDto> loadMoreQuestion(@RequestParam Integer classroomId, @RequestParam Integer nextFrom) {
        List<PostDto> questionDtos = new ArrayList<PostDto>();
        try {
            questionDtos = classroomUtilities.loadQuestions(classroomId,nextFrom);
        } catch (Exception e){

        }
        return questionDtos;
    }

    @RequestMapping(value = "/classroom/article",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<PostDto> loadMoreArticle(@RequestParam Integer classroomId, @RequestParam Integer nextFrom) {
        List<PostDto> articleDtos = new ArrayList<PostDto>();
        try {
            articleDtos = classroomUtilities.loadArticles(classroomId, nextFrom);
        } catch (Exception e){

        }
        return articleDtos;
    }

    @RequestMapping(value = "/classroom/material",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<MaterialDto> loadMoreMaterial(@RequestParam Integer classroomId, @RequestParam Integer nextFrom) {
        List<MaterialDto> materialDtos = new ArrayList<MaterialDto>();
        try {
            materialDtos = classroomUtilities.loadMaterials(classroomId, nextFrom);
        } catch (Exception e){

        }
        return materialDtos;
    }

    @RequestMapping(value = "/classroom/request",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<RequestDto> loadMoreRequest(@RequestParam Integer classroomId, @RequestParam Integer nextFrom) {
        List<RequestDto> requestDtos = new ArrayList<RequestDto>();
        try {
            requestDtos = classroomUtilities.loadRequests(classroomId, nextFrom);
        } catch (Exception e){

        }
        return requestDtos;
    }

    @RequestMapping(value = "/classroom/student",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<StudentDto> loadMoreStudent(@RequestParam Integer classroomId, @RequestParam Integer nextFrom) {
        List<StudentDto> studentDtos = new ArrayList<StudentDto>();
        try {
            studentDtos = classroomUtilities.loadStudents(classroomId, nextFrom);
        } catch (Exception e){

        }
        return studentDtos;
    }



    /**
     *
     * @param model
     * @param id
     * @param type: 0 close class, 1 open class
     * @return
     */
    @RequestMapping(value = "/openCloseClass",method = RequestMethod.POST)
    @ResponseBody
    public ReturnObjectWithStatus closeClass(ModelMap model, @RequestParam(value = "classId") String id,
                                             @RequestParam(value = "type") String type) {
        //Check is User
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return new ReturnObjectWithStatus("NG", 0); //no session
        }
        Classroom classroom = classroomDao.find(Integer.parseInt(id));

        if(classroom.getOwnerUserId().getId() !=  user.getId()){
            return new ReturnObjectWithStatus("NG", classroom.getId()); //not owner
        }
        if(Integer.parseInt(type) == 1){
            classroom.setStatus(1);
            classroomDao.merge(classroom);
        }else{
            classroom.setStatus(0);
            classroomDao.merge(classroom);
        }
        return new ReturnObjectWithStatus("OK", classroom.getId());
    }

    @RequestMapping(value = "dashboard/joinedClassroom/{lastId}",produces = "application/json",
            method = RequestMethod.GET)
    public @ResponseBody
    List<ClassroomDto> loadJoinedClassroom(@PathVariable Integer lastId) {
        User user = (User) session.getAttribute("user");
        List<ClassroomDto> classroomDtos = null;
        try {
            classroomDtos = dashboardUtilities.loadJoinedClassrooms(user.getId(), lastId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return classroomDtos;
    }

    @RequestMapping(value = "dashboard/ownedClassroom/{lastId}",produces = "application/json",
            method = RequestMethod.GET)
    public @ResponseBody
    List<ClassroomDto> loadOwnedClassroom(@PathVariable Integer lastId) {
        User user = (User) session.getAttribute("user");
        List<ClassroomDto> classroomDtos = null;
        try {
            classroomDtos = dashboardUtilities.loadOwnedClassrooms(user.getId(), lastId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return classroomDtos;
    }

    @RequestMapping(value = "dashboard/classroomInvitation/{nextFrom}",produces = "application/json",
            method = RequestMethod.GET)
    public @ResponseBody
    List<ClassroomInvitationDto> loadClassroomInvitation(@PathVariable Integer nextFrom) {
        User user = (User) session.getAttribute("user");
        List<ClassroomInvitationDto> classroomInvitationDtos = null;
        try {
            classroomInvitationDtos = dashboardUtilities.loadClassroomInvitations(user.getId(), nextFrom);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return classroomInvitationDtos;
    }

    @RequestMapping(value = "/ignoreInvitation",method = RequestMethod.POST)
    @ResponseBody
    public String ignoreInvitation(@RequestParam Integer invitationId) {
        //authorize
        ClassroomUser classroomUser = classroomUserDao.find(invitationId);
        try {
            classroomUser.setApproval(2); // 2 = ignore
            classroomUserDao.merge(classroomUser);
        } catch (Exception e){
            return "NG";
        }
        return "OK";
    }

    @RequestMapping(value = "/confirmInvitation",method = RequestMethod.POST)
    @ResponseBody
    public String confirmInvitation(@RequestParam Integer invitationId) {
        //authorize
        ClassroomUser classroomUser = classroomUserDao.find(invitationId);
        String classroomDescription = "";
        try {
            classroomUser.setApproval(1); // 1 = confirm
            classroomUserDao.merge(classroomUser);
            classroomDescription = classroomUser.getClassroomId().getClassroomDescription();
        } catch (Exception e){
            return "";
        }
        return classroomDescription;
    }

    @RequestMapping(value = "/leaveClassroom",method = RequestMethod.POST)
    @ResponseBody
    public String leaveClassroom(@RequestParam Integer classroomId) {
        //authorize
        User user = (User) session.getAttribute("user");
        ClassroomUser classroomUser = classroomUserDao.findJoinedClassroomByClassroomAndUser(user.getId(),classroomId);
        try {
            classroomUserDao.delete(classroomUser);
        } catch (Exception e){
            return "NG";
        }
        return "OK";
    }
}



