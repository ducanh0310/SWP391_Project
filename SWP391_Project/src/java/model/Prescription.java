/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Gia Huy
 */
public class Prescription {

//    Patient pid;
//    Patient name;
//    Patient phone;
    Patient patient;
    int examid;
    String medication;
    String dosage;
    String duration;
    String notes;
    Date prescription_date;
    PatientExamResult patientExamResult;

    public Prescription() {
    }

    public Prescription(Patient patient, int examid, String medication, String dosage, String duration, String notes, Date prescription_date, PatientExamResult patientExamResult) {
        this.patient = patient;
        this.examid = examid;
        this.medication = medication;
        this.dosage = dosage;
        this.duration = duration;
        this.notes = notes;
        this.prescription_date = prescription_date;
        this.patientExamResult = patientExamResult;
    }

    public int getExamid() {
        return examid;
    }

    public void setExamid(int examid) {
        this.examid = examid;
    }

    

    public Date getPrescription_date() {
        return prescription_date;
    }

    public void setPrescription_date(Date prescription_date) {
        this.prescription_date = prescription_date;
    }

    
    

    public PatientExamResult getPatientExamResult() {
        return patientExamResult;
    }

    public void setPatientExamResult(PatientExamResult patientExamResult) {
        this.patientExamResult = patientExamResult;
    }

   

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

//    public Patient getName() {
//        return name;
//    }
//
//    public Patient getPhone() {
//        return phone;
//    }
//
//    public void setName(Patient name) {
//        this.name = name;
//    }
//
//    public void setPhone(Patient phone) {
//        this.phone = phone;
//    }
//
//    public Patient getPid() {
//        return pid;
//    }

    public String getMedication() {
        return medication;
    }

    public String getDosage() {
        return dosage;
    }

    public String getDuration() {
        return duration;
    }

    public String getNotes() {
        return notes;
    }

//    public void setPid(Patient pid) {
//        this.pid = pid;
//    }

    public void setMedication(String medication) {
        this.medication = medication;
    }

    public void setDosage(String dosage) {
        this.dosage = dosage;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

}