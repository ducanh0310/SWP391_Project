/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
import model.Prescription;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Patient;

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
    
      public static void main(String[] args) {
        DoctorDB d=new DoctorDB();
        System.out.println(d.getPrescription());

    }
}
