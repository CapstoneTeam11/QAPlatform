package com.qaproject.dao;

import com.qaproject.dto.ClassroomDto;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.ClassroomUser;
import com.qaproject.entity.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public interface ClassroomUserDao {
    public ClassroomUser find(Integer id);
    List<ClassroomUser> findAll();
    List<ClassroomUser> findByClassroom(Classroom classroom);
    List<ClassroomUser> findByUser(User user);
    List<ClassroomUser> findByUserWithApproved (User user);
    List<ClassroomUser> findJoinedClassroomUserForDashboard (Integer studentId, Integer page);
    List<ClassroomUser> findInvitationClassroomUserForDashboard (Integer studentId, Integer page);
    List<ClassroomUser> findByUserClassroomWithApprove(int userId, int classId);
    public List<ClassroomUser> findByUserClassroom(int userId, int classId);
    public ClassroomUser findLastRequestByStudent (User student);
    public List<ClassroomUser> findLastInvitationsByStudents (List<Integer> studentIds);
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(ClassroomUser entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(ClassroomUser entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(ClassroomUser entity);
}
