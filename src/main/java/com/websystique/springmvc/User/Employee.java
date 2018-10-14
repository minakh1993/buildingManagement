package com.websystique.springmvc.User;

import com.websystique.springmvc.security.paswordEncryption.md5;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;

@Entity
@Table(name = "Employee")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Employee {

    @Id
    @Column(name = "username" )
    @Length(min = 4 , max = 10)
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "name")
    private String name;

    @Column(name = "family")
    private String family;

    @Column(name = "nationalId")
    private String nationalId;

    @Column(name = "position")
    private String position;

    @Column(name = "email")
    private String email;

    private String role="user";
    public Employee() {
    }


    public String getUsername() {

        return username;
    }

    public String getNationalId() {
        return nationalId;
    }

    public void setNationalId(String nationalId) {
        this.nationalId = nationalId;
    }

    public Employee(String username, String password, String name, String family, String nationalId, String position, String email, String role) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.family = family;
        this.nationalId = nationalId;
        this.position = position;
        this.email = email;
        this.role = role;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        if(password.length()>10){//check if the password in hashed or not
            this.password = password;
        }else {
            this.password=new md5().md5(password);
        }


    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFamily() {
        return family;
    }

    public void setFamily(String family) {
        this.family = family;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Employee)) return false;

        Employee employee = (Employee) o;

        return username.equals(employee.username);
    }

    @Override
    public int hashCode() {
        return username.hashCode();
    }

    //    @Override
//    public String toString() {
//        return
//                "{name: '" + name + "'," +
//                "family: '" + family + "'," +
//                "position: '" + position + "'}"
//                ;
//    }


    public String toString(){

        return
                "{\"name\": \"" + name + "\"," +
                        "\"id\": \"" + username + "\"," +
                        "\"password\": \"" + password + "\"," +
                        "\"nationalId\": \"" + nationalId + "\"," +
                        "\"email\": \"" + email + "\"," +
                        "\"username\": \"" + username + "\"," +
                        "\"family\": \"" + family + "\"," +
                        "\"position\": \"" + position + "\"}"
                ;
    }


//    public String toFullCalendarFormat(){
//
//        return
//                "{name: " + name + "," +
//                        "id\": \"" + username + "\"," +
//                        "\"username\": \"" + username + "\"," +
//                        "\"family\": \"" + family + "\"," +
//                        "\"position\": \"" + position + "\"}"
//                ;
//    }
}
