package com.websystique.springmvc.entity;


import com.websystique.springmvc.User.Employee;

import javax.persistence.*;

@Entity
@Table(name = "UserPermission")
public class UserPermission {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    private Employee sourceEmployee;

    @ManyToOne
    private Employee destEmployee;

    @Column
    private boolean viewPermission=false;

    @Column
    private boolean addPermission=false;

    private boolean editPermission=false;

    @Column
    private boolean deletePermission=false;

    public UserPermission() {
    }

    public UserPermission(Employee sourceEmployee, Employee destEmployee, boolean viewPermission, boolean addPermission, boolean editPermission, boolean deletePermission) {
        this.sourceEmployee = sourceEmployee;
        this.destEmployee = destEmployee;
        this.viewPermission = viewPermission;
        this.addPermission = addPermission;
        this.editPermission = editPermission;
        this.deletePermission = deletePermission;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Employee getSourceEmployee() {
        return sourceEmployee;
    }

    public void setSourceEmployee(Employee sourceEmployee) {
        this.sourceEmployee = sourceEmployee;
    }

    public Employee getDestEmployee() {
        return destEmployee;
    }

    public void setDestEmployee(Employee destEmployee) {
        this.destEmployee = destEmployee;
    }

    public boolean isViewPermission() {
        return viewPermission;
    }

    public void setViewPermission(boolean viewPermission) {
        this.viewPermission = viewPermission;
    }

    public boolean isAddPermission() {
        return addPermission;
    }

    public void setAddPermission(boolean addPermission) {
        this.addPermission = addPermission;
    }

    public boolean isEditPermission() {
        return editPermission;
    }

    public void setEditPermission(boolean editPermission) {
        this.editPermission = editPermission;
    }

    public boolean isDeletePermission() {
        return deletePermission;
    }

    public void setDeletePermission(boolean deletePermission) {
        this.deletePermission = deletePermission;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UserPermission)) return false;

        UserPermission that = (UserPermission) o;

        if (id != that.id) return false;
        if (sourceEmployee != null ? !sourceEmployee.equals(that.sourceEmployee) : that.sourceEmployee != null)
            return false;
        return destEmployee != null ? destEmployee.equals(that.destEmployee) : that.destEmployee == null;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (sourceEmployee != null ? sourceEmployee.hashCode() : 0);
        result = 31 * result + (destEmployee != null ? destEmployee.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "UserPermission{" +
                "id=" + id +
                ", sourceEmployee=" + sourceEmployee +
                ", destEmployee=" + destEmployee +
                ", viewPermission=" + viewPermission +
                ", addPermission=" + addPermission +
                ", editPermission=" + editPermission +
                ", deletePermission=" + deletePermission +
                '}';
    }
}
