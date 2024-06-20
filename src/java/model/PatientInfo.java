/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.*;

/**
 *
 * @author Vu Minh Quan
 */
public class PatientInfo {
    private int patientId;
    private String patientSin;
    private String address;
    private String name;
    private String gender;
    private String email;
    private Date dob;
    private String phoneNumber;

    public PatientInfo() {
    }

    public PatientInfo(int patientId, String patientSin, String address, String name, String gender, String email, Date dob, String phoneNumber) {
        this.patientId = patientId;
        this.patientSin = patientSin;
        this.address = address;
        this.name = name;
        this.gender = gender;
        this.email = email;
        this.dob = dob;
        this.phoneNumber = phoneNumber;
    }
    
    
    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public String getPatientSin() {
        return patientSin;
    }

    public void setPatientSin(String patientSin) {
        this.patientSin = patientSin;
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

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    
    
    
    
}
