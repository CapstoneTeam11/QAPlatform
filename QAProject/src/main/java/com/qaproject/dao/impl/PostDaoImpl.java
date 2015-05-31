package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.PostDao;
import com.qaproject.entity.Post;
import org.springframework.stereotype.Repository;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class PostDaoImpl extends BaseDao<Post,Integer> implements PostDao{
    public List<Post> findAll() {
        Query query = null;
        query = entityManager.createQuery("select u from Post u", Post.class);

        List<Post> post = null;
        try {
            post =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return post;
    }
}
