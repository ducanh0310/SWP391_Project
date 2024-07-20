/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author trung
 */
public class Employees {
     private int id;
    private String employeeSin;
    private String employeeType;
    private String name;
    private String address;
    private float annualSalary;
    private int branchId;
    private String gender;
    private String phoneNumber;
    private Date dob;
    private String email;

    public Employees() {
    }

    public Employees(int id, String employeeSin, String employeeType, String name, String address, float annualSalary, int branchId, String gender, String phoneNumber, Date dob, String email) {
        this.id = id;
        this.employeeSin = employeeSin;
        this.employeeType = employeeType;
        this.name = name;
        this.address = address;
        this.annualSalary = annualSalary;
        this.branchId = branchId;
        this.gender = gender;
        this.phoneNumber = phoneNumber;
        this.dob = dob;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmployeeSin() {
        return employeeSin;
    }

    public void setEmployeeSin(String employeeSin) {
        this.employeeSin = employeeSin;
    }

    public String getEmployeeType() {
        return employeeType;
    }

    public void setEmployeeType(String employeeType) {
        this.employeeType = employeeType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public float getAnnualSalary() {
        return annualSalary;
    }

    public void setAnnualSalary(float annualSalary) {
        this.annualSalary = annualSalary;
    }

    public int getBranchId() {
        return branchId;
    }

    public void setBranchId(int branchId) {
        this.branchId = branchId;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
}