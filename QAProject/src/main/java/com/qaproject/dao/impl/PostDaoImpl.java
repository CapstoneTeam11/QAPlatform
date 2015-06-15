package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.PostDao;
import com.qaproject.entity.Post;
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

    @Override
    public List<Post> findPostChilds(Integer id,Integer page) {
        Query query = null;
        query = entityManager.createQuery("select u from Post u where u.parentId =:id order by u.id desc ", Post.class);
        query.setParameter("id", id);
        if (page < 1) {
            page = 1;
        }
        query.setFirstResult((page - 1) * Constant.NUMBER_PAGE);
        query.setMaxResults(Constant.NUMBER_PAGE+1);
        List<Post> posts = null;
        try {
            posts =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return posts;
    }

    @Override
    public List<Post> findQuestionsByOwnerUser(User ownerUser){
        Query query = entityManager.createQuery("Select p from Post  p where p.parentId=0 and p.postType=1 " +
                "and p.ownerUserId=:ownerUser");
        query.setParameter("ownerUser", ownerUser);
        List<Post> questions = null;
        try {
            questions = query.getResultList();
        } catch (NoResultException e){

        }
        return questions;
    }

    @Override
    public List<Post> findRepliesByParentId(Integer parentId) {
        Query query = entityManager.createQuery("Select p from Post p where p.parentId=:parentId");
        query.setParameter("parentId",parentId);
        List<Post> replies = null;
        try {
            replies = query.getResultList();
        } catch (NoResultException e){

        }
        return replies;
    }
}
