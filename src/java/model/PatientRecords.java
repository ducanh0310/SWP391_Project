/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Gia Huy
 */
public class PatientRecords {
    int record_id;
    String patient_details;
    Patient patient_id;

    public PatientRecords() {
    }

    public PatientRecords(int record_id, String patient_details, Patient patient_id) {
        this.record_id = record_id;
        this.patient_details = patient_details;
        this.patient_id = patient_id;
    }

    public int getRecord_id() {
        return record_id;
    }

    public String getPatient_details() {
        return patient_details;
    }

    public Patient getPatient_id() {
        return patient_id;
    }

    public void setRecord_id(int record_id) {
        this.record_id = record_id;
    }

    public void setPatient_details(String patient_details) {
        this.patient_details = patient_details;
    }

    public void setPatient_id(Patient patient_id) {
        this.patient_id = patient_id;
    }
    
    
}
