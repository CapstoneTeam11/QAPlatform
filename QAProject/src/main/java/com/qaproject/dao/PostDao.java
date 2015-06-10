package com.qaproject.dao;

import com.qaproject.entity.Post;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public interface PostDao {
    List<Post> findAll();
    public Post find(Integer id);
    public List<Post> findPostChilds(Integer id,Integer page);
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(Post entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(Post entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(Post entity);
}
