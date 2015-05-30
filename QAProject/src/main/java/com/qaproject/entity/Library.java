package com.qaproject.entity;

import javax.persistence.*;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Entity
public class Library {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;
    @Column(name = "StoredURL")
    private String storedURL;
    @JoinColumn(name = "ManagerId", referencedColumnName = "Id")
    @ManyToOne(optional = false)
    private User managerId;
    @JoinColumn(name = "MaterialId", referencedColumnName = "Id")
    @ManyToOne(optional = false)
    private Material materialId;

    public Library() {
    }

    public Library(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStoredURL() {
        return storedURL;
    }

    public void setStoredURL(String storedURL) {
        this.storedURL = storedURL;
    }

    public User getManagerId() {
        return managerId;
    }

    public void setManagerId(User managerId) {
        this.managerId = managerId;
    }

    public Material getMaterialId() {
        return materialId;
    }

    public void setMaterialId(Material materialId) {
        this.materialId = materialId;
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
        if (!(object instanceof Library)) {
            return false;
        }
        Library other = (Library) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.qaproject.entity.Library[ id=" + id + " ]";
    }

}
