package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.UserDao;
import com.qaproject.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class UserDaoImpl extends BaseDao<User,Integer> implements UserDao {
    @Override
    public List<User> findAll() {
        return null;
    }
}
