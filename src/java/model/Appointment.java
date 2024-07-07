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
public class Appointment {
    int appointment_Id;
    int patient_Id;
    String dentist_Id;
    Date date_of_Appointment;
    String start_Time;
    String end_Time;
    String appointment_Type;
    String appointment_Status;
    String room;

    public Appointment() {
    }

    public Appointment(int appointment_Id, int patient_Id, String dentist_Id, Date date_of_Appointment, String start_Time, String end_Time, String appointment_Type, String appointment_Status, String room) {
        this.appointment_Id = appointment_Id;
        this.patient_Id = patient_Id;
        this.dentist_Id = dentist_Id;
        this.date_of_Appointment = date_of_Appointment;
        this.start_Time = start_Time;
        this.end_Time = end_Time;
        this.appointment_Type = appointment_Type;
        this.appointment_Status = appointment_Status;
        this.room = room;
    }

    public int getAppointment_Id() {
        return appointment_Id;
    }

    public void setAppointment_Id(int appointment_Id) {
        this.appointment_Id = appointment_Id;
    }

    public int getPatient_Id() {
        return patient_Id;
    }

    public void setPatient_Id(int patient_Id) {
        this.patient_Id = patient_Id;
    }

    public String getDentist_Id() {
        return dentist_Id;
    }

    public void setDentist_Id(String dentist_Id) {
        this.dentist_Id = dentist_Id;
    }

    public Date getDate_of_Appointment() {
        return date_of_Appointment;
    }

    public void setDate_of_Appointment(Date date_of_Appointment) {
        this.date_of_Appointment = date_of_Appointment;
    }

    public String getStart_Time() {
        return start_Time;
    }

    public void setStart_Time(String start_Time) {
        this.start_Time = start_Time;
    }

    public String getEnd_Time() {
        return end_Time;
    }

    public void setEnd_Time(String end_Time) {
        this.end_Time = end_Time;
    }

    public String getAppointment_Type() {
        return appointment_Type;
    }

    public void setAppointment_Type(String appointment_Type) {
        this.appointment_Type = appointment_Type;
    }

    public String getAppointment_Status() {
        return appointment_Status;
    }

    public void setAppointment_Status(String appointment_Status) {
        this.appointment_Status = appointment_Status;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }
    
}
