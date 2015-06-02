package com.qaproject.dao;

import com.qaproject.entity.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public interface UserDao {
    public User find(Integer id);
    List<User> findAll();
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(User entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(User entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(User entity);
    public List<User> login(String username, String password);
}
