/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trung
 */
public class User {
    private String name;
    private String password;
    private boolean type_Id;
    private String patient_Id;
    private String Employee_Id;

    public User() {
    }

    public User(String name, String password, boolean type_Id, String patient_Id, String Employee_Id) {
        this.name = name;
        this.password = password;
        this.type_Id = type_Id;
        this.patient_Id = patient_Id;
        this.Employee_Id = Employee_Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isType_Id() {
        return type_Id;
    }

    public void setType_Id(boolean type_Id) {
        this.type_Id = type_Id;
    }

    public String getPatient_Id() {
        return patient_Id;
    }

    public void setPatient_Id(String patient_Id) {
        this.patient_Id = patient_Id;
    }

    public String getEmployee_Id() {
        return Employee_Id;
    }

    public void setEmployee_Id(String Employee_Id) {
        this.Employee_Id = Employee_Id;
    }

    @Override
    public String toString() {
        return "User{" + "name=" + name + ", password=" + password + ", type_Id=" + type_Id + ", patient_Id=" + patient_Id + ", Employee_Id=" + Employee_Id + '}';
    }
    
    
}
