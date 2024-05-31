/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao1;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Employee;
import model.Patient;

/**
 *
 * @author trung
 */
public class PatientDAO {
    private final Connection connection;
    
    public PatientDAO(){
        this.connection = DBContext.getConnection();
    }
    
    public Patient getPatientById(String patientId){
        String sql = "select * from Patient where Patient_id = ?";
        Patient patient = new Patient();
        try{
            PreparedStatement prepare = connection.prepareStatement(sql);
            prepare.setString(1, patientId);
            ResultSet rs = prepare.executeQuery();
            if(rs.next()){
                patient.setId(rs.getInt("Patient_id"));
                patient.setSin(rs.getInt("patient_sin"));
                patient.setAddress(rs.getString("address"));
                patient.setName(rs.getString("name"));
                patient.setGender(rs.getString("gender"));
                patient.setPhone(rs.getString("phone"));
                patient.setDob(rs.getDate("date_of_birth"));
                patient.setInsurance(rs.getString("insurance"));
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return patient;
    }
    
    public static void main(String[] args) {
        PatientDAO ptDAO = new PatientDAO();
        System.out.println(ptDAO.getPatientById("1").getName());
    }
}
