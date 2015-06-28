package com.qaproject.dto;

/**
 * Created by TADUCTUNG on 08-Jun-15.
 */
public class StudentDto {
    private Integer Id;
    private Integer studentId;
    private String studentName;
    private String studentProfileImageURL;

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentProfileImageURL() {
        return studentProfileImageURL;
    }

    public void setStudentProfileImageURL(String studentProfileImageURL) {
        this.studentProfileImageURL = studentProfileImageURL;
    }
}

