package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.UserDao;
import com.qaproject.entity.Post;
import com.qaproject.entity.User;
import org.springframework.stereotype.Repository;

import javax.jws.soap.SOAPBinding;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class UserDaoImpl extends BaseDao<User,Integer> implements UserDao {
    @Override
    public List<User> login(String username, String password) {
        Query query = null;
        query = entityManager.createQuery("select u from User u where u.email = :username and u.password = :password", User.class);

        List<User> users = null;
        try {
            query.setParameter("username", username);
            query.setParameter("password", password);
            users =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return users;
    }

    @Override
    public User find(String name) {
        Query query = null;
        query = entityManager.createQuery("select u from User u where u.email like :username", User.class);

        List<User> users = null;
        try {
            query.setParameter("username", "%" +name+ "%");
            users =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return users.size()>0?users.get(0):null;
    }
    @Override
    public User findByEmail(String name) {
        Query query = null;
        query = entityManager.createQuery("select u from User u where u.email = :username", User.class);

        List<User> users = null;
        try {
            query.setParameter("username", name);
            users =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return users.size()>0?users.get(0):null;
    }

    @Override
    public List<User> findAllStudentNotInClass(int classId, String username) {
        Query query = null;
        query = entityManager.createQuery("select u from User u " +
                "where u.id not in(select  cu.id from ClassroomUser  cu where cu.approval = 0 " +
                "or cu.approval = null and cu.classroomId.id = :classId) and u.displayName like :username and u.roleId.id = 1", User.class);

        List<User> users = null;
        try {
            query.setParameter("classId", classId);
            query.setParameter("username", "%" + username + "%");
            users =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return users;
    }

    @Override
    public List<User> findAllStudent(String username) {
        Query query = null;
        query = entityManager.createQuery("select u from User u " +
                "where u.displayName like :username and u.roleId.id = 1", User.class);

        List<User> users = null;
        try {
            query.setParameter("username", "%" + username + "%");
            users =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return users;
    }

    @Override
    public List<User> findTeacherPostInvitation(String username,Integer postId) {
        Query query = null;
        query = entityManager.createQuery("select u from User u where u.displayName like :username and u.roleId.id = 2 and u not in (select p.teacherId from PostInvitation p where p.postId.id =:postId ) ", User.class);
        List<User> users = null;
        try {
            query.setParameter("username", "%" + username + "%");
            query.setParameter("postId",postId);
            users =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return users;
    }
}
