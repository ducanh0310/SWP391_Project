/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Gia Huy
 */
public class HistoryAdmin {

    Date dop;
    String appointment_description;
    PatientRecords patient_details;
    double patient_charge;
    double insurance_charge;
    double total_charge;

    public void setDop(Date dop) {
        this.dop = dop;
    }

    public Date getDop() {
        return dop;
    }

    public HistoryAdmin(Date dop, String appointment_description, PatientRecords patient_details, double patient_charge, double insurance_charge, double total_charge) {
        this.dop = dop;
        this.appointment_description = appointment_description;
        this.patient_details = patient_details;
        this.patient_charge = patient_charge;
        this.insurance_charge = insurance_charge;
        this.total_charge = total_charge;
    }

    public PatientRecords getPatient_details() {
        return patient_details;
    }

    public void setPatient_details(PatientRecords patient_details) {
        this.patient_details = patient_details;
    }

    public HistoryAdmin() {
    }

    public String getAppointment_description() {
        return appointment_description;
    }

    public double getPatient_charge() {
        return patient_charge;
    }

    public double getInsurance_charge() {
        return insurance_charge;
    }

    public double getTotal_charge() {
        return total_charge;
    }

    public void setAppointment_description(String appointment_description) {
        this.appointment_description = appointment_description;
    }

    public void setPatient_charge(double patient_charge) {
        this.patient_charge = patient_charge;
    }

    public void setInsurance_charge(double insurance_charge) {
        this.insurance_charge = insurance_charge;
    }

    public void setTotal_charge(double total_charge) {
        this.total_charge = total_charge;
    }

}
