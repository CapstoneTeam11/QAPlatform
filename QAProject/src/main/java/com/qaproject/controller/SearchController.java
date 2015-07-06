package com.qaproject.controller;

import com.qaproject.dto.ClassroomDto;
import com.qaproject.dto.MaterialDto;
import com.qaproject.dto.PostDto;
import com.qaproject.dto.UserDto;
import com.qaproject.util.SearchUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Minh on 7/6/2015.
 */
@Controller
public class SearchController {
    @Autowired
    SearchUtilities searchUtilities;

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String create(@RequestParam Integer filter,
                         @RequestParam String searchKey,
                         ModelMap model) {
        if (searchKey==null){
            searchKey="";
        }
        searchKey = searchKey.trim();
        if (searchKey.length()>255){
            searchKey = searchKey.substring(0,255);
        }
        List<PostDto> questions = new ArrayList<PostDto>();
        List<PostDto> articles = new ArrayList<PostDto>();
        List<MaterialDto> materials = new ArrayList<MaterialDto>();
        List<ClassroomDto> classrooms = new ArrayList<ClassroomDto>();
        List<UserDto> users = new ArrayList<UserDto>();
        if (filter==0) {
            questions = searchUtilities.getTopThreeQuestions(searchKey);
            articles = searchUtilities.getTopThreeArticles(searchKey);
            materials = searchUtilities.getTopThreeMaterials(searchKey);
            classrooms = searchUtilities.getTopThreeClassrooms(searchKey);
            users = searchUtilities.getTopThreeUsers(searchKey);
        }
        model.addAttribute("questions",questions);
        model.addAttribute("articles",articles);
        model.addAttribute("materials",materials);
        model.addAttribute("classrooms",classrooms);
        model.addAttribute("users",users);
        model.addAttribute("searchKey", searchKey);
        return "searchResult";
    }
}
