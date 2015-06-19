package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.ClassroomUserDao;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.ClassroomUser;
import com.qaproject.entity.User;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class ClassroomUserDaoImpl extends BaseDao<ClassroomUser,Integer> implements ClassroomUserDao{
    @Override
    public List<ClassroomUser> findByClassroom(Classroom classroom) {
        List<ClassroomUser> classroomUsers = null;
        Query query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.classroomId=:classroom ");
        query.setParameter("classroom",classroom);
        try {
            classroomUsers = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return classroomUsers;
    }

    @Override
    public List<ClassroomUser> findByUser(User user) {
        List<ClassroomUser> classroomUsers = null;
        Query query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.userId=:user ");
        query.setParameter("user",user);
        try {
            classroomUsers = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return classroomUsers;
    }

    @Override
    public List<ClassroomUser> findByUserWithApproved(User user) {
        List<ClassroomUser> classroomUsers = null;
        Query query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.userId=:user and cu.approval=1");
        query.setParameter("user",user);
        try {
            classroomUsers = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return classroomUsers;
    }

    @Override
    public List<ClassroomUser> findByUserClassroomWithApprove(int userId, int classId) {
        List<ClassroomUser> classroomUsers = null;
        Query query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.userId.id=:userId and cu.classroomId.id = :classId and cu.approval = 1");
        query.setParameter("userId",userId);
        query.setParameter("classId",classId);
        try {
            classroomUsers = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return classroomUsers;
    }

    @Override
    public List<ClassroomUser> findByUserClassroom(int userId, int classId) {
        List<ClassroomUser> classroomUsers = null;
        Query query = entityManager.createQuery("Select cu from ClassroomUser cu where cu.userId.id=:userId and cu.classroomId.id = :classId");
        query.setParameter("userId",userId);
        query.setParameter("classId",classId);
        try {
            classroomUsers = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return classroomUsers;
    }
}
