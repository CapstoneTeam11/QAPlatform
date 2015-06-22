package com.qaproject.util;

import com.qaproject.dao.*;
import com.qaproject.dto.PostDto;
import com.qaproject.entity.*;
import org.joda.time.DateTime;
import org.joda.time.Hours;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by Minh on 6/14/2015.
 */
@Component
public class NewsFeedUtilities {
    @Autowired
    UserDao userDao;
    @Autowired
    PostDao postDao;
    @Autowired
    WantAnswerDao wantAnswerDao;
    @Autowired
    ClassroomDao classroomDao;
    @Autowired
    FollowerDao followerDao;
    @Autowired
    ClassroomUserDao classroomUserDao;

    private final String QUESTION_IN_KNOW = "QIK_";
    private final String QUESTION_IN_CLASS = "QIC_";
    private final String QUESTION_IN_FOLLOWER = "QIF_";
    private final Integer STUDENT = 1;
    private final Integer TEACHER = 2;
    private final Integer ACCEPTED = 1;

    public void setNewsFeedQuestion() {
        List<User> users = userDao.findAll();
        if (users == null) {
            return;
        }
        Jedis jedis = new Jedis("localhost");
        for (User user : users) {
            setQuestionsInClass(user, jedis);
            setQuestionsInFollower(user, jedis);
            setQuestionsInKnow(user, jedis);
        }
    }

    public void setNewsFeedQuestionAfterRegister(User user) {
        Jedis jedis = new Jedis("localhost");
        setQuestionsInKnow(user,jedis);
    }

    public void setNewsFeedQuestionAfterCreatePost(Post question){
        List<User> users = userDao.findAll();
        if (users==null) {
            return;
        }
        Jedis jedis = new Jedis("localhost");
        for (User user: users){
            setQuestionInClass(user,jedis,question);
            setQuestionsInFollower(user,jedis,question);
            setQuestionsInKnow(user,jedis,question);
        }
    }

    public List<PostDto> loadNewsFeedQuestions(Integer userId, Integer page){
        if (page<1){
            page = 1;
        }
        Integer start = Constant.NUMBER_PAGE*(page -1);
        Integer stop = Constant.NUMBER_PAGE*page;
        List<Post> questions = getNewsFeedQuestions(userId,start,stop);
        List<PostDto> questionDtos = new ArrayList<PostDto>();
        if (questions != null) {
            for(Post question: questions) {
                Integer answerCount = 0;
                if (question!=null) {
                    List<Post> answers = postDao.findRepliesByParentId(question.getId());
                    if (answers!=null) {
                        answerCount = answers.size();
                    }
                }
                PostDto questionDto = ConvertEntityDto.convertPostEntityToDto(question,answerCount);
                questionDtos.add(questionDto);
            }
        }
        return questionDtos;
    }

    public List<Post> getNewsFeedQuestions(Integer userId, Integer start, Integer stop) {
        List<Post> inClass = getQuestionsByPrefixKey(QUESTION_IN_CLASS, userId, start, stop);
        List<Post> inFollower = getQuestionsByPrefixKey(QUESTION_IN_FOLLOWER, userId, start, stop);
        List<Post> inKnow = getQuestionsByPrefixKey(QUESTION_IN_KNOW, userId, start, stop);

        List<Post> newsFeedQuestions = new ArrayList<Post>();
        if (inClass.size()>0) {
            for(Post question : inClass){
                addToQuestionList(newsFeedQuestions,question);
            }
        }
        if (inFollower.size()>0) {
            for(Post question : inFollower){
                addToQuestionList(newsFeedQuestions,question);
            }
        }
        if (inKnow.size()>0) {
            for(Post question : inKnow){
                addToQuestionList(newsFeedQuestions,question);
            }
        }
        return newsFeedQuestions;
    }

    /*set user news feed question in their class for all question*/
    private void setQuestionsInClass(User user, Jedis jedis) {
        List<Classroom> classrooms = new ArrayList<Classroom>();
        if (user.getRoleId().getId()==TEACHER){
            classrooms = classroomDao.findByOwnerUser(user.getId());
        }
        if (user.getRoleId().getId()==STUDENT){
            List<ClassroomUser> classroomUsers = classroomUserDao.findByUserWithApproved(user);
            if (classroomUsers==null) {
                return;
            }
            for (ClassroomUser classroomUser:classroomUsers) {
                classrooms.add(classroomUser.getClassroomId());
            }
        }
        if (classrooms == null) {
            return;
        }
        List<Post> questions = new ArrayList<Post>();
        for (Classroom classroom : classrooms) {
            if (classroom == null) {
                continue;
            }
            List<Post> currentQuestions = postDao.findQuestionByOwnerClassroom(classroom);
            if (currentQuestions == null) {
                continue;
            }
            for (Post currentQuestion : currentQuestions) {
                if (currentQuestion == null) {
                    continue;
                }
                questions.add(currentQuestion);
            }
        }
        for (Post question : questions) {
            try {
                jedis.zadd(QUESTION_IN_CLASS + Integer.toString(user.getId()),
                        calculateScore(user, question), Integer.toString(question.getId()));
            } catch (Exception e) {

            }
        }
    }

