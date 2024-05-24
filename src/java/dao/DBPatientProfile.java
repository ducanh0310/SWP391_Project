/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

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
}
