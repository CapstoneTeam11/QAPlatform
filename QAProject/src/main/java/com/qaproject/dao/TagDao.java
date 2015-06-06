package com.qaproject.dao;

import com.qaproject.entity.Tag;
import org.springframework.stereotype.Repository;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Repository
public interface TagDao {
    public Tag find(Integer id);
    public Tag find(String tagName);
}
