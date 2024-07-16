/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.sun.jdi.connect.spi.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
import model.Prescription;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import model.Patient;
import model.PatientExamResult;

/**
 *
 * @author Gia Huy
 */
public class DoctorDB extends DBContext {

    public ArrayList<Prescription> getPrescription() {
        ArrayList<Prescription> prescription = new ArrayList<>();
        try {
            String sql = "select [name],[phone],[medication],[dosage],[duration],[notes]\n"
                    + "from [dbo].[Prescription] p join [dbo].[Patient] pa on p.patient_id=pa.Patient_id";

            PreparedStatement stm = connection.prepareStatement(sql);

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
        }
        return prescription;
    }

    public boolean addPrescription(Prescription p) {
        String insertPrescription = "INSERT INTO [dbo].[Prescription] "
                + "([patient_idmedication], [dosage], [duration], [notes]) "
                + "VALUES (?,?, ?, ?)";

        try {
            PreparedStatement prescriptionStatement = connection.prepareStatement(insertPrescription);
            prescriptionStatement.setString(1, p.getMedication());
            prescriptionStatement.setString(2, p.getDosage());
            prescriptionStatement.setString(3, p.getDuration());
            prescriptionStatement.setString(4, p.getNotes());

            prescriptionStatement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DoctorDB.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    private Connection getConnection() throws SQLException {
        // Implement this method to return a valid database connection
        // For example:
        // return DriverManager.getConnection(DB_URL, USER, PASSWORD);
        return null; // Replace with actual connection code
    }

    public PatientExamResult getPatientExamResult(int pid) {
        PatientExamResult p = null;
        try {
            String sql = "SELECT p.exam_id, p.pid, p.exam_date, p.diagnosis, p.symptoms, p.test_result, t.name "
                    + "FROM dbo.PatientExamResult p "
                    + "JOIN dbo.Patient t ON p.pid = t.Patient_id "
                    + "WHERE p.pid = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
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
        }
        return p;

    }

    public static void main(String[] args) {
        DoctorDB d = new DoctorDB();
        PatientExamResult pa = new PatientExamResult();
        Prescription p = new Prescription();
        System.out.println(d.getPatientExamResult(1));

    }
}
