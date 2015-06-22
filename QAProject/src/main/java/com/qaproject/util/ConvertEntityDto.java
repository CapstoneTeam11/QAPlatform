package com.qaproject.util;

import com.qaproject.dao.FollowerDao;
import com.qaproject.dto.*;
import com.qaproject.entity.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

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
        }
        return classroomDto;
    }

    public static ClassroomInvitationDto convertClassroomUserEntityToClassroomInvitationDto(ClassroomUser classroomUser){
        ClassroomInvitationDto classroomInvitationDto = new ClassroomInvitationDto();
        if (classroomUser!=null) {
            Classroom classroom = classroomUser.getClassroomId();
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

    public static String ConvertDateTime(Date date) {
        DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
        return df.format(date);
    }
}
