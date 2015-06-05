package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.TagDao;
import com.qaproject.entity.Tag;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class TagDaoImpl extends BaseDao<Tag,Integer> implements TagDao {
    /**
     * 06/06/2015
     * Using to get a list tag by name
     * @param name
     * @return List<tag>
     */
    public List<Tag> TagsByName(String name) {
        Query query = null;
        query = entityManager.createQuery("select t from Tag t where t.tagName=:name",Tag.class);
        query.setParameter("name",name);
        List<Tag> tags = null;
        try {
            tags = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Tags null , Exception");
        }
        return null;
    }
}
