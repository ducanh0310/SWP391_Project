/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Employee;
import model.Patient;

/**
 *
 * @author trung
 */
public class PatientDAO extends DBContext {

    public Patient getPatientById(String patientId) throws SQLException {
        String query = "select * from Patient where Patient_id = ?";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);

            statement.setString(1, patientId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Patient patient = new Patient(rs.getInt("Patient_id"),
                        rs.getString("patient_sin"),
                        rs.getString("address"),
                        rs.getString("name"),
                        rs.getString("gender"),
                        rs.getString("phone"),
                        rs.getDate("date_of_birth"),
                        rs.getString("insurance"),
                        rs.getInt("rep_id"));
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

    public boolean addPatient(Patient p) {
        String query = "INSERT INTO Patient (patient_sin, address, name, gender, email, phone, date_of_birth, insurance, rep_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getSin());
            statement.setString(2, p.getAddress());
            statement.setString(3, p.getName());
            statement.setString(4, p.getGender());
            statement.setString(5, p.getEmail());
            statement.setString(6, p.getPhone());
            statement.setDate(7, (Date) p.getDob());
            statement.setString(8, p.getInsurance());
            statement.setInt(9, p.getRep_id());
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(PatientDAO.class.getName());
            return false;
        }
    }

    public boolean addPatientAccount(Patient p, String username, String password) {
        String insertPatientSQL = "INSERT INTO Patient (patient_sin, address, name, gender, email, phone, date_of_birth, insurance, rep_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String insertUserAccountSQL = "INSERT INTO User_account (username, password, type_id, patient_id) VALUES (?, ?, ?, ?)";

        PreparedStatement insertPatientStmt = null;
        PreparedStatement insertUserAccountStmt = null;
        ResultSet generatedKeys = null;

        try {
            // Start transaction
            connection.setAutoCommit(false);

            // Insert into Patient table
            insertPatientStmt = connection.prepareStatement(insertPatientSQL, PreparedStatement.RETURN_GENERATED_KEYS);
            insertPatientStmt.setString(1, p.getSin());
            insertPatientStmt.setString(2, p.getAddress());
            insertPatientStmt.setString(3, p.getName());
            insertPatientStmt.setString(4, p.getGender());
            insertPatientStmt.setString(5, p.getEmail());
            insertPatientStmt.setString(6, p.getPhone());
            insertPatientStmt.setDate(7, (Date) p.getDob());
            insertPatientStmt.setString(8, p.getInsurance());
            insertPatientStmt.setInt(9, p.getRep_id());
            int affectedRows = insertPatientStmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Inserting patient failed, no rows affected.");
            }

            // Get the generated patient_id
            generatedKeys = insertPatientStmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                int patientId = generatedKeys.getInt(1);

                // Insert into User_account table
                insertUserAccountStmt = connection.prepareStatement(insertUserAccountSQL);
                insertUserAccountStmt.setString(1, username);
                insertUserAccountStmt.setString(2, password);
                insertUserAccountStmt.setInt(3, 0); // Assuming 0 is the type_id for patient
                insertUserAccountStmt.setInt(4, patientId);

                insertUserAccountStmt.executeUpdate();
            } else {
                throw new SQLException("Inserting patient failed, no ID obtained.");
            }

            // Commit transaction
            connection.commit();
            return true;

        } catch (SQLException e) {
            // Rollback transaction in case of error
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
            return false;
        } finally {
            // Clean up resources
            try {
                if (generatedKeys != null) {
                    generatedKeys.close();
                }
                if (insertPatientStmt != null) {
                    insertPatientStmt.close();
                }
                if (insertUserAccountStmt != null) {
                    insertUserAccountStmt.close();
                }
                if (connection != null) {
                    connection.setAutoCommit(true); // Reset auto-commit to true
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    public ArrayList<Patient> getPatient() {
        ArrayList<Patient> patient = new ArrayList<>();
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
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Patient p = new Patient(rs.getInt("Patient_id"),
                        rs.getString("patient_sin"),
                        rs.getString("address"),
                        rs.getString("name"),
                        rs.getString("gender"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getDate("date_of_birth"),
                        rs.getString("insurance"),
                        rs.getInt("rep_id"));

                patient.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(PatientDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return patient;
    }

    public Patient getPatient(int pid) throws SQLException {
        ArrayList<Patient> patient = new ArrayList<>();
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
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, pid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Patient p = new Patient(
                        rs.getInt("Patient_id"),
                        rs.getString("patient_sin"),
                        rs.getString("address"),
                        rs.getString("name"),
                        rs.getString("gender"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getDate("date_of_birth"),
                        rs.getString("insurance"),
                        rs.getInt("rep_id"));
                return p;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return null;
    }

    public boolean updatePatient(Patient p) {

        return true;
    }

//    public static void main(String[] args) {
//        PatientDAO ptDAO = new PatientDAO();
//        System.out.println(ptDAO.getPatient(1).getName());
//    }
}
