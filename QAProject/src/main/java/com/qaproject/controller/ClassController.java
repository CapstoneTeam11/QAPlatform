package com.qaproject.controller;

import com.qaproject.dao.CategoryDao;
import com.qaproject.dao.ClassroomDao;
import com.qaproject.dao.TagClassroomDao;
import com.qaproject.dao.impl.ClassroomDaoImpl;
import com.qaproject.dao.impl.TagClassroomDaoImpl;
import com.qaproject.dao.impl.TagDaoImpl;
import com.qaproject.dto.UserWithRoleDto;
import com.qaproject.entity.Category;
import com.qaproject.entity.Classroom;
import com.qaproject.entity.Tag;
import com.qaproject.entity.TagClassroom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by TADUCTUNG on 03-Jun-15.
 */

@Controller
public class ClassController {
    @Autowired
    ClassroomDaoImpl classroomDao;
    @Autowired
    TagClassroomDaoImpl tagClassroomDao;
    @Autowired
    TagDaoImpl tagDao;
    @Autowired
    CategoryDao categoryDao;
    @RequestMapping(value = "/createClass",method = RequestMethod.GET)
    public String createClass(ModelMap model) {
        List<Category> categoryList = categoryDao.findAll();
        model.addAttribute("categories",categoryList);
        return "createClass";
    }
    @RequestMapping(value= "/createClass1",method= RequestMethod.GET)
    @ResponseBody
    public String register(@RequestParam("classroomName") String classroomName,@RequestParam("classroomDescription") String classroomDescription,
                           @RequestParam("categoryId") String categoryId, @RequestParam("tag") String tag, Model model) {

        Classroom room = new Classroom();
        Category category = new Category();
        category.setId(Integer.parseInt(categoryId));
        room.setCategoryId(category);
        room.setClassroomDescription(classroomDescription);
        room.setClassroomName(classroomName);
        classroomDao.persist(room);
        String[] tagList = tag.split(",");
        for (int i = 0; i<= tagList.length-1; i++){
            TagClassroom tagClassroom = new TagClassroom();
            tagClassroom.setClassroomId(room);
            String tagName = tagList[i].trim();
            Tag tagFind = tagDao.tagsByName(tagName).get(0);
            if(tagFind == null){
                Tag tagNew = new Tag();
                tagNew.setTagName(tagName);
                tagNew.setTagCount(0);
                tagDao.persist(tagNew);
                tagFind = tagNew;
            }
            tagClassroom.setTagId(tagFind);
            tagClassroomDao.persist(tagClassroom);
            tagFind.setTagCount(tagFind.getTagCount()+1);
            tagDao.merge(tagFind);
        }

        return "OK";
    }
}
