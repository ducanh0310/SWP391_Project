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
            String sql = """
                         select [name],[phone],[medication],[dosage],[duration],[notes]
                         from [dbo].[Prescription] p join [dbo].[Patient] pa on p.patient_id=pa.Patient_id""";

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
                p.setPatient(pa);

                prescription.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DoctorDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return prescription;
    }

    public boolean addPrescription(Prescription p) {
    String insertPrescription = """
                                INSERT INTO [dbo].[Prescription]
                                           ([medication]
                                           ,[dosage]
                                           ,[duration]
                                           ,[notes]
                                           ,[exam_id])
                                     VALUES
                                           (?,?,?,?,?)""";

    try {
        PreparedStatement prescriptionStatement = connection.prepareStatement(insertPrescription);

        prescriptionStatement.setString(1, p.getMedication()); // Set medication
        prescriptionStatement.setString(2, p.getDosage()); // Set dosage
        prescriptionStatement.setString(3, p.getDuration()); // Set duration
        prescriptionStatement.setString(4, p.getNotes()); // Set notes
        prescriptionStatement.setInt(5, p.getPatientExamResult().getExam_id()); // Set exam_id

        int rowsInserted = prescriptionStatement.executeUpdate();
        if (rowsInserted > 0) {
            System.out.println("A new prescription was inserted successfully!");
            return true;
        } else {
            return false;
        }
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

    public PatientExamResult getPatientExamResult(int eid) {
        PatientExamResult p = null;
        try {
            String sql = "SELECT p.exam_id, p.pid, p.exam_date, p.diagnosis, p.symptoms, p.test_result, t.name "
                    + "FROM dbo.PatientExamResult p "
                    + "JOIN dbo.Patient t ON p.pid = t.Patient_id "
                    + "WHERE p.exam_id = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, eid);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                p = new PatientExamResult();
                Patient pa = new Patient();
                p.setExam_id(rs.getInt("exam_id"));
                pa.setName(rs.getString("name"));
                p.setPatient(pa);
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

    public ArrayList<Patient> getPatient() {
        ArrayList<Patient> patient = new ArrayList<>();
        try {
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
                    + "  FROM [Patient]\n";

            PreparedStatement stm = connection.prepareStatement(sql);

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

                patient.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DoctorDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return patient;
    }

    public Prescription getPrescriptionDetail(int pid) {
        try {
            String sql = "SELECT  [prescription_date]\n"
                    + "      ,[medication]\n"
                    + "      ,[dosage]\n"
                    + "      ,[duration]\n"
                    + "      ,[notes] \n"
                    + "      ,[exam_date]\n"
                    + "      ,[diagnosis]\n"
                    + "      ,[symptoms]\n"
                    + "      ,[test_result]\n"
                    + "  FROM [dbo].[Prescription] p inner join PatientExamResult pa on p.patient_id=pa.pid\n"
                    + "  WHERE p.[exam_id]=?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Prescription p = new Prescription();
                PatientExamResult pa = new PatientExamResult();
                p.setPrescription_date(rs.getDate("prescription_date"));
                p.setMedication(rs.getString("medication"));
                p.setDosage(rs.getString("dosage"));
                p.setDuration(rs.getString("duration"));
                p.setNotes(rs.getString("notes"));
                pa.setExam_date(rs.getDate("exam_date"));
                pa.setDiagnosis(rs.getString("diagnosis"));
                pa.setSymptoms(rs.getString("symptoms"));
                pa.setTest_result(rs.getString("test_result"));
                p.setPatientExamResult(pa);
                return p;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DoctorDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Patient getPatientDetail(int pid) {
        try {
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

            PreparedStatement stm = connection.prepareStatement(sql);
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
            Logger.getLogger(DoctorDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        DoctorDB d = new DoctorDB();
        PatientExamResult pa = new PatientExamResult();
        Prescription p = new Prescription();
        System.out.println(d.getPatientExamResult(1));

    }
}
