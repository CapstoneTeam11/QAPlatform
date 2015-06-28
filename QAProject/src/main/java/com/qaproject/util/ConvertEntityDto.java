package com.qaproject.util;

import com.qaproject.dao.FollowerDao;
import com.qaproject.dao.PostDao;
import com.qaproject.dao.impl.PostDaoImpl;
import com.qaproject.dto.*;
import com.qaproject.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by khangtnse60992 on 6/5/2015.
 */
public class ConvertEntityDto {

    public static TagDto convertTagEntityToDto(Tag tag) {
        TagDto tagDto = new TagDto();
        tagDto.setId(tag.getId());
        tagDto.setName(tag.getTagName());
        tagDto.setCount(tag.getTagCount());
        return tagDto;
    }
    public static PostDto convertPostEntityToDto(Post post) {
        PostDto postDto = new PostDto();
        postDto.setId(post.getId());
        postDto.setOwnerId(post.getOwnerUserId().getId());
        postDto.setParentId(post.getParentId());
        postDto.setPostType(post.getPostType());
        postDto.setLastEditedDate(ConvertDateTime(post.getLastEditedDate()));
        postDto.setBody(post.getBody());
        postDto.setAcceptedAnswerId(post.getAcceptedAnswerId());
        postDto.setClassName(post.getOwnerClassId().getClassroomName());
        postDto.setOwnerName(post.getOwnerUserId().getDisplayName());
        postDto.setOwnerProfileImageURL(post.getOwnerUserId().getProfileImageURL());
        return postDto;
    }

    public static PostDto convertPostEntityToDto(Post post, Integer answerCount) {
        PostDto postDto = new PostDto();
        if (post!=null) {
            postDto.setId(post.getId());
            postDto.setTitle(post.getTitle());
            postDto.setOwnerId(post.getOwnerUserId().getId());
            postDto.setParentId(post.getParentId());
            postDto.setPostType(post.getPostType());
            postDto.setLastEditedDate(ConvertDateTime(post.getLastEditedDate()));
            postDto.setBody(post.getBody());
            postDto.setAcceptedAnswerId(post.getAcceptedAnswerId());
            postDto.setClassName(post.getOwnerClassId().getClassroomName());
            postDto.setOwnerName(post.getOwnerUserId().getDisplayName());
            postDto.setOwnerProfileImageURL(post.getOwnerUserId().getProfileImageURL());
            postDto.setClassId(post.getOwnerClassId().getId());
            postDto.setAnswerCount(answerCount);
        }
        return postDto;
    }

    public static FollowerDto convertFollowerEntityToDto(Follower follower) {
        FollowerDto followerDto = new FollowerDto();
        if (follower!=null) {
            followerDto.setId(follower.getId());
            followerDto.setTeacherId(follower.getTeacherId().getId());
            followerDto.setTeacherName(follower.getTeacherId().getDisplayName());
            followerDto.setAboutTeacher(follower.getTeacherId().getAboutMe());
            followerDto.setProfileImageURL(follower.getFollowerId().getProfileImageURL());
            followerDto.setFollowerId(follower.getFollowerId().getId());
        }
        return followerDto;
    }

    public static ClassroomDto convertClassroomUserEntityToClassroomDto(ClassroomUser classroomUser){
        ClassroomDto classroomDto = new ClassroomDto();
        if (classroomUser!=null) {
            Classroom classroom = classroomUser.getClassroomId();
            classroomDto.setId(classroom.getId());
            classroomDto.setTeacherId(classroom.getOwnerUserId().getId());
            classroomDto.setClassroomName(classroom.getClassroomName());
            classroomDto.setClassroomDescription(classroom.getClassroomDescription());
            classroomDto.setStatus(classroom.getStatus());
        }
        return classroomDto;
    }

    public static ClassroomInvitationDto convertClassroomUserEntityToClassroomInvitationDto(ClassroomUser classroomUser){
        ClassroomInvitationDto classroomInvitationDto = new ClassroomInvitationDto();
        if (classroomUser!=null) {
            Classroom classroom = classroomUser.getClassroomId();
            classroomInvitationDto.setId(classroomUser.getId());
            classroomInvitationDto.setClassroomId(classroom.getId());
            classroomInvitationDto.setClassroomName(classroom.getClassroomName());
            classroomInvitationDto.setTeacherId(classroom.getOwnerUserId().getId());
            classroomInvitationDto.setTeacherName(classroom.getOwnerUserId().getDisplayName());
        }
        return classroomInvitationDto;
    }

