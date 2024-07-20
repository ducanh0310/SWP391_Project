/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.*;
import java.util.logging.Logger;

/**
 *
 * @author Vu Minh Quan
 */
public class Employee {

    private int id;
    private String employeeSin;
    private String employeeType;
    private String name;
    private String address;
    private float annualSalary;
    private int branchId;
    private String phoneNumber;
    public String email;
    private Date dob;
    private String gender;
    private Branch branch;
    private String url;
    private String certificationName;

    public Employee() {
    }

    public int getId() {
        return id;
    }

    public Employee(int id, String employeeSin, String employeeType, String name, String address, float annualSalary, int branchId, String phoneNumber, String email, Date dob, String gender, Branch branch, String url, String certificationName) {
        this.id = id;
        this.employeeSin = employeeSin;
        this.employeeType = employeeType;
        this.name = name;
        this.address = address;
        this.annualSalary = annualSalary;
        this.branchId = branchId;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.dob = dob;
        this.gender = gender;
        this.branch = branch;
        this.url = url;
        this.certificationName = certificationName;
    }

    public Employee(int id, String employeeSin, String employeeType, String name, String address, float annualSalary, int branchId, String phoneNumber, String email, Date dob, String gender, Branch branch) {
        this.id = id;
        this.employeeSin = employeeSin;
        this.employeeType = employeeType;
        this.name = name;
        this.address = address;
        this.annualSalary = annualSalary;
        this.branchId = branchId;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.dob = dob;
        this.gender = gender;
        this.branch = branch;
    }

    public Employee(String employeeSin, String employeeType, String name, String address, float annualSalary, int branchId, String phoneNumber, String email, Date dob, String gender) {
        this.employeeSin = employeeSin;
        this.employeeType = employeeType;
        this.name = name;
        this.address = address;
        this.annualSalary = annualSalary;
        this.branchId = branchId;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.dob = dob;
        this.gender = gender;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getCertificationName() {
        return certificationName;
    }

    public void setCertificationName(String certificationName) {
        this.certificationName = certificationName;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Branch getBranch() {
        return branch;
    }

    public void setBranch(Branch branch) {
        this.branch = branch;
    }

}
