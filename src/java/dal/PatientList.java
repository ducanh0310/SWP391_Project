/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Patient;

/**
 *
 * @author Gia Huy
 */
public class PatientList extends DBContext {

    public ArrayList<Patient> getPatient(int pid) {
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
                    + "  FROM p [Patient]\n";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Patient p = new Patient();
                p.setId(rs.getInt("id"));
                p.setSin(rs.getInt("sin"));
                p.setName(rs.getString("name"));
                p.setAddress(rs.getNString("address"));
                p.setGender(rs.getNString("gender"));
                p.setEmail(rs.getNString("email"));
                p.setPhone(rs.getNString("phone"));
                p.setInsurance(rs.getNString("insurance"));
                p.setRep_id(rs.getInt("rep_id"));
                p.setDob(rs.getDate("dob"));
                patient.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(PatientList.class.getName()).log(Level.SEVERE, null, ex);
        }
        return patient;
    }


}
