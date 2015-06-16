package com.qaproject.util;

import com.qaproject.dao.*;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.ClassroomUser;
import com.qaproject.entity.Post;
import com.qaproject.entity.User;
import org.joda.time.DateTime;
import org.joda.time.Days;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;

import javax.persistence.criteria.CriteriaBuilder;
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

    public void setNewsFeedQuestion() {
        try {
            List<User> users = userDao.findAll();
            if (users==null) {
                return;
            }
            Jedis jedis = new Jedis("localhost");
            for (User user: users) {
                if (user.getRoleId().getId()==2) { //if user is teacher
                    List<Classroom> classrooms = classroomDao.findByOwnerUser(user.getId());
                    if (classrooms==null) {
                        continue;
                    }
                    List<Post> questions = new ArrayList<Post>();
                    for (Classroom classroom:classrooms) {
                        if (classroom==null) {
                            continue;
                        }
                        List<Post> currentQuestions = postDao.findQuestionByOwnerClassroom(classroom);
                        if (currentQuestions==null) {
                            continue;
                        }
                        for (Post currentQuestion :currentQuestions){
                            if (currentQuestion==null) {
                                continue;
                            }
                            questions.add(currentQuestion);
                        }
                    }
                    for (Post question: questions) {
                        jedis.zadd(Integer.toString(user.getId()),calculateScore(question,user),
                                Integer.toString(question.getId()));
                    }
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            return;
        }
    }

    public List<Post> getNewsFeedQuestion(Integer userId, Integer start, Integer stop){
        Jedis jedis = new Jedis("localhost");
        Set<String> questionIdsSet = jedis.zrevrange(Integer.toString(userId),start,stop);
        List<Post> questions = new ArrayList<Post>();
        for(String sId : questionIdsSet) {
            Integer iId = Integer.parseInt(sId);
            Post currentQuestion = postDao.find(iId);
            if (currentQuestion!=null) {
                questions.add(currentQuestion);
            }
        }
        return questions;
    }

    private Double calculateScore(Post question, User user){
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
        if (answers!=null) {
            iAnswer = answers.size();
            for (Post answer:answers) {
                DateTime newDate = new DateTime(answer.getLastEditedDate());
                if (newDate.isAfter(maxDate)){
                    maxDate = new DateTime(newDate);
                }
                if(answer.getAcceptedAnswerId()!=0) {
                    iAcceptAnswer++;
                    if(answer.getOwnerUserId().equals(user)){
                        isTeacherAcceptAnswer = true;
                    }
                }
            }
        }
        if (isTeacherAcceptAnswer==true){
            iTeacherAcceptAnswer = Math.round(iWantAnswer/3);
        }
        iDay = Days.daysBetween(maxDate,toDate).getDays();

        Double score = 3.0*iWantAnswer + 2.0*iView + iAnswer - iDay - 3.0*iAcceptAnswer - iTeacherAcceptAnswer;
        System.out.println("Question: " + question.getId() + " Score: " + score);
        return score;
    }
}
