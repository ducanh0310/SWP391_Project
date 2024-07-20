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
public class ExaminationResult {
    private int id;
    private int appointmentId;
    private int patientId;
    private String patientName;
    private String service;
    private int price;
    private String examinationStatus;
    private String doctor;
    private Date bookingDate;
    private String startTime;
    private String endTime;
    private int room;
    //private int idStatus;
    private String status;
    private String payRevervationStatus;
    private String description;

    public ExaminationResult() {
    }

    public ExaminationResult(int id,int appointmentId, int patientId, String patientName, String service, int price, String examinationStatus, String doctor, Date bookingDate, String startTime, String endTime, int room, String status, String payRevervationStatus, String description) {
        this.id = id;
        this.appointmentId = appointmentId;
        this.patientId = patientId;
        this.patientName = patientName;
        this.service = service;
        this.price = price;
        this.examinationStatus = examinationStatus;
        this.doctor = doctor;
        this.bookingDate = bookingDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.room = room;
        //this.idStatus = idStatus;
        this.status = status;
        this.payRevervationStatus = payRevervationStatus;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
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

    public String getExaminationStatus() {
        return examinationStatus;
    }

    public void setExaminationStatus(String examinationStatus) {
        this.examinationStatus = examinationStatus;
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

//    public int getIdStatus() {
//        return idStatus;
//    }
//
//    public void setIdStatus(int idStatus) {
//        this.idStatus = idStatus;
//    }

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}