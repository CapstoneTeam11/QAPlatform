package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.UserDao;
import com.qaproject.entity.User;
import org.springframework.stereotype.Repository;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class UserDaoImpl extends BaseDao<User,Integer> implements UserDao {
}
