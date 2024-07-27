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
import model.Patient;
import model.PatientGetByIdDTO;

/**
 *
 * @author Vu Minh Quan
 */
public class DBPatientProfile extends DBContext {

    public DBPatientProfile() throws ClassNotFoundException {
        super(); // Calls the constructor of DBContext to initialize the connection
    }

    public PatientInfo getInfoPatient(String username) throws SQLException {
        PatientInfo patientInfo = new PatientInfo();
        String query = """
                       select p.Patient_id, p.name,p.phone, p.email, p.patient_sin, p.gender, p.date_of_birth, p.address from User_account acc
                       join Patient p on p.Patient_id=acc.patient_id
                       where acc.username=?""";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                patientInfo.setPatientId(rs.getInt("Patient_id"));
                patientInfo.setName(rs.getString("name"));
                patientInfo.setPhoneNumber(rs.getString("phone"));
                patientInfo.setEmail(rs.getString("email"));
                patientInfo.setPatientSin(rs.getString("patient_sin"));
                patientInfo.setGender(rs.getString("gender"));
                patientInfo.setDob(rs.getDate("date_of_birth"));
                patientInfo.setAddress(rs.getString("address"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBPatientProfile.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return patientInfo;
    }

    public String editInfoPatient(PatientInfo paInfo) throws SQLException {
        String query = """
                        UPDATE [dbo].[Patient]
                           SET [patient_sin] = ?
                              ,[address] = ?
                              ,[name] = ?
                              ,[gender] = ?
                              ,[email] = ?
                              ,[phone] = ?
                              ,[date_of_birth] = ?
                         WHERE [Patient_id]=?""";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, paInfo.getPatientSin());
            statement.setString(2, paInfo.getAddress());
            statement.setString(3, paInfo.getName());
            statement.setString(4, paInfo.getGender());
            statement.setString(5, paInfo.getEmail());
            statement.setString(6, paInfo.getPhoneNumber());
            statement.setDate(7, paInfo.getDob());
            statement.setInt(8, paInfo.getPatientId());
            statement.executeUpdate();
            return "true";
        } catch (SQLException ex) {
            Logger.getLogger(DBPatientProfile.class.getName()).log(Level.SEVERE, null, ex);
            return "faile";
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }

    }

    public PatientInfo getPatientByEmail(String email) throws SQLException {
        String query = "SELECT * FROM Patient WHERE email = ?";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();

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
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return null;
    }

    public int addPatient(PatientInfo patient) throws SQLException {
        String query = "INSERT INTO Patient (address, name, gender, email, phone, date_of_birth) VALUES (?, ?, ?, ?, ?, ?)";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, patient.getAddress());
            statement.setString(2, patient.getName());
            statement.setString(3, patient.getGender());
            statement.setString(4, patient.getEmail());
            statement.setString(5, patient.getPhoneNumber());
            statement.setDate(6, patient.getDob());
            statement.executeUpdate();
            ResultSet rs = statement.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return -1;
    }
}
