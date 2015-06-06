package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.TagDao;
import com.qaproject.entity.Tag;
import com.qaproject.entity.User;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class TagDaoImpl extends BaseDao<Tag,Integer> implements TagDao {
    @Override
    public Tag find(String tagName) {
        Query query = null;
        query = entityManager.createQuery("select t from Tag t where t.tagName = :tagName", Tag.class);

        List<Tag> tags = null;
        try {
            query.setParameter("tagName", tagName);
            tags =  query.getResultList();
        } catch (NoResultException e) {
            System.out.println("User null");
        }
        return tags.size()==0?null:tags.get(0);
    }


}
