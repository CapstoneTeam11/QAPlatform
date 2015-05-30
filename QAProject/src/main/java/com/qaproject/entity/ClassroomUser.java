package com.qaproject.entity;

import javax.persistence.*;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Entity
@Table(name = "classroom_user", schema = "", catalog = "qav2")
public class ClassroomUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;
    @JoinColumn(name = "UserId", referencedColumnName = "Id")
    @ManyToOne(optional = false)
    private User userId;
    @JoinColumn(name = "ClassroomId", referencedColumnName = "Id")
    @ManyToOne(optional = false)
    private Classroom classroomId;

    public ClassroomUser() {
    }

    public ClassroomUser(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public Classroom getClassroomId() {
        return classroomId;
    }

    public void setClassroomId(Classroom classroomId) {
        this.classroomId = classroomId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ClassroomUser)) {
            return false;
        }
        ClassroomUser other = (ClassroomUser) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.qaproject.entity.ClassroomUser[ id=" + id + " ]";
    }

}
