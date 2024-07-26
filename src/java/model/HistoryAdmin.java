package model;

import java.util.Date;

public class HistoryAdmin {

    private Date dop;
    private String appointment_description;
    private PatientRecords patient_details; // Ensure this is needed or use Patient instead
    private double patient_charge;
    private double insurance_charge;
    private double total_charge;
    private Patient patient;

    // Default constructor
    public HistoryAdmin() {
    }

    // Parameterized constructor
    public HistoryAdmin(Date dop, String appointment_description, PatientRecords patient_details, double patient_charge, double insurance_charge, double total_charge, Patient patient) {
        this.dop = dop;
        this.appointment_description = appointment_description;
        this.patient_details = patient_details;
        this.patient_charge = patient_charge;
        this.insurance_charge = insurance_charge;
        this.total_charge = total_charge;
        this.patient = patient;
    }

    // Getters and setters
    public Date getDop() {
        return dop;
    }

    public void setDop(Date dop) {
        this.dop = dop;
    }

    public String getAppointment_description() {
        return appointment_description;
    }

    public void setAppointment_description(String appointment_description) {
        this.appointment_description = appointment_description;
    }

    public PatientRecords getPatient_details() {
        return patient_details;
    }

    public void setPatient_details(PatientRecords patient_details) {
        this.patient_details = patient_details;
    }

    public double getPatient_charge() {
        return patient_charge;
    }

    public void setPatient_charge(double patient_charge) {
        this.patient_charge = patient_charge;
    }

    public double getInsurance_charge() {
        return insurance_charge;
    }

    public void setInsurance_charge(double insurance_charge) {
        this.insurance_charge = insurance_charge;
    }

    public double getTotal_charge() {
        return total_charge;
    }

    public void setTotal_charge(double total_charge) {
        this.total_charge = total_charge;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }
}
