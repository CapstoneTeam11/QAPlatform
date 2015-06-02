package com.qaproject.dao;

import com.qaproject.entity.Library;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public interface LibraryDao {
    public Library find(Integer id);
    List<Library> findAll();
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(Library entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(Library entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(Library entity);
}
