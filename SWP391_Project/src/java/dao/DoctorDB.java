/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
import model.Prescription;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Patient;
import model.PatientExamResult;

/**
 *
 * @author ngphn
 */
public class DoctorDB extends DBContext {

    public ArrayList<Prescription> getPrescription() throws SQLException {
        ArrayList<Prescription> prescription = new ArrayList<>();
        String sql = "select [name],[phone],[medication],[dosage],[duration],[notes]\n"
                + "from [dbo].[Prescription] p join [dbo].[Patient] pa on p.patient_id=pa.Patient_id";
        Connection connection = null;
        PreparedStatement stm = null;
        try {
            connection = getConnection();
            stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Prescription p = new Prescription();
                p.setMedication(rs.getString("medication"));
                p.setDosage(rs.getString("dosage"));
                p.setDuration(rs.getString("duration"));
                p.setNotes(rs.getString("notes"));

                Patient pa = new Patient();
                pa.setName(rs.getString("name"));
                p.setName(pa);
                pa.setPhone(rs.getString("phone"));
                p.setPhone(pa);

                prescription.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DoctorDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(stm);
            closeConnection(connection);
        }
        return prescription;
    }

    public boolean addPrescription(Prescription p) throws SQLException {
        String insertPrescription = "INSERT INTO [dbo].[Prescription] "
                + "([patient_idmedication], [dosage], [duration], [notes]) "
                + "VALUES (?,?, ?, ?)";
        Connection connection = null;
        PreparedStatement stm = null;
        try {
            connection = getConnection();
            stm = connection.prepareStatement(insertPrescription);
            stm.setString(1, p.getMedication());
            stm.setString(2, p.getDosage());
            stm.setString(3, p.getDuration());
            stm.setString(4, p.getNotes());

            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDB.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            closePreparedStatement(stm);
            closeConnection(connection);
        }
    }

    public PatientExamResult getPatientExamResult(int pid) throws SQLException {
        PatientExamResult p = null;
        String sql = "SELECT p.exam_id, p.pid, p.exam_date, p.diagnosis, p.symptoms, p.test_result, t.name "
                + "FROM dbo.PatientExamResult p "
                + "JOIN dbo.Patient t ON p.pid = t.Patient_id "
                + "WHERE p.pid = ?";
        Connection connection = null;
        PreparedStatement stm = null;
        try {
            connection = getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                p = new PatientExamResult();
                Patient pa = new Patient();
                p.setExam_id(rs.getInt("exam_id"));
                pa.setName(rs.getString("name"));
                p.setPid(pa);
                p.setExam_date(rs.getDate("exam_date"));
                p.setDiagnosis(rs.getString("diagnosis"));
                p.setSymptoms(rs.getString("symptoms"));
                p.setTest_result(rs.getString("test_result"));
            }

            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDB.class.getName()).log(Level.SEVERE, "Error retrieving PatientExamResult", ex);
        } finally {
            closePreparedStatement(stm);
            closeConnection(connection);
        }
        return p;
    }

}
