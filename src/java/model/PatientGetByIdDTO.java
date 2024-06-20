/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author ngphn
 */
public class PatientGetByIdDTO {

    private int id;
    private String sin;
    private String address;
    private String name;
    private String gender;
    private String email;
    private String phone;
    private Date dob;
    private String insurance;
    private Integer rep_id;

    public PatientGetByIdDTO() {
    }
    
    
    public PatientGetByIdDTO(int id, String sin, String address, String name, String gender, String email, String phone, Date dob, String insurance, Integer rep_id) {
        this.id = id;
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

    public PatientGetByIdDTO(String sin, String address, String name, String gender, String email, String phone, Date dob, String insurance, Integer rep_id) {
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
    

    public int getId() {
        return id;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getInsurance() {
        return insurance;
    }

    public void setInsurance(String insurance) {
        this.insurance = insurance;
    }

    public Integer getRep_id() {
        return rep_id;
    }

    public void setRep_id(Integer rep_id) {
        this.rep_id = rep_id;
    } 
}
