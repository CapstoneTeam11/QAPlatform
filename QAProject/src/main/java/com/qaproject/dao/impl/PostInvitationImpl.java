package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.PostInvitationDao;
import com.qaproject.entity.PostInvitation;
import com.qaproject.util.Constant;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import java.util.List;

/**
 * Created by khangtnse60992 on 6/5/2015.
 */
@Repository
public class PostInvitationImpl extends BaseDao<PostInvitation,Integer> implements PostInvitationDao {

    @Override
    public List<PostInvitation> findLastInvitationsByTeachers(List<Integer> teacherIds) {
        List<PostInvitation> postInvitations = null;
        Query query = entityManager.createQuery("Select pi from PostInvitation pi where pi.teacherId.id in :teacherIds");
        query.setParameter("teacherIds",teacherIds);
        try {
            postInvitations = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return postInvitations;
    }

    @Override
    public List<PostInvitation> findPostInvitationForDashboard(Integer teacherId, Integer page) {
        List<PostInvitation> postInvitations = null;
        Query query = entityManager.createQuery("Select pi from PostInvitation pi where pi.teacherId.id=:teacherId " +
                "order by pi.id desc");
        query.setParameter("teacherId",teacherId);
        if (page < 1) {
            page = 1;
        }
        query.setFirstResult((page - 1) * Constant.NUMBER_PAGE);
        query.setMaxResults(Constant.NUMBER_PAGE+1);
        try {
            postInvitations = query.getResultList();
        } catch (Exception e){
            e.printStackTrace();
        }
        return postInvitations;
    }
}
