/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.HistoryAdmin;
import model.Patient;
import model.PatientRecords;

/**
 *
 * @author Gia Huy
 */
public class PatientViewDB extends DBContext {

    public Patient getPatient(int pid) throws SQLException {
        String sql = "SELECT [Patient_id]\n"
                + "      ,[patient_sin]\n"
                + "      ,[address]\n"
                + "      ,[name]\n"
                + "      ,[gender]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[date_of_birth]\n"
                + "      ,[insurance]\n"
                + "      ,[rep_id]\n"
                + "  FROM [Patient]\n"
                + "WHERE [Patient_id]=?";
        Connection connection = null;
        PreparedStatement stm = null;
        try {
            connection = getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Patient p = new Patient();
                p.setId(rs.getInt("Patient_id"));
                p.setSin(rs.getString("patient_sin"));
                p.setAddress(rs.getString("address"));
                p.setName(rs.getString("name"));
                p.setGender(rs.getString("gender"));
                p.setEmail(rs.getString("email"));
                p.setPhone(rs.getString("phone"));
                p.setDob(rs.getDate("date_of_birth"));
                p.setInsurance(rs.getString("insurance"));
                p.setRep_id(rs.getInt("rep_id"));
                return p;
            }

        } catch (SQLException ex) {
            Logger.getLogger(PatientViewDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(stm);
            closeConnection(connection);
        }
        return null;
    }

    public HistoryAdmin getHistory(int pid) throws SQLException {
        HistoryAdmin h = new HistoryAdmin();
        String sql = "SELECT [date_of_procedure]\n"
                + "     ,[appointment_description]\n"
                + ",patient_details\n"
                + "      ,[patient_charge]\n"
                + "      ,[insurance_charge]\n"
                + "      ,[total_charge]\n"
                + "  FROM [dbo].[Appointment_procedure] s INNER JOIN Patient p on p.Patient_id=s.patient_id\n"
                + "INNER JOIN Patient_records pa on pa.patient_id= s.patient_id\n"
                + "WHERE p.Patient_id=?";
        Connection connection = null;
        PreparedStatement stm = null;
        try {
            connection = getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                PatientRecords pa = new PatientRecords();
                h.setDop(rs.getDate("date_of_procedure"));
                h.setAppointment_description(rs.getString("appointment_description"));
                pa.setPatient_details(rs.getString("patient_details"));
                h.setPatient_details(pa);
                h.setPatient_charge(rs.getDouble("patient_charge"));
                h.setInsurance_charge(rs.getDouble("insurance_charge"));
                h.setTotal_charge(rs.getDouble("total_charge"));
                return h;
            }

        } catch (SQLException ex) {
            Logger.getLogger(PatientViewDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(stm);
            closeConnection(connection);
        }
        return null;
    }

}
