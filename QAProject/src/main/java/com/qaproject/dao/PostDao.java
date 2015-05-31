package com.qaproject.dao;

import com.qaproject.entity.Post;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public interface PostDao {
    List<Post> findAll();
}
