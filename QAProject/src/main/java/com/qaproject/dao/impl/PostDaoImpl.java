package com.qaproject.dao.impl;

import com.qaproject.dao.BaseDao;
import com.qaproject.dao.PostDao;
import com.qaproject.entity.Post;
import org.springframework.stereotype.Repository;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public class PostDaoImpl extends BaseDao<Post,Integer> implements PostDao{
}
