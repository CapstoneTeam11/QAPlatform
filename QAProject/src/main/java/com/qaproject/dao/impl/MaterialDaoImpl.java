package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.MaterialDao;
import com.qaproject.entity.Material;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class MaterialDaoImpl extends BaseDao<Material,Integer> implements MaterialDao {
    @Override
    public List<Material> findMaterialByClassroom(Integer classroomId, Integer nextFrom) {
        Query query = entityManager.createQuery("Select m from Material m where m.ownerClassId.id=:classroomId " +
                "order by m.id desc ");
        query.setParameter("classroomId",classroomId);
        if (nextFrom < 0) {
            nextFrom = 0;
        }
        query.setFirstResult(nextFrom);
        query.setMaxResults(11);
        List<Material> materials = null;
        try{
            materials = query.getResultList();
        } catch (NoResultException e){
            e.printStackTrace();
        }
        return materials;
    }
}
