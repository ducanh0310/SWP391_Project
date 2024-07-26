/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
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

    public Patient getPatient(int pid) {
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
            Logger.getLogger(PatientViewDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public HistoryAdmin getHistory(int pid) {
        HistoryAdmin h = new HistoryAdmin();
        try {
            String sql = "SELECT [date_of_procedure]\n"
                    + "     ,[appointment_description]\n"
                    + ",patient_details\n"
                    + "      ,[patient_charge]\n"
                    + "      ,[insurance_charge]\n"
                    + "      ,[total_charge]\n"
                    + "  FROM [dbo].[Appointment_procedure] s INNER JOIN Patient p on p.Patient_id=s.patient_id\n"
                    + "INNER JOIN Patient_records pa on pa.patient_id= s.patient_id\n"
                    + "WHERE p.Patient_id=?";

            PreparedStatement stm = connection.prepareStatement(sql);
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
        }
        return null;
    }

    public void editInfoPatient(Patient paInfo) {
        String sql = """
                 UPDATE [dbo].[Patient]
                    SET [patient_sin] = ?,
                        [address] = ?,
                        [name] = ?,
                        [gender] = ?,
                        [email] = ?,
                        [phone] = ?,
                        [date_of_birth] = ?
                  WHERE [Patient_id] = ?""";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setString(1, paInfo.getSin());
            stm.setString(2, paInfo.getAddress());
            stm.setString(3, paInfo.getName());
            stm.setString(4, paInfo.getGender());
            stm.setString(5, paInfo.getEmail());
            stm.setString(6, paInfo.getPhone());
            stm.setDate(7, new java.sql.Date(paInfo.getDob().getTime())); // Convert java.util.Date to java.sql.Date
            stm.setInt(8, paInfo.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PatientViewDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editPatient(HistoryAdmin hiInfo) {
    String sql = """
             UPDATE [dbo].[Appointment_procedure] 
             SET [date_of_procedure] = ?, 
                 [appointment_description] = ?, 
                 [patient_charge] = ?, 
                 [insurance_charge] = ?, 
                 [total_charge] = ?
             WHERE [Patient_id] = ?""";

    try (PreparedStatement stm = connection.prepareStatement(sql)) {
        // Set parameters
        stm.setDate(1, new java.sql.Date(hiInfo.getDop().getTime())); // Convert java.util.Date to java.sql.Date
        stm.setString(2, hiInfo.getAppointment_description());
        stm.setDouble(3, hiInfo.getPatient_charge());
        stm.setDouble(4, hiInfo.getInsurance_charge());
        stm.setDouble(5, hiInfo.getTotal_charge());
        stm.setInt(6, hiInfo.getPatient().getId());

        // Execute the update
        stm.executeUpdate();
    } catch (SQLException ex) {
        Logger.getLogger(PatientViewDB.class.getName()).log(Level.SEVERE, null, ex);
    }
}

    public static void main(String[] args) {
        PatientViewDB p = new PatientViewDB();
        System.out.println();

    }

}
