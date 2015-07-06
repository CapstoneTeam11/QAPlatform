package com.qaproject.controller;

import com.qaproject.dao.*;
import com.qaproject.entity.*;
import com.qaproject.util.Utilities;
import com.sun.deploy.net.HttpResponse;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.nio.file.FileAlreadyExistsException;
import java.util.ArrayList;
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
    @Autowired
    TagDao tagDao;

    @RequestMapping(value = "/material", method = RequestMethod.GET)
    public String material(ModelMap model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/";
        }
        List<Folder> folders = folderDao.findByUser(user);
        model.addAttribute("folders", folders);
        return "material";
    }
    @RequestMapping(value = "/material/delete", method = RequestMethod.POST)
    public String deleteMaterial(ModelMap model,@RequestParam Integer materialId) {
        User user = (User) session.getAttribute("user");
        int flag = 0;
        int classId = 0;
        if (user == null) {
            return "redirect:/";
        }
        Material material = materialDao.find(materialId);
        if(material==null) {
            return "404";
        }
        //if material is class's material
        if(material.getOwnerClassId()!=null) {
            classId = material.getOwnerClassId().getId();
            //authorize user is classroom's teacher
            if(user.getId()!=material.getOwnerClassId().getOwnerUserId().getId()) {
                return "403";
            }
        }
        //if material is user's material
        if(material.getFolderId()!=null) {
            flag =1;
            if(material.getFolderId().checkUser(user)==false) {
                return "403";
            }
        }
        try{
            File file = new File(material.getFileURL());
            if(file.delete()){
                System.out.println(file.getName() + " is deleted!");
            }else{
                System.out.println("Delete operation is failed.");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        materialDao.remove(material);
        if(flag==1) {
            return "redirect:/material";
        }
        return "redirect:/classroom/"+classId;
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
        model.addAttribute("folderName",folder.getName());
        model.addAttribute("materials", materials);
        return "materialList";
    }

    @RequestMapping(value = "/folder/create", method = RequestMethod.POST)
    public String addFolder(@RequestParam String name,
                            ModelMap model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "welcome";
        }
        Folder folder = new Folder();
        folder.setManagerId(user);
        folder.setName(name);
        folderDao.persist(folder);
        return "redirect:/material";
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String upload(@RequestParam Integer classId,
                         @RequestParam List<Integer> tagId,
                         @RequestParam(required = false) List<String> newTag,
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
                    List<TagMaterial> tagMaterials = new ArrayList<TagMaterial>();
                    for (int i = 0; i < tagId.size(); i++) {
                        TagMaterial tagMaterial = new TagMaterial();
                        tagMaterial.setMaterialId(material);
                        tagMaterial.setTagId(tagDao.find(tagId.get(i)));
                        tagMaterials.add(tagMaterial);
                    }
                    if (newTag != null) {
                        for (int i = 0; i < newTag.size(); i++) {
                            TagMaterial tagMaterial = new TagMaterial();
                            tagMaterial.setMaterialId(material);
                            Tag tag = new Tag();
                            tag.setTagName(newTag.get(i));
                            tagDao.persist(tag);
                            tagMaterial.setTagId(tag);
                            tagMaterials.add(tagMaterial);
                        }
                    }
                    material.getTagMaterials().addAll(tagMaterials);
                    materialDao.persist(material);
                }

            }
        }
        return "redirect:/classroom/"+classId;
    }

    @RequestMapping(value = "/download/{materialId}", method = RequestMethod.GET)
    public String downloadMaterialClass(@PathVariable Integer materialId,HttpServletResponse response ) {
        //validate and authorize
        Material material = materialDao.find(materialId);
        File downloadFile = new File(material.getFileURL());
        FileInputStream inputStream = null;
        OutputStream outStream = null;
        try {
            inputStream = new FileInputStream(downloadFile);

            response.setContentLength((int) downloadFile.length());
            response.setContentType(material.getName());

            // response header
            String headerKey = "Content-Disposition";
            String headerValue = String.format("attachment; filename=\"%s\"",downloadFile.getName());
            response.setHeader(headerKey, headerValue);

            // Write response
            outStream = response.getOutputStream();
            IOUtils.copy(inputStream, outStream);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != inputStream)
                    inputStream.close();
                if (null != inputStream)
                    outStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        return "classroom";
    }
    @RequestMapping(value = "/library/add/{folderId}/{materialId}", method = RequestMethod.GET)
    public String copyMaterial(@PathVariable Integer folderId,
                                        @PathVariable Integer materialId) {
        User user = (User) session.getAttribute("user");
        Material material = materialDao.find(materialId);
        int error = 0;
        if (user == null) {
            return "redirect:/";
        }
        //validate
        String destPath = "C:\\User"+"\\"+user.getId()+"\\"+folderId;
        String dest = "C:\\User"+"\\"+user.getId()+"\\"+folderId + "\\" + material.getName();
        try {
            File filePath = new File(destPath);
            if(!filePath.exists()) {
                filePath.mkdirs();
            }
            File fileDest = new File(dest);
            File fileSource = new File(material.getFileURL());
            Utilities.copyFileUsingJava7Files(fileSource, fileDest);
        } catch (FileAlreadyExistsException f) {
            f.printStackTrace();
            System.out.println("Already Exists");
            error = 1;
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Fall");
            error = 1;
        }
        //Send error to User
        Material materialCopy = new Material();
        materialCopy.setName(material.getName());
        materialCopy.setCreationDate(new Date());
        materialCopy.setFolderId(folderDao.find(folderId));
        materialCopy.setFileURL(dest);
        materialCopy.setSize(material.getSize());
        materialDao.persist(materialCopy);
        return "redirect:/classroom/"+material.getOwnerClassId().getId();
    }
}
