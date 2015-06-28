package com.qaproject.controller;

import com.qaproject.dao.*;
import com.qaproject.dto.*;
import com.qaproject.entity.*;
import com.qaproject.util.Constant;
import com.qaproject.util.DashboardUtilities;
import com.qaproject.util.NotificationUtilities;
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
            if (currentClassroomUser.getApproval()==1) {
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
        // check if acceptRequest or not
        List<ClassroomUser> checkClassroomUsers = classroomUserDao.findByUserClassroom(userSession.getId(), Integer.parseInt(id));
        ClassroomUser checkClassroomUser = null;
        if(checkClassroomUsers != null && checkClassroomUsers.size()>0){
            checkClassroomUser = checkClassroomUsers.get(0);
        }
        model.addAttribute("questions",questions);
        model.addAttribute("articles",articles);
        model.addAttribute("materials",materials);
        model.addAttribute("joinRequests",joinRequests);
        model.addAttribute("students",students);
        model.addAttribute("classroom", classroom);
        model.addAttribute("userOwner", user);
        model.addAttribute("user", userSession);
        model.addAttribute("checkClassroomUser", checkClassroomUser);
        return "classroom";
    }
    @RequestMapping(value = "/classroom/loadMoreStudent/{id}",method = RequestMethod.POST)
    @ResponseBody
    public List<StudentDto> loadMoreStudent(ModelMap model, @PathVariable(value = "id") String id) {
        User userSession = (User) session.getAttribute("user");
        if(userSession==null) {
            return null;
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
            if (currentClassroomUser.getApproval()==1) {
                students.add(currentClassroomUser);
            }
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
        // check if acceptRequest or not
        List<ClassroomUser> checkClassroomUsers = classroomUserDao.findByUserClassroom(userSession.getId(), Integer.parseInt(id));
        ClassroomUser checkClassroomUser = null;
        if(checkClassroomUsers != null && checkClassroomUsers.size()>0){
            checkClassroomUser = checkClassroomUsers.get(0);
        }
        List<StudentDto> list = new ArrayList<StudentDto>();
        for(int i=0; i< students.size(); i++){
            StudentDto studentDto = new StudentDto(students.get(i).getUserId().getDisplayName(), students.get(i).getUserId().getId());
            list.add(studentDto);
        }

        return list;
    }

    /**
     * TungTD load more student request
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value = "/classroom/loadMoreStudentRequest/{id}",method = RequestMethod.POST)
    @ResponseBody
    public List<ClassUserDto> loadMoreStudentRequest(ModelMap model, @PathVariable(value = "id") String id) {
        User userSession = (User) session.getAttribute("user");
        if(userSession==null) {
            return null;
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
            if (currentClassroomUser.getApproval()==1) {
                students.add(currentClassroomUser);
            }
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
        // check if acceptRequest or not
        List<ClassroomUser> checkClassroomUsers = classroomUserDao.findByUserClassroom(userSession.getId(), Integer.parseInt(id));
        ClassroomUser checkClassroomUser = null;
        if(checkClassroomUsers != null && checkClassroomUsers.size()>0){
            checkClassroomUser = checkClassroomUsers.get(0);
        }
        List<ClassUserDto> listResquest = new ArrayList<ClassUserDto>();
        for(int i=0; i< joinRequests.size(); i++){
            ClassUserDto studentClassUserDto = new ClassUserDto();
            studentClassUserDto.setClassroomId(joinRequests.get(i).getClassroomId().getId().toString());
            studentClassUserDto.setClassroomName(joinRequests.get(i).getClassroomId().getClassroomName());
            studentClassUserDto.setJoinRequest(joinRequests.get(i).getId().toString());
            studentClassUserDto.setOwnerUserId(joinRequests.get(i).getClassroomId().getOwnerUserId().getId().toString());
            studentClassUserDto.setUserDisplayName(joinRequests.get(i).getUserId().getDisplayName());
            studentClassUserDto.setUserRoleId(userSession.getRoleId().getId());
            studentClassUserDto.setUserId(joinRequests.get(i).getUserId().getId());
            listResquest.add(studentClassUserDto);
        }

        return listResquest;
    }
    /**
     * TungTD loadMoreActicle
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value = "/classroom/loadMoreActicle/{id}",method = RequestMethod.POST)
    @ResponseBody
    public List<ArticleDto> loadMoreActicle(ModelMap model, @PathVariable(value = "id") String id) {
        User userSession = (User) session.getAttribute("user");
        if(userSession==null) {
            return null;
        }
        Classroom classroom = classroomDao.find(Integer.parseInt(id));
        int idOwner = classroom.getOwnerUserId().getId();
        User user = userDao.find(idOwner);

        //get posts, materials, request to join - MinhKH
        List<Post> posts = classroom.getPostList();
        List<Material> materials = classroom.getMaterialList();


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
        // check if acceptRequest or not
        List<ClassroomUser> checkClassroomUsers = classroomUserDao.findByUserClassroom(userSession.getId(), Integer.parseInt(id));
        ClassroomUser checkClassroomUser = null;
        if(checkClassroomUsers != null && checkClassroomUsers.size()>0){
            checkClassroomUser = checkClassroomUsers.get(0);
        }
        List<ArticleDto> articleDtos = new ArrayList<ArticleDto>();
        for(int i=0; i< articles.size(); i++){
            Post article = articles.get(i);
            ArticleDto articleDto = new ArticleDto();
            articleDto.setQuestionId(article.getId().toString());
            articleDto.setClassroomName(article.getOwnerClassId().getClassroomName());
            articleDto.setQuestionAcceptedAnswerId(article.getAcceptedAnswerId().toString());
            articleDto.setQuestionBody(article.getBody());
            articleDto.setQuestionLastEditedDate(article.getLastEditedDate().toString());
            articleDto.setQuestionOwnerUserId(article.getOwnerUserId().getId().toString());
            articleDto.setQuestionTitle(article.getTitle());
            articleDto.setReplyCount(article.getReplyCount() == null ? "0" : article.getReplyCount().toString());
            articleDto.setQuestionOwnerUserName(article.getOwnerUserId().getDisplayName());
            articleDtos.add(articleDto);
        }

        return articleDtos;
    }

    /**
     * TungTD loadMoreActicle
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value = "/classroom/loadMoreQuestion/{id}",method = RequestMethod.POST)
    @ResponseBody
    public List<ArticleDto> loadMoreQuestion(ModelMap model, @PathVariable(value = "id") String id) {
        User userSession = (User) session.getAttribute("user");
        if(userSession==null) {
            return null;
        }
        Classroom classroom = classroomDao.find(Integer.parseInt(id));
        int idOwner = classroom.getOwnerUserId().getId();
        User user = userDao.find(idOwner);

        //get posts, materials, request to join - MinhKH
        List<Post> posts = classroom.getPostList();
        List<Material> materials = classroom.getMaterialList();


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
        // check if acceptRequest or not
        List<ClassroomUser> checkClassroomUsers = classroomUserDao.findByUserClassroom(userSession.getId(), Integer.parseInt(id));
        ClassroomUser checkClassroomUser = null;
        if(checkClassroomUsers != null && checkClassroomUsers.size()>0){
            checkClassroomUser = checkClassroomUsers.get(0);
        }
        List<ArticleDto> articleDtos = new ArrayList<ArticleDto>();
        for(int i=0; i< questions.size(); i++){
            Post article = questions.get(i);
            ArticleDto articleDto = new ArticleDto();
            articleDto.setQuestionId(article.getId().toString());
            articleDto.setClassroomName(article.getOwnerClassId().getClassroomName());
            articleDto.setQuestionAcceptedAnswerId(article.getAcceptedAnswerId().toString());
            articleDto.setQuestionBody(article.getBody());
            articleDto.setQuestionLastEditedDate(article.getLastEditedDate().toString());
            articleDto.setQuestionOwnerUserId(article.getOwnerUserId().getId().toString());
            articleDto.setQuestionTitle(article.getTitle());
            articleDto.setReplyCount(article.getReplyCount()==null?"0":article.getReplyCount().toString());
            articleDto.setQuestionOwnerUserName(article.getOwnerUserId().getDisplayName());
            articleDtos.add(articleDto);
        }

        return articleDtos;
    }
    /**
     * TungTD loadMoreActicle
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value = "/classroom/loadMoreMaterial/{id}",method = RequestMethod.POST)
    @ResponseBody
    public List<MaterialDto> loadMoreMaterial(ModelMap model, @PathVariable(value = "id") String id) {
        User userSession = (User) session.getAttribute("user");
        if(userSession==null) {
            return null;
        }
        Classroom classroom = classroomDao.find(Integer.parseInt(id));
        int idOwner = classroom.getOwnerUserId().getId();
        User user = userDao.find(idOwner);

        //get posts, materials, request to join - MinhKH
        List<Post> posts = classroom.getPostList();
        List<Material> materials = classroom.getMaterialList();
        List<MaterialDto> materialDtos = new ArrayList<MaterialDto>();
        for(int i=0; i< materials.size(); i++){
            Material material = materials.get(i);
            MaterialDto materialDto = new MaterialDto();
            materialDto.setCreationDate(material.getCreationDate().toString());
            materialDto.setId(material.getId().toString());
            materialDto.setName(material.getName());
            materialDto.setSize(material.getSize().toString());
            materialDtos.add(materialDto);
        }

        return materialDtos;
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

    @RequestMapping(value = "dashboard/joinedClassroom/{nextFrom}",produces = "application/json",
            method = RequestMethod.GET)
    public @ResponseBody
    List<ClassroomDto> loadJoinedClassroom(@PathVariable Integer nextFrom) {
        User user = (User) session.getAttribute("user");
        List<ClassroomDto> classroomDtos = null;
        try {
            classroomDtos = dashboardUtilities.loadJoinedClassrooms(user.getId(), nextFrom);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return classroomDtos;
    }

    @RequestMapping(value = "dashboard/ownedClassroom/{page}",produces = "application/json",method = RequestMethod.GET)
    public @ResponseBody
    List<ClassroomDto> loadOwnedClassroom(@PathVariable Integer page) {
        User user = (User) session.getAttribute("user");
        List<ClassroomDto> classroomDtos = null;
        try {
            classroomDtos = dashboardUtilities.loadOwnedClassrooms(user.getId(), page);
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



