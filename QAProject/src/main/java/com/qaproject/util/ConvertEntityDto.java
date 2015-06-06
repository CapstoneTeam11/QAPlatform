package com.qaproject.util;

import com.qaproject.dto.TagDto;
import com.qaproject.entity.Tag;

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
}
