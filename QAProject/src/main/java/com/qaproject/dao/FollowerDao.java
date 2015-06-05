package com.qaproject.dao;

import com.qaproject.entity.Follower;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 6/5/2015.
 */
@Repository
public interface FollowerDao {
    public Follower find(Integer id);
    List<Follower> findAll();
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(Follower entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(Follower entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(Follower entity);
}
