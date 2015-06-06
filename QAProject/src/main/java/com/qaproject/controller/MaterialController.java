package com.qaproject.controller;

import com.qaproject.dao.FolderDao;
import com.qaproject.dao.MaterialDao;
import com.qaproject.dao.UserDao;
import com.qaproject.entity.Folder;
import com.qaproject.entity.Material;
import com.qaproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by khangtnse60992 on 6/6/2015.
 */
@Controller
public class MaterialController {

    @Autowired
    FolderDao folderDao;
    @Autowired
    MaterialDao materialDao;
    @Autowired
    HttpSession session;


    @RequestMapping(value = "/library",method = RequestMethod.GET)
    public String material(ModelMap model) {
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return "welcome";
        }
        List<Folder> folders = folderDao.findByUser(user);
        model.addAttribute("folders",folders);
        return "material";
    }
    @RequestMapping(value = "/folder/{id}",method = RequestMethod.GET)
    public String material(@PathVariable Integer id,
                           ModelMap model) {
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return "welcome";
        }
        Folder folder = folderDao.find(id);
        if(folder==null) {
            return "welcome";
        }
        if(folder.checkUser(user)==false) {
            return "welcome";
        }
        List<Material> materials = folder.getMaterialList();
        model.addAttribute("materials",materials);
        return "materialList";
    }

    @RequestMapping(value = "/folder/create",method = RequestMethod.POST)
    public String AddFolder(@RequestParam String name,
                           ModelMap model) {
        User user = (User) session.getAttribute("user");
        if(user==null) {
            return "welcome";
        }
        Folder folder = new Folder();
        folder.setManagerId(user);
        folder.setName(name);
        folderDao.persist(folder);
        return "redirect:/library";
    }

}
