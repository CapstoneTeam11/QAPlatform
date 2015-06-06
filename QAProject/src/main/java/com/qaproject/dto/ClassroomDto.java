package com.qaproject.dto;

import com.qaproject.entity.Tag;

import java.util.List;

/**
 * Created by TADUCTUNG on 03-Jun-15.
 */
public class ClassroomDto {
    public String classroomName;
    public List<Tag> tag;
    public String classroomDescription;
    public int categoryId;

    public String getClassroomName() {
        return classroomName;
    }

    public void setClassroomName(String classroom) {
        this.classroomName = classroom;
    }

    public List<Tag> getTag() {
        return tag;
    }

    public void setTag(List<Tag> tag) {
        this.tag = tag;
    }

    public String getClassroomDescription() {
        return classroomDescription;
    }

    public void setClassroomDescription(String classroomDescription) {
        this.classroomDescription = classroomDescription;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public ClassroomDto() {
    }
}