    /*set user news feed question in their class for specific question*/
    private void setQuestionInClass(User user, Jedis jedis, Post question){
        boolean isSet = false;
        Classroom classroomOfQuestion = question.getOwnerClassId();
        if (user.getRoleId().getId()==TEACHER) {
            List<Classroom> classroomsOfOwner = classroomDao.findByOwnerUser(user.getId());
            if (classroomsOfOwner==null) {
                return;
            }
            if (classroomsOfOwner.contains(classroomOfQuestion)) {
                isSet = true;
            }

        }
        if (user.getRoleId().getId()==STUDENT) {
            List<ClassroomUser> classroomUsers = classroomUserDao.findByUserWithApproved(user);
            if (classroomUsers==null) {
                return;
            }
            for (ClassroomUser classroomUser:classroomUsers) {
                if (classroomUser.getClassroomId().equals(classroomOfQuestion)){
                    isSet = true;
                }
            }
        }
        if (isSet){
            try {
                jedis.zadd(QUESTION_IN_CLASS + Integer.toString(user.getId()),
                        calculateScore(user, question), Integer.toString(question.getId()));
            } catch (Exception e) {

            }
        }
    }

    /*set user news feed question in their follower for all question*/
    private void setQuestionsInFollower(User user, Jedis jedis) {
        List<Follower> followedTeachers = followerDao.findByFollower(user);
        if (followedTeachers == null) {
            return;
        }
        List<Post> questions = new ArrayList<Post>();
        for (Follower followedTeacher : followedTeachers) {
            if (followedTeacher == null) {
                continue;
            }
            List<Post> currentQuestions = postDao.findQuestionsByOwnerUser(followedTeacher.getTeacherId());
            if (currentQuestions == null) {
                continue;
            }
            for (Post currentQuestion : currentQuestions) {
                if (currentQuestion == null) {
                    continue;
                }
                questions.add(currentQuestion);
            }
        }
        for (Post question : questions) {
            try {
                jedis.zadd(QUESTION_IN_FOLLOWER + Integer.toString(user.getId()),
                        calculateScore(user, question), Integer.toString(question.getId()));
            } catch (Exception e){

            }
        }
    }

    /*set user news feed question in their follower for specific question*/
    private void setQuestionsInFollower(User user, Jedis jedis, Post question){
        List<Follower> followedTeachers = followerDao.findByFollower(user);
        boolean isSet = false;
        if (followedTeachers == null) {
            return;
        }
        for (Follower followedTeacher : followedTeachers) {
            if (followedTeacher == null) {
                continue;
            }
            List<Post> currentQuestions = postDao.findQuestionsByOwnerUser(followedTeacher.getTeacherId());
            if (currentQuestions == null) {
                continue;
            }
            if (currentQuestions.contains(question)) {
                isSet = true;
            }
        }
        if (isSet) {
            try {
                jedis.zadd(QUESTION_IN_FOLLOWER + Integer.toString(user.getId()),
                        calculateScore(user, question), Integer.toString(question.getId()));
            } catch (Exception e){

            }
        }
    }

    /*set user's news feed questions in their knowledge for all question*/
    private void setQuestionsInKnow(User user, Jedis jedis) {
        List<Classroom> classrooms = classroomDao.findByCategory(user.getCategoryId());
        if (classrooms == null) {
            return;
        }
        List<Post> questions = new ArrayList<Post>();
        for (Classroom classroom : classrooms) {
            if (classroom == null) {
                continue;
            }
            List<Post> currentQuestions = postDao.findQuestionByOwnerClassroom(classroom);
            if (currentQuestions == null) {
                continue;
            }
            for (Post currentQuestion : currentQuestions) {
                if (currentQuestion == null) {
                    continue;
                }
                questions.add(currentQuestion);
            }
        }
        for (Post question : questions) {
            try {
                jedis.zadd(QUESTION_IN_KNOW + Integer.toString(user.getId())
                        , calculateScore(user, question), Integer.toString(question.getId()));
            } catch (Exception e) {

            }
        }
    }

