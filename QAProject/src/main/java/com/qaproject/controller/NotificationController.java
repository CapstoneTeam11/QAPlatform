package com.qaproject.controller;

import com.qaproject.dao.ClassroomDao;
import com.qaproject.dao.NotificationDao;
import com.qaproject.dao.PostDao;
import com.qaproject.dto.NotificationDto;
import com.qaproject.entity.Notification;
import com.qaproject.util.Constant;
import com.qaproject.util.ConvertEntityDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/23/2015.
 */
@Controller
public class NotificationController {

    @Autowired
    NotificationDao notificationDao;

    @Autowired
    ClassroomDao classroomDao;

    @Autowired
    PostDao postDao;

    @RequestMapping(value = "/notification/{id}",method = RequestMethod.GET,produces = "application/json")
    public @ResponseBody
    List<NotificationDto> getListNotification(@PathVariable int id) {
        List<Notification> notifications = notificationDao.findByUserId(id);
        List<NotificationDto> notificationDtos = new ArrayList<NotificationDto>();
        for(int i = 0 ; i < notifications.size();i++) {
            Notification notification = notifications.get(i);
            if (notification.getNotificationType() == Constant.NT_TEACHER_CREATE_CLASS ||
                    notification.getNotificationType()  == Constant.NT_INVITE_TO_JOIN_CLASS
                    || notification.getNotificationType()  == Constant.NT_ACCEPT_TO_JOIN_CLASS ||
                    notification.getNotificationType()  == Constant.NT_REQUEST_TO_JOIN_CLASS) {

                Object object = classroomDao.find(notification.getObjectId());
                notificationDtos.add(ConvertEntityDto.convertNotificationEntityToDto(notification,notification.getNotificationType(),object));
            } else {
                Object object = postDao.find(notification.getObjectId());
                notificationDtos.add(ConvertEntityDto.convertNotificationEntityToDto(notification,notification.getNotificationType(),object));
            }
        }
        return notificationDtos;
    }
    @RequestMapping(value = "/notification/setview/{id}",method = RequestMethod.POST,produces = "application/json")
    public @ResponseBody
    String setListNotification(@PathVariable int id) {
        try {
            notificationDao.setAllView(id);
        } catch (Exception e) {
            e.printStackTrace();
            return "NG";
        }
        return "OK";
    }
    @RequestMapping(value = "/notification/unview/{id}",method = RequestMethod.GET,produces = "application/json")
    public @ResponseBody
    Integer getNumberUnview(@PathVariable int id) {
        int numberUnview = 0;
        try {
            numberUnview =  notificationDao.getNumberUnview(id);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return numberUnview;
    }

}
