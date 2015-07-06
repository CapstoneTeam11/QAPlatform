package com.qaproject.controller;

import com.qaproject.dao.*;
import com.qaproject.dto.*;
import com.qaproject.entity.*;
import com.qaproject.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
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
    @Autowired
    NotificationDao notificationDao;
    @Autowired
    SimpMessagingTemplate template;

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
    @RequestMapping(value= "/createClass",method= RequestMethod.POST)
//    @ResponseBody
    public String createClass(@RequestParam("classroomName") String classroomName,
                           @RequestParam("classroomDescription") String classroomDescription,
                           @RequestParam("categoryId") String categoryId,
                           @RequestParam("tag") String tag,
                           @RequestParam(value = "newTag", required = false)  List<String> newTag,
                           @RequestParam(value = "studentList",required = false) String studentList, Model model, HttpServletRequest request) {
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
        if(classroomName.length() < 10 || classroomName.length() > 127) {
            return "createClass";
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
            User receiver = userDao.find(Integer.parseInt(listStudentId[i]));
            List<ClassroomUser> checkClassromUsers = classroomUserDao.findByUserClassroom(receiver.getId(), room.getId());
                if(checkClassromUsers == null || checkClassromUsers.size()==0) {
                    ClassroomUser classroomUser = new ClassroomUser();
                    classroomUser.setClassroomId(room);
                    classroomUser.setUserId(receiver);
                    classroomUser.setType(Constant.IA_TYPE_INVITE_STUDENT);
                    classroomUser.setApproval(Constant.IA_NOT_APPROVAL);
                    classroomUserDao.persist(classroomUser);
                    Notification notification = new Notification();
                    notification.setReceiverId(receiver);
                    notification.setSenderId(user);
                    notification.setObjectId(room.getId());
                    notification.setNotificationType(Constant.NT_INVITE_TO_JOIN_CLASS);
                    notification.setIsViewed(Constant.IV_FALSE);
                    notificationDao.persist(notification);
                    NotificationDto notificationDto  = ConvertEntityDto.convertNotificationEntityToDto(notification,notification.getNotificationType(),room);
                    template.convertAndSend("/topic/notice/" + receiver.getId(), notificationDto);
                }
        }

        //Notification - MinhKH
        List<Follower> followers = followerDao.findByTeacher(user.getId());
        User sender = userDao.find(user.getId());
        if(room!=null) {
            for (Follower receiver : followers){
                if(receiver.getId()!=user.getId()) {
                    Notification notification = new Notification();
                    notification.setReceiverId(receiver.getFollowerId());
                    notification.setSenderId(sender);
                    notification.setObjectId(room.getId());
                    notification.setNotificationType(Constant.NT_TEACHER_CREATE_CLASS);
                    notification.setIsViewed(Constant.IV_FALSE);
                    notificationDao.persist(notification);
                    NotificationDto notificationDto  = ConvertEntityDto.convertNotificationEntityToDto(notification,notification.getNotificationType(),room);
                    template.convertAndSend("/topic/notice/" + receiver.getFollowerId(), notificationDto);
                }
            }
        }

        return "redirect:/classroom/"+room.getId();
    }
    @RequestMapping(value= "/requestJoinClass",method= RequestMethod.POST)
    @ResponseBody
    public String requestJoinClass(@RequestParam Integer classroomId) {
        User user = (User)session.getAttribute("user");
        if (user == null){
            return "NG";
        }
        Classroom classroom = classroomDao.find(classroomId);
        ClassroomUser classroomUser = classroomUserDao.findClassroomByClassroomAndUser(user.getId(),classroomId);
        if (classroomUser==null) {
            classroomUser = new ClassroomUser();
        }
        classroomUser.setClassroomId(classroom);
        classroomUser.setUserId(user);
        classroomUser.setType(Constant.IA_TYPE_REQUEST_CLASS);
        classroomUser.setApproval(Constant.IA_NOT_APPROVAL);
        try {
            classroomUserDao.merge(classroomUser);
        } catch (Exception e) {
            return "NG";
        }
        Notification notification = new Notification();
        notification.setReceiverId(classroom.getOwnerUserId());
        notification.setSenderId(user);
        notification.setObjectId(classroomId);
        notification.setNotificationType(Constant.NT_REQUEST_TO_JOIN_CLASS);
        notification.setIsViewed(Constant.IV_FALSE);
        notificationDao.persist(notification);
        NotificationDto notificationDto  = ConvertEntityDto.convertNotificationEntityToDto(notification,notification.getNotificationType(),classroom);
        template.convertAndSend("/topic/notice/" + classroom.getOwnerUserId().getId(), notificationDto);


        //Notification - MinhKH
//        User sender = userDao.find(user.getId());
//        ClassroomUser object = classroomUserDao.findLastRequestByStudent(sender);
//        if (object!=null) {
//            User receiver = object.getClassroomId().getOwnerUserId();
//            notificationUtilities.insertNotification(receiver,sender,object.getId(),
//                    Constant.NT_REQUEST_TO_JOIN_CLASS,Constant.IV_FALSE);
//        }

        return "OK";
    }
    @RequestMapping(value= "/inviteJoinClass/{id}",method= RequestMethod.POST)
    @ResponseBody
    public String inviteJoinClass(@RequestParam("studentName") String studentName, @PathVariable("id") Integer classroomId,
                                  Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user==null) {
            return "NG";
        }
        String[] listStudentId = studentName.split(",");
        boolean flag = false;
        Classroom classroom = classroomDao.find(classroomId);
        for (int i =0; i< listStudentId.length; i++){
            User receiver = userDao.find(Integer.parseInt(listStudentId[i]));
            if( user!=null ){
                // make unique row invite
                List<ClassroomUser> checkClassromUsers = classroomUserDao.findByUserClassroom(receiver.getId(), classroomId);
                if(checkClassromUsers == null || checkClassromUsers.size()==0){
                    ClassroomUser classroomUser = new ClassroomUser();
                    classroomUser.setClassroomId(classroom);
                    classroomUser.setUserId(receiver);
                    classroomUser.setType(Constant.IA_TYPE_INVITE_STUDENT);
                    classroomUser.setApproval(Constant.IA_NOT_APPROVAL);
                    classroomUserDao.persist(classroomUser);
                    Notification notification = new Notification();
                    notification.setReceiverId(receiver);
                    notification.setSenderId(user);
                    notification.setObjectId(classroomId);
                    notification.setNotificationType(Constant.NT_INVITE_TO_JOIN_CLASS);
                    notification.setIsViewed(Constant.IV_FALSE);
                    notificationDao.persist(notification);
                    NotificationDto notificationDto  = ConvertEntityDto.convertNotificationEntityToDto(notification,notification.getNotificationType(),classroom);
                    template.convertAndSend("/topic/notice/" + receiver.getId(), notificationDto);
                }
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
    public String classroom(ModelMap model, @PathVariable(value = "id")Integer id) {
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return "redirect:403";
        }
        Classroom classroom = classroomDao.find(id);
        user = userDao.find(user.getId());

        //get questions, articles, materials, request to join - MinhKH
        List<PostDto> questions = classroomUtilities.loadQuestions(id, 0);
        Integer lastQuestionId = 0;
        if (questions!=null) {
            if (questions.size()>10){
                lastQuestionId = questions.get(questions.size()-2).getId();
            }
        }
        List<PostDto> articles = classroomUtilities.loadArticles(id,0);
        Integer lastArticleId = 0;
        if (articles!=null) {
            if (articles.size()>10){
                lastArticleId = articles.get(articles.size()-2).getId();
            }
        }
        List<MaterialDto> materials = classroomUtilities.loadMaterials(id,0);
        Integer lastMaterialId = 0;
        if (materials!=null) {
            if (materials.size()>10){
                lastMaterialId = materials.get(materials.size()-2).getId();
            }
        }
        List<RequestDto> requests = classroomUtilities.loadRequests(id,0);
        Integer lastRequestId = 0;
        if (requests!=null) {
            if (requests.size()>10){
                lastRequestId = requests.get(requests.size()-2).getId();
            }
        }
        List<StudentDto> students = classroomUtilities.loadStudents(id,0);
        Integer lastClassroomUserId = 0;
        if (students!=null) {
            if (students.size()>10){
                lastClassroomUserId = students.get(students.size()-2).getClassroomUserId();
            }
        }

        if (questions.size()==0 && articles.size()==0 && materials.size()==0 && requests.size()==0
                && students.size() ==0) {
            model.addAttribute("classroom", classroom);
            model.addAttribute("user", user);
            return "classroomWelcome";
        }


        // check if acceptRequest or not
        ClassroomUser checkClassroomUser = classroomUserDao.findClassroomByClassroomAndUser(user.getId(), id);

        model.addAttribute("questions",questions);
        model.addAttribute("lastQuestionId",lastQuestionId);
        model.addAttribute("articles",articles);
        model.addAttribute("lastArticleId",lastArticleId);
        model.addAttribute("materials",materials);
        model.addAttribute("lastMaterialId",lastMaterialId);
        model.addAttribute("requests",requests);
        model.addAttribute("lastRequestId",lastRequestId);
        model.addAttribute("students",students);
        model.addAttribute("lastClassroomUserId",lastClassroomUserId);
        model.addAttribute("classroom", classroom);
        model.addAttribute("user",user);
        model.addAttribute("checkClassroomUser", checkClassroomUser);
        return "classroom";
    }

    @RequestMapping(value = "/classroom/question",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<PostDto> loadMoreQuestion(@RequestParam Integer classroomId, @RequestParam Integer lastId) {
        List<PostDto> questionDtos = new ArrayList<PostDto>();
        try {
            questionDtos = classroomUtilities.loadQuestions(classroomId,lastId);
        } catch (Exception e){

        }
        return questionDtos;
    }

    @RequestMapping(value = "/classroom/article",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<PostDto> loadMoreArticle(@RequestParam Integer classroomId, @RequestParam Integer lastId) {
        List<PostDto> articleDtos = new ArrayList<PostDto>();
        try {
            articleDtos = classroomUtilities.loadArticles(classroomId, lastId);
        } catch (Exception e){

        }
        return articleDtos;
    }

    @RequestMapping(value = "/classroom/material",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<MaterialDto> loadMoreMaterial(@RequestParam Integer classroomId, @RequestParam Integer lastId) {
        List<MaterialDto> materialDtos = new ArrayList<MaterialDto>();
        try {
            materialDtos = classroomUtilities.loadMaterials(classroomId, lastId);
        } catch (Exception e){

        }
        return materialDtos;
    }

    @RequestMapping(value = "/classroom/request",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<RequestDto> loadMoreRequest(@RequestParam Integer classroomId, @RequestParam Integer lastId) {
        List<RequestDto> requestDtos = new ArrayList<RequestDto>();
        try {
            requestDtos = classroomUtilities.loadRequests(classroomId, lastId);
        } catch (Exception e){

        }
        return requestDtos;
    }

    @RequestMapping(value = "/classroom/student",method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<StudentDto> loadMoreStudent(@RequestParam Integer classroomId, @RequestParam Integer lastId) {
        List<StudentDto> studentDtos = new ArrayList<StudentDto>();
        try {
            studentDtos = classroomUtilities.loadStudents(classroomId, lastId);
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

    @RequestMapping(value = "dashboard/classroomInvitation/{lastId}",produces = "application/json",
            method = RequestMethod.GET)
    public @ResponseBody
    List<ClassroomInvitationDto> loadClassroomInvitation(@PathVariable Integer lastId) {
        User user = (User) session.getAttribute("user");
        List<ClassroomInvitationDto> classroomInvitationDtos = null;
        try {
            classroomInvitationDtos = dashboardUtilities.loadClassroomInvitations(user.getId(), lastId);
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
        ClassroomUser classroomUser = classroomUserDao.findClassroomByClassroomAndUser(user.getId(),classroomId);
        try {
            classroomUserDao.delete(classroomUser);
        } catch (Exception e){
            return "NG";
        }
        return "OK";
    }
}



