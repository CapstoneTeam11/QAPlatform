package com.qaproject.controller;

import com.qaproject.dao.CategoryDao;
import com.qaproject.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by TADUCTUNG on 02-Jun-15.
 */
@Controller
public class MainController {
    @Autowired
    CategoryDao categoryDao;
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String printWelcome(ModelMap model) {
        List<Category> categoryList = categoryDao.findAll();
        model.addAttribute("categories",categoryList);
        return "welcome";
    }
}
