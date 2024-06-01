/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao1;

import dal.DBContext;
import model.PatientInfo;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Vu Minh Quan
 */
public class DBPatientProfile extends DBContext{
 
     public DBPatientProfile() throws ClassNotFoundException {
        super(); // Calls the constructor of DBContext to initialize the connection
    }
    
    public PatientInfo getInfoPatient(String username){
        PatientInfo patientInfo= new PatientInfo();
        try {            
            String sql="""
                       select p.Patient_id, p.name,p.phone, p.email, p.patient_sin, p.gender, p.date_of_birth, p.address from User_account acc
                       join Patient p on p.Patient_id=acc.patient_id
                       where acc.username=?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs =stm.executeQuery();
            while(rs.next()){
                patientInfo.setPatientId(rs.getInt("Patient_id"));
                patientInfo.setName(rs.getString("name"));
                patientInfo.setPhoneNumber(rs.getString("phone"));
                patientInfo.setEmail(rs.getString("email"));
                patientInfo.setPatientSin(rs.getInt("patient_sin"));
                patientInfo.setGender(rs.getString("gender"));
                patientInfo.setDob(rs.getDate("date_of_birth"));
                patientInfo.setAddress(rs.getString("address"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBPatientProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return patientInfo;
    }
    
    public void editInfoPatient(PatientInfo paInfo){
         try {
             String sql="""
                        UPDATE [dbo].[Patient]
                           SET [patient_sin] = ?
                              ,[address] = ?
                              ,[name] = ?
                              ,[gender] = ?
                              ,[email] = ?
                              ,[phone] = ?
                              ,[date_of_birth] = ?
                         WHERE [Patient_id]=?""";
             PreparedStatement stm = connection.prepareStatement(sql);
             stm.setInt(1, paInfo.getPatientSin());
             stm.setString(2, paInfo.getAddress());
             stm.setString(3, paInfo.getName());
             stm.setString(4, paInfo.getGender());
             stm.setString(5, paInfo.getEmail());
             stm.setString(6, paInfo.getPhoneNumber());
             stm.setDate(7, paInfo.getDob());
             stm.setInt(8, paInfo.getPatientId());
             stm.executeUpdate();
             
         } catch (SQLException ex) {
             Logger.getLogger(DBPatientProfile.class.getName()).log(Level.SEVERE, null, ex);
         }
        
    }
    
    public PatientInfo getPatientByEmail(String email) {
        try {
            String query = "SELECT * FROM Patient WHERE email = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                PatientInfo patient = new PatientInfo();
                patient.setPatientId(rs.getInt("patient_id"));
                patient.setEmail(rs.getString("email"));
                patient.setName(rs.getString("name"));
                patient.setAddress(rs.getString("address"));
                patient.setGender(rs.getString("gender"));
                patient.setPhoneNumber(rs.getString("phone"));
                patient.setDob(rs.getDate("date_of_birth"));
                return patient;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public int addPatient(PatientInfo patient) {
        try {
            String query = "INSERT INTO Patient (address, name, gender, email, phone, date_of_birth) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, patient.getAddress());
            ps.setString(2, patient.getName());
            ps.setString(3, patient.getGender());
            ps.setString(4, patient.getEmail());
            ps.setString(5, patient.getPhoneNumber());
            ps.setDate(6, patient.getDob());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    public static void main(String[] args) throws ClassNotFoundException {
        DBPatientProfile db = new DBPatientProfile();
        System.out.println(db.getInfoPatient("elmurder666"));
    }
}
