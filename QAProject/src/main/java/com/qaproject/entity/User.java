package com.qaproject.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;
    @Column(name = "Password")
    private String password;
    @Column(name = "CreationDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;
    @Column(name = "Email")
    private String email;
    @Column(name = "DisplayName")
    private String displayName;
    @Column(name = "AboutMe")
    private String aboutMe;
    @Column(name = "ProfileImageURL")
    private String profileImageURL;
    @Column(name = "Status")
    private Character status;
    @OneToMany(mappedBy = "ownerUserId")
    private List<Classroom> classroomList;
    @OneToMany(mappedBy = "ownerUserId")
    private List<Post> postList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "managerId")
    private List<Library> libraryList;
    @OneToMany(mappedBy = "senderId")
    private List<Notification> notificationSender;
    @OneToMany(mappedBy = "receiverId")
    private List<Notification> notificationReceiver;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId")
    private List<ClassroomUser> classroomUserList;
    @JoinColumn(name = "RoleId", referencedColumnName = "Id")
    @ManyToOne
    private Role roleId;
    @JoinColumn(name = "CategoryId", referencedColumnName = "Id")
    @ManyToOne
    private Category categoryId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userId")
    private List<TagUser> tagUserList;

    public User() {
    }

    public User(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getAboutMe() {
        return aboutMe;
    }

    public void setAboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
    }

    public String getProfileImageURL() {
        return profileImageURL;
    }

    public void setProfileImageURL(String profileImageURL) {
        this.profileImageURL = profileImageURL;
    }

    public Character getStatus() {
        return status;
    }

    public void setStatus(Character status) {
        this.status = status;
    }

    public List<Classroom> getClassroomList() {
        return classroomList;
    }

    public void setClassroomList(List<Classroom> classroomList) {
        this.classroomList = classroomList;
    }

    public List<Post> getPostList() {
        return postList;
    }

    public void setPostList(List<Post> postList) {
        this.postList = postList;
    }

    public List<Library> getLibraryList() {
        return libraryList;
    }

    public void setLibraryList(List<Library> libraryList) {
        this.libraryList = libraryList;
    }

    public List<Notification> getNotificationSender() {
        return notificationSender;
    }

    public void setNotificationSender(List<Notification> notificationSender) {
        this.notificationSender = notificationSender;
    }

    public List<Notification> getNotificationReceiver() {
        return notificationReceiver;
    }

    public void setNotificationReceiver(List<Notification> notificationReceiver) {
        this.notificationReceiver = notificationReceiver;
    }

    public List<ClassroomUser> getClassroomUserList() {
        return classroomUserList;
    }

    public void setClassroomUserList(List<ClassroomUser> classroomUserList) {
        this.classroomUserList = classroomUserList;
    }

    public Role getRoleId() {
        return roleId;
    }

    public void setRoleId(Role roleId) {
        this.roleId = roleId;
    }

    public Category getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Category categoryId) {
        this.categoryId = categoryId;
    }

    public List<TagUser> getTagUserList() {
        return tagUserList;
    }

    public void setTagUserList(List<TagUser> tagUserList) {
        this.tagUserList = tagUserList;
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
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.qaproject.entity.User[ id=" + id + " ]";
    }

}
