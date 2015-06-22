package com.qaproject.util;

import com.qaproject.dto.PostDto;
import com.qaproject.dto.TagDto;
import com.qaproject.entity.Post;
import com.qaproject.entity.Tag;

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
    public static String ConvertDateTime(Date date) {
        DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
        return df.format(date);
    }
}