    /*set user's news feed questions in their knowledge and not in their class, not in their follower for specific question*/
    private void setQuestionsInKnow(User user, Jedis jedis, Post question){
        List<Classroom> classrooms = classroomDao.findByCategory(user.getCategoryId());
        boolean isSet = false;
        if (classrooms == null) {
            return;
        }
        List<Post> questions = new ArrayList<Post>();
        for (Classroom classroom : classrooms) {
            if (classroom == null) {
                continue;
            }
            List<Post> currentQuestions = postDao.findQuestionByOwnerClassroom(classroom);
            if (currentQuestions == null) {
                continue;
            }
            if (currentQuestions.contains(question)){
                isSet = true;
            }
        }
        if (isSet) {
            try {
                jedis.zadd(QUESTION_IN_KNOW + Integer.toString(user.getId())
                        , calculateScore(user, question), Integer.toString(question.getId()));
            } catch (Exception e) {

            }
        }
    }

    /*Use this to instead duplicate element in list*/
    private void addToQuestionList(List<Post> list, Post question){
        if (list==null || question == null){
            return;
        }
        if (list.contains(question)){
            return;
        } else {
            list.add(question);
        }
    }

    private List<Post> getQuestionsByPrefixKey(String prefixKey, Integer userId, Integer start, Integer stop) {
        List<Post> questions = new ArrayList<Post>();
        try {
            Jedis jedis = new Jedis("localhost");
            Set<String> questionIdsSet = jedis.zrevrange(prefixKey + Integer.toString(userId), start, stop);
            for (String sId : questionIdsSet) {
                Integer iId = Integer.parseInt(sId);
                Post currentQuestion = postDao.find(iId);
                if (currentQuestion != null) {
                    questions.add(currentQuestion);
                }
            }
            return questions;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return questions;
    }

    private Double calculateScore(User user, Post question) {
        List<Post> answers = postDao.findRepliesByParentId(question.getId());
        DateTime toDate = new DateTime();
        DateTime maxDate = new DateTime(question.getLastEditedDate());
        int iView = question.getViewer();
        int iWantAnswer = wantAnswerDao.countWantAnswerByPost(question);
        int iAnswer = 0;
        int iAccepted = 0;

        if (answers != null) {
            iAnswer = answers.size();
            for (Post answer : answers) {
                DateTime newDate = new DateTime(answer.getLastEditedDate());
                if (newDate.isAfter(maxDate)) {
                    maxDate = new DateTime(newDate);
                }
                if (user.getRoleId().getId() == STUDENT) {
                    if (answer.getAcceptedAnswerId() == ACCEPTED) {
                        iAccepted = 1;
                    }
                }

            }
        }

        Double iHours = Hours.hoursBetween(maxDate, toDate).getHours() * 1.0;
        if (iHours == 0.0) {
            iHours = 0.9;
        }

        Double score = (3.0 * iWantAnswer + 2.0 * iView + iAnswer - iAccepted) / iHours;
        return score;
    }

    private Double calculate(Post question, User user) {
        List<Post> answers = postDao.findRepliesByParentId(question.getId());
        DateTime toDate = new DateTime();
        DateTime maxDate = new DateTime(question.getLastEditedDate());
        int iView = question.getViewer();
        int iWantAnswer = wantAnswerDao.countWantAnswerByPost(question);
        int iAnswer = 0;
        int iAcceptAnswer = 0;
        int iTeacherAcceptAnswer = 0;
        int iDay = 0;
        boolean isTeacherAcceptAnswer = false;
        if (answers != null) {
            iAnswer = answers.size();
            for (Post answer : answers) {
                DateTime newDate = new DateTime(answer.getLastEditedDate());
                if (newDate.isAfter(maxDate)) {
                    maxDate = new DateTime(newDate);
                }
                if (answer.getAcceptedAnswerId() != 0) {
                    iAcceptAnswer++;
                    if (answer.getOwnerUserId().equals(user)) {
                        isTeacherAcceptAnswer = true;
                    }
                }
            }
        }
        if (isTeacherAcceptAnswer == true) {
            iTeacherAcceptAnswer = Math.round(iWantAnswer / 3);
        }
        iDay = Hours.hoursBetween(maxDate, toDate).getHours();
        System.out.println("Hours is: " + iDay);

        Double score = 3.0 * iWantAnswer + 2.0 * iView + iAnswer - iDay - 3.0 * iAcceptAnswer - iTeacherAcceptAnswer;
        System.out.println("Question: " + question.getId() + " Score: " + score);
        return score;
    }
}
