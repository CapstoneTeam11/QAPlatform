package com.qaproject.controller;

import com.qaproject.dao.ClassroomDao;
import com.qaproject.dao.FolderDao;
import com.qaproject.dao.MaterialDao;
import com.qaproject.dao.UserDao;
import com.qaproject.entity.Classroom;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
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
    ClassroomDao classroomDao;
    @Autowired
    HttpSession session;


    @RequestMapping(value = "/library", method = RequestMethod.GET)
    public String material(ModelMap model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/";
        }
        List<Folder> folders = folderDao.findByUser(user);
        model.addAttribute("folders", folders);
        return "material";
    }

    @RequestMapping(value = "/folder/{id}", method = RequestMethod.GET)
    public String material(@PathVariable Integer id,
                           ModelMap model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/";
        }
        Folder folder = folderDao.find(id);
        if (folder == null) {
            return "redirect:/";
        }
        if (folder.checkUser(user) == false) {
            return "redirect:/";
        }
        List<Material> materials = folder.getMaterialList();
        model.addAttribute("materials", materials);
        return "materialList";
    }

    @RequestMapping(value = "/folder/create", method = RequestMethod.POST)
    public String AddFolder(@RequestParam String name,
                            ModelMap model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "welcome";
        }
        Folder folder = new Folder();
        folder.setManagerId(user);
        folder.setName(name);
        folderDao.persist(folder);
        return "redirect:/library";
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String Upload(@RequestParam Integer classId,
                         @RequestParam CommonsMultipartFile[] fileUpload,
                         ModelMap model) {
        Classroom classroom = classroomDao.find(classId);
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/";
        }
        if (classroom.getOwnerUserId().getId() != user.getId()) {
            return "redirect:/";
        }
        if (fileUpload != null && fileUpload.length > 0) {
            int error = 0;
            for (CommonsMultipartFile aFile : fileUpload) {
                File dir = new File("C:\\Classroom\\" + classId);
                if (dir.exists() == false) {
                    if(!dir.mkdirs()) {
                        System.out.println("Cant create folder");
                    }
                }
                try {
                    File fileServer = new File(dir.getAbsolutePath() + File.separator + aFile.getOriginalFilename());
                    BufferedOutputStream stream = new BufferedOutputStream(
                            new FileOutputStream(fileServer));
                    stream.write(aFile.getBytes());
                    stream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    error = 1;
                }
                System.out.println("Saving file: " + aFile.getOriginalFilename());
                if (error == 0) {
                    Material material = new Material();
                    material.setName(aFile.getOriginalFilename());
                    material.setFileURL(dir.getAbsolutePath() + File.separator + aFile.getOriginalFilename());
                    material.setOwnerClassId(classroom);
                    material.setSize(((Long) aFile.getSize()).doubleValue());
                    material.setCreationDate(new Date());
                    materialDao.persist(material);
                }

            }
        }
        return "redirect:/library";
    }

}
