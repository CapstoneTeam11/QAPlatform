package com.qaproject.dto;

/**
 * Created by TADUCTUNG on 08-Jun-15.
 */
public class StudentDto {
    private String studentName;
    private int studentId;

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public StudentDto() {
    }

    public StudentDto(String studentName, int studentId) {
        this.studentName = studentName;
        this.studentId = studentId;
    }
}
