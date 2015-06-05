package com.qaproject.controller;

import com.qaproject.dao.TagDao;
import com.qaproject.entity.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by khangtnse60992 on 6/4/2015.
 */
@Controller
public class TagController {

    @Autowired
    TagDao tagDao;

    @RequestMapping(value = "/tag/{keyword}", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody List<Tag> getListTag(@PathVariable String keyword) {
        List<Tag> tags = tagDao.TagsByName(keyword);
        return tags;
    }
}
