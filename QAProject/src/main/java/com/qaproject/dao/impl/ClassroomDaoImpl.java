package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.ClassroomDao;
import com.qaproject.entity.Category;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.User;
import com.qaproject.util.Constant;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class ClassroomDaoImpl extends BaseDao<Classroom,Integer> implements ClassroomDao {
    /**
     * MinhKH
     * Using to get suggest classrooms by category
     * @param category
     * @return List<Classroom>
     */
    @Override
    public List<Classroom> findByCategory(Category category) {
        List<Classroom> classrooms = null;
        Query query = entityManager.createQuery("Select c from Classroom c where c.categoryId= :category");
        query.setParameter("category",category);
        try {
            classrooms = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return classrooms;
    }

    @Override
    public List<Classroom> findByOwnerUser(Integer ownerUserId) {
        List<Classroom> classrooms = null;
        Query query = entityManager.createQuery("Select c from Classroom c where c.ownerUserId.id= :ownerUserId");
        query.setParameter("ownerUserId",ownerUserId);
        try {
            classrooms = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return classrooms;
    }

    @Override
    public List<Classroom> findOwnedClassroomForDashboard(Integer ownerUserId, Integer lastId) {
        List<Classroom> classrooms = null;
        Query query;
        if (lastId==0){
            query = entityManager.createQuery("Select c from Classroom c where c.ownerUserId.id= :ownerUserId " +
                    "order by c.id desc");
        } else {
            query = entityManager.createQuery("Select c from Classroom c where c.ownerUserId.id= :ownerUserId " +
                    "and c.id<:lastId order by c.id desc");
            query.setParameter("lastId",lastId);
        }
        query.setParameter("ownerUserId",ownerUserId);
        query.setMaxResults(11);
        try {
            classrooms = query.getResultList();
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return classrooms;
    }

    @Override
    public Classroom findLastCreatedClassroomByOwner(User owner) {
        Query query = entityManager.createQuery("Select c from Classroom  c where c.ownerUserId=:owner " +
                "order by c.id desc");
        query.setParameter("owner",owner);
        query.setMaxResults(1);
        Classroom classroom =null;
        try{
            classroom = (Classroom) query.getResultList().get(0);
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return classroom;
    }
}
