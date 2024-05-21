/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.*;

/**
 *
 * @author ngphn
 */
public class PatientRegisterDTO {
    String address;
    String name;
    String gender;
    String email;
    Date DOB;

    public PatientRegisterDTO(String address, String name, String gender, String email, Date DOB) {
        this.address = address;
        this.name = name;
        this.gender = gender;
        this.email = email;
        this.DOB = DOB;
    }

    public PatientRegisterDTO(String address, String name, String gender, Date DOB) {
        this.address = address;
        this.name = name;
        this.gender = gender;
        this.DOB = DOB;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDOB() {
        return DOB;
    }

    public void setDOB(Date DOB) {
        this.DOB = DOB;
    }
}
