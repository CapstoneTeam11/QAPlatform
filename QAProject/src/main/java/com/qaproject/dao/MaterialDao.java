package com.qaproject.dao;

import com.qaproject.entity.Classroom;
import com.qaproject.entity.Material;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public interface MaterialDao {
    public Material find(Integer id);
    List<Material> findAll();
    List<Material> findMaterialByClassroom(Integer classroomId, Integer lastId);
    List<Material> findMaterialByClassroomLikeName(Integer classroomId, String searchKey, Integer lastId);
    List<Material> findMaterialByCategory (Integer categoryId, Integer nextFrom);
    List<Material> findMaterialByOwnerClassroom(Classroom classroom);
    List<Material> findMaterialLikeName(String searchKey, Integer lastId);
    @Transactional(propagation = Propagation.REQUIRED)
    public void persist(Material entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void merge(Material entity);
    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(Material entity);
}
