/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Gia Huy
 */
public class Patient {
    private int id;
    private String sin;
    private String address;
    private String name;
    private String gender;
    private String email;
    private String phone;
    private Date dob;
    private String insurance;
    private int rep_id;

    public int getId() {
        return id;
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

    public int getRep_id() {
        return rep_id;
    }

    public void setId(int id) {
        this.id = id;
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

    public void setRep_id(int rep_id) {
        this.rep_id = rep_id;
    }
    
    
}