    public static ClassroomDto convertClassroomEntityToDto(Classroom classroom){
        ClassroomDto classroomDto = new ClassroomDto();
        if (classroom!=null) {
            classroomDto.setId(classroom.getId());
            classroomDto.setTeacherId(classroom.getOwnerUserId().getId());
            classroomDto.setClassroomName(classroom.getClassroomName());
            classroomDto.setClassroomDescription(classroom.getClassroomDescription());
            classroomDto.setStatus(classroom.getStatus());
        }
        return classroomDto;
    }

    public static PostInvitationDto convertPostInvitationEntityToDto(PostInvitation postInvitation) {
        PostInvitationDto postInvitationDto = new PostInvitationDto();
        if (postInvitation!=null){
            Post post = postInvitation.getPostId();
            postInvitationDto.setId(postInvitation.getId());
            postInvitationDto.setPostId(post.getId());
            postInvitationDto.setPostTitle(post.getTitle());
            postInvitationDto.setTeacherId(post.getOwnerClassId().getOwnerUserId().getId());
            postInvitationDto.setTeacherName(post.getOwnerClassId().getOwnerUserId().getDisplayName());
            postInvitationDto.setClassroomId(postInvitation.getPostId().getOwnerClassId().getId());
            postInvitationDto.setClassroomName(postInvitation.getPostId().getOwnerClassId().getClassroomName());
        }
        return postInvitationDto;
    }

    public static NotificationDto convertNotificationEntityToDto(Notification notification, Integer notificationType,Object object) {
        NotificationDto notificationDto = new NotificationDto();
        if (notification!=null && notificationType > 0 && notificationType <= 7 ) {
            if (notificationType == Constant.NT_TEACHER_CREATE_CLASS ||
                    notificationType == Constant.NT_INVITE_TO_JOIN_CLASS ||
                    notificationType == Constant.NT_REQUEST_TO_JOIN_CLASS) {
                if (!(object instanceof Classroom)) {
                    return  notificationDto;
                }
                Classroom classroom = (Classroom) object;
                notificationDto.setObjectName(classroom.getClassroomName());
                notificationDto.setHref("/classroom/"+String.valueOf(notification.getObjectId()));
            }
            if (notificationType == Constant.NT_TEACHER_CREATE_POST ||
                    notificationType == Constant.NT_STUDENT_CREATE_POST ||
                    notificationType == Constant.NT_INVITE_TO_ANSWER_POST) {
                if (!(object instanceof Post)) {
                    return notificationDto;
                }
                Post post = (Post) object;
                notificationDto.setObjectName(post.getTitle());
                notificationDto.setHref("/post/view/"+String.valueOf(notification.getObjectId()));
            }

            notificationDto.setId(notification.getId());
            notificationDto.setReceiverId(notification.getReceiverId().getId());
            notificationDto.setSenderId(notification.getSenderId().getId());
            notificationDto.setSenderDisplayName(notification.getSenderId().getDisplayName());
            notificationDto.setNotificationType(notificationType);
            notificationDto.setObjectId(notification.getObjectId());
        }
        return notificationDto;
    }

    public static MaterialDto convertMaterialEntityToDto(Material material){
        MaterialDto materialDto = new MaterialDto();
        if (material!=null) {
            materialDto.setId(material.getId());
            materialDto.setName(material.getName());
            materialDto.setOwnerClassroomId(material.getOwnerClassId().getId());
            materialDto.setOwnerClassroomName(material.getOwnerClassId().getClassroomName());
            materialDto.setCreationDate(ConvertDateTime(material.getCreationDate()));
            materialDto.setSize(material.getSize());
            materialDto.setFileURL(material.getFileURL());
        }
        return materialDto;
    }

    public static RequestDto convertClassroomUserEntityToRequestDto(ClassroomUser classroomUser){
        RequestDto requestDto = new RequestDto();
        if (classroomUser!=null){
            requestDto.setId(classroomUser.getId());
            requestDto.setStudentId(classroomUser.getUserId().getId());
            requestDto.setStudentName(classroomUser.getUserId().getDisplayName());
            requestDto.setStudentProfileImageURL(classroomUser.getUserId().getProfileImageURL());
        }
        return requestDto;
    }

    public static StudentDto convertClassroomUserEntityToStudentDto(ClassroomUser classroomUser){
        StudentDto studentDto = new StudentDto();
        if (classroomUser!=null){
            studentDto.setClassroomUserId(classroomUser.getId());
            studentDto.setStudentId(classroomUser.getUserId().getId());
            studentDto.setStudentName(classroomUser.getUserId().getDisplayName());
            studentDto.setStudentProfileImageURL(classroomUser.getUserId().getProfileImageURL());
        }
        return studentDto;
    }



    public static String ConvertDateTime(Date date) {
        DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
        return df.format(date);
    }
}
