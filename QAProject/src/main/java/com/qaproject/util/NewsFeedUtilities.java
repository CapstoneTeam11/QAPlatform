package com.qaproject.util;

import com.qaproject.dao.*;
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

    private final String QUESTION_IN_KNOW = "QIK_";
    private final String QUESTION_IN_CLASS = "QIC_";
    private final String QUESTION_IN_FOLLOWER = "QIF_";
    private final Integer STUDENT = 1;
    private final Integer TEACHER = 2;
    private final Integer ACCEPTED = 1;

    /*set user news feed question in their class*/
    private void setQuestionsInClass(User user, Jedis jedis) {
        List<Classroom> classrooms = classroomDao.findByOwnerUser(user.getId());
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

    /*set user news feed question in their follower*/
    private void setQuestionsInFollower(User user, Jedis jedis) {
        List<Follower> followers = followerDao.findByFollowerUser(user);
        if (followers == null) {
            return;
        }
        List<Post> questions = new ArrayList<Post>();
        for (Follower follower : followers) {
            if (follower == null) {
                continue;
            }
            List<Post> currentQuestions = postDao.findQuestionsByOwnerUser(follower.getFollowerId());
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

    /*set user's news feed questions in their knowledge and not in their class, not in their follower*/
    private void setQuestionsInKnow(User user, Jedis jedis) {
        List<Classroom> classrooms = classroomDao.findByCategory(user.getCategoryId());
        if (classrooms == null) {
            return;
        }
        List<Follower> followers = followerDao.findByFollowerUser(user);
        List<Post> questions = new ArrayList<Post>();
        for (Classroom classroom : classrooms) {
            if (classroom == null || classroom.getOwnerUserId().equals(user)) {
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
                if (currentQuestion.getOwnerUserId().getRoleId().getId() == 2) { //if currentOwner is teacher
                    if (followers != null) {
                        if (followers.contains(currentQuestion.getOwnerUserId())) { //if currentOwner in follower list
                            continue;
                        }
                    }
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

    public List<Post> getNewsFeedQuestions(Integer userId, Integer start, Integer stop) {
        List<Post> inClass = getQuestionsByPrefixKey(QUESTION_IN_CLASS, userId, start, stop);
        List<Post> inFollower = getQuestionsByPrefixKey(QUESTION_IN_FOLLOWER, userId, start, stop);
        List<Post> inKnow = getQuestionsByPrefixKey(QUESTION_IN_KNOW, userId, start, stop);

        List<Post> teacherNewsFeedQuestions = new ArrayList<Post>();
        if (inClass.size()>0) {
            teacherNewsFeedQuestions.addAll(inClass);
        }
        if (inFollower.size()>0) {
            teacherNewsFeedQuestions.addAll(inFollower);
        }
        if (inKnow.size()>0) {
            teacherNewsFeedQuestions.addAll(inKnow);
        }
        return teacherNewsFeedQuestions;
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
