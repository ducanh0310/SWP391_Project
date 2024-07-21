/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Gia Huy
 */
public class Prescription {

    Patient pid;
    Patient name;
    Patient phone;
    String medication;
    String dosage;
    String duration;
    String notes;

    public Prescription() {
    }

    public Prescription(Patient pid, Patient name, Patient phone, String medication, String dosage, String duration, String notes) {
        this.pid = pid;
        this.name = name;
        this.phone = phone;
        this.medication = medication;
        this.dosage = dosage;
        this.duration = duration;
        this.notes = notes;
    }

    public Patient getName() {
        return name;
    }

    public Patient getPhone() {
        return phone;
    }

    public void setName(Patient name) {
        this.name = name;
    }

    public void setPhone(Patient phone) {
        this.phone = phone;
    }

    public Patient getPid() {
        return pid;
    }

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

    public void setPid(Patient pid) {
        this.pid = pid;
    }

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