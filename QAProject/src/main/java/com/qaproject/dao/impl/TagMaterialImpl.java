package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.TagMaterialDao;
import com.qaproject.entity.TagMaterial;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import java.util.List;

/**
 * Created by khangtnse60992 on 6/30/2015.
 */
@Repository
public class TagMaterialImpl extends BaseDao<TagMaterial,Integer> implements TagMaterialDao{
    @Override
    public List<Integer> findRelatedMaterialIds(List<Integer> tagIds) {
        List<Integer> relatedMaterialIds = null;
        Query query = entityManager.createQuery("Select tp.materialId.id from TagMaterial tp WHERE tp.tagId.id in :tagIds " +
                "group by tp.materialId " +
                "order by count(tp.tagId) DESC");
        query.setParameter("tagIds",tagIds);
        query.setMaxResults(10);
        try {
            relatedMaterialIds = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return relatedMaterialIds;
    }
}
