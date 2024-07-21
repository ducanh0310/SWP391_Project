/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Vu Minh Quan
 */
public class Branch {
    private int id;
    private String city;
    private int managerId;
    private int receptionist1Id;
    private int receptionist2Id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    public int getReceptionist1Id() {
        return receptionist1Id;
    }

    public void setReceptionist1Id(int receptionist1Id) {
        this.receptionist1Id = receptionist1Id;
    }

    public int getReceptionist2Id() {
        return receptionist2Id;
    }

    public void setReceptionist2Id(int receptionist2Id) {
        this.receptionist2Id = receptionist2Id;
    }
    
    
}
