package com.qaproject.dao;

import com.qaproject.entity.Classroom;
import com.qaproject.entity.Role;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public interface ClassroomDao {
    public Classroom find(Integer id);
    List<Classroom> findAll();
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(Classroom entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(Classroom entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(Classroom entity);
}
