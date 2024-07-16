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
public class PatientExamResult {
    int exam_id;
    Patient pid;
    Date exam_date;
    String diagnosis;
    String symptoms;
    String test_result;

    public PatientExamResult() {
    }

    public PatientExamResult(int exam_id, Patient pid, Date exam_date, String diagnosis, String symptoms, String test_result) {
        this.exam_id = exam_id;
        this.pid = pid;
        this.exam_date = exam_date;
        this.diagnosis = diagnosis;
        this.symptoms = symptoms;
        this.test_result = test_result;
    }

    public int getExam_id() {
        return exam_id;
    }

    public Patient getPid() {
        return pid;
    }

    public Date getExam_date() {
        return exam_date;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public String getSymptoms() {
        return symptoms;
    }

    public String getTest_result() {
        return test_result;
    }

    public void setExam_id(int exam_id) {
        this.exam_id = exam_id;
    }

    public void setPid(Patient pid) {
        this.pid = pid;
    }

    public void setExam_date(Date exam_date) {
        this.exam_date = exam_date;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public void setSymptoms(String symptoms) {
        this.symptoms = symptoms;
    }

    public void setTest_result(String test_result) {
        this.test_result = test_result;
    }
    
    
}
