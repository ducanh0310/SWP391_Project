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
public class AppointmentDTO {
    private int id;
    private int patientId;
    private String patientName;
    private String service;
    private int price;
    private String doctor;
    private Date bookingDate;
    private String startTime;
    private String endTime;
    private int room;
    private int idStatus;
    private String status;
    private String payRevervationStatus;

    public AppointmentDTO() {
    }

    public AppointmentDTO(int id, int patientId,String patientName, String service, int price, String doctor, Date bookingDate, String startTime, String endTime, int room, int idStatus, String status, String payRevervationStatus) {
        this.id = id;
        this.patientId = patientId;
        this.patientName = patientName;
        this.service = service;
        this.price = price;
        this.doctor = doctor;
        this.bookingDate = bookingDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.room = room;
        this.idStatus = idStatus;
        this.status = status;
        this.payRevervationStatus = payRevervationStatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDoctor() {
        return doctor;
    }

    public void setDoctor(String doctor) {
        this.doctor = doctor;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public int getRoom() {
        return room;
    }

    public void setRoom(int room) {
        this.room = room;
    }

    public int getIdStatus() {
        return idStatus;
    }

    public void setIdStatus(int idStatus) {
        this.idStatus = idStatus;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPayRevervationStatus() {
        return payRevervationStatus;
    }

    public void setPayRevervationStatus(String payRevervationStatus) {
        this.payRevervationStatus = payRevervationStatus;
    }
    
    
}