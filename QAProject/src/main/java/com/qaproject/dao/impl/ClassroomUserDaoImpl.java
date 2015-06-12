package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.ClassroomUserDao;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.ClassroomUser;
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

}
