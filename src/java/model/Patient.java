/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.*;

/**
 *
 * @author Gia Huy
 */
public class Patient {

    private String sin;
    private String address;
    private String name;
    private String gender;
    private String email;
    private String phone;
    private Date dob;
    private String insurance;
    private Integer rep_id;

    public Patient() {
    }

    public Patient(String sin, String address, String name, String gender, String email, String phone, Date dob, String insurance, Integer rep_id) {
        this.sin = sin;
        this.address = address;
        this.name = name;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.dob = dob;
        this.insurance = insurance;
        this.rep_id = rep_id;
    }

    public Patient(String sin, String address, String name, String gender, String email, String phone, Date dob, String insurance) {
        this.sin = sin;
        this.address = address;
        this.name = name;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.dob = dob;
        this.insurance = insurance;
    }

    public Patient(String sin, String address, String name, String gender, String email, String phone, Date dob, Integer rep_id) {
        this.sin = sin;
        this.address = address;
        this.name = name;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.dob = dob;
        this.rep_id = rep_id;
    }
    

    public Patient(String sin, String address, String name, String gender, String email, String phone, Date dob) {
        this.sin = sin;
        this.address = address;
        this.name = name;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.dob = dob;
    }
    

    public String getAddress() {
        return address;
    }

    public String getName() {
        return name;
    }

    public String getGender() {
        return gender;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public Date getDob() {
        return dob;
    }

    public String getInsurance() {
        return insurance;
    }

    public Integer getRep_id() {
        return rep_id;
    }

    public String getSin() {
        return sin;
    }

    public void setSin(String sin) {
        this.sin = sin;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public void setInsurance(String insurance) {
        this.insurance = insurance;
    }

    public void setRep_id(Integer rep_id) {
        this.rep_id = rep_id;
    }

}
