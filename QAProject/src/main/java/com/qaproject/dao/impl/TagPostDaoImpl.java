package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.TagPostDao;
import com.qaproject.entity.TagPost;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class TagPostDaoImpl extends BaseDao<TagPost,Integer> implements TagPostDao {
    @Override
    public List<Integer> findRelatedPostIds(List<Integer> tagIds) {
        List<Integer> relatedPostIds = null;
        Query query = entityManager.createQuery("Select tp.postId.id from TagPost tp WHERE tp.tagId.id in :tagIds " +
                "group by tp.postId " +
                "order by count(tp.tagId) DESC");
        query.setParameter("tagIds",tagIds);
        query.setMaxResults(5);
        try {
            relatedPostIds = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return relatedPostIds;
    }
}
