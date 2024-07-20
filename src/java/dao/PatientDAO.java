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
import model.PatientGetByIdDTO;
import model.PatientInfo;
import model.Representative;

/**
 *
 * @author trung
 */
public class PatientDAO extends DBContext {

    public PatientGetByIdDTO getPatientById(String patientId) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        String query = "select * from Patient where Patient_id = ?";
        PatientGetByIdDTO patient = new PatientGetByIdDTO();
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);

            statement.setString(1, patientId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                patient.setId(rs.getInt("Patient_id"));
                patient.setSin(rs.getString("patient_sin"));
                patient.setAddress(rs.getString("address"));
                patient.setName(rs.getString("name"));
                patient.setGender(rs.getString("gender"));
                patient.setEmail(rs.getString("email"));
                patient.setPhone(rs.getString("phone"));
                patient.setDob(rs.getDate("date_of_birth"));
                patient.setInsurance(rs.getString("insurance"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return patient;
    }

    public void addPatient(PatientInfo p) throws SQLException {
        String query = """
                       INSERT INTO [dbo].[Patient]
                                  ([patient_sin]
                                  ,[address]
                                  ,[name]
                                  ,[gender]
                                  ,[email]
                                  ,[phone]
                                  ,[date_of_birth]
                                  ,[type] )
                            VALUES
                                  (?
                                  ,?
                                  ,?
                                  ,?
                                  ,?
                                  ,?
                                  ,?
                       ,?)""";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getPatientSin());
            statement.setString(2, p.getAddress());
            statement.setString(3, p.getName());
            statement.setString(4, p.getGender());
            statement.setString(5, p.getEmail());
            statement.setString(6, p.getPhoneNumber());
            statement.setString(7, String.valueOf(p.getDob()));
            statement.setString(8, p.getType());
            statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(PatientDAO.class.getName());

        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
    }

    public void addRepresentative(Representative representative) throws SQLException {
        String query = """
                       INSERT INTO [dbo].[Representative]
                                             ([name]
                                             ,[phone]
                                             ,[email]
                                             ,[relationship],[type])
                                       VALUES
                                             (?
                                             ,?
                                             ,?
                                             ,?,?)""";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, representative.getName());
            statement.setString(2, representative.getPhone());
            statement.setString(3, representative.getEmail());
            statement.setString(4, representative.getRelationship());
            statement.setString(5, representative.getType());
            statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(PatientDAO.class.getName());

        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
    }

    public boolean addPatientAccount(Patient p, String username, String password) {
        String insertPatientSQL = "INSERT INTO Patient (patient_sin, address, name, gender, email, phone, date_of_birth, insurance, rep_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String insertUserAccountSQL = "INSERT INTO User_account (username, password, type_id, patient_id) VALUES (?, ?, ?, ?)";
        Connection connection = null;
        PreparedStatement insertPatientStmt = null;
        PreparedStatement insertUserAccountStmt = null;
        ResultSet generatedKeys = null;

        try {
            // Start transaction
            connection = getConnection();
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

    public ArrayList<PatientGetByIdDTO> getPatient() throws SQLException {
        ArrayList<PatientGetByIdDTO> patient = new ArrayList<>();
        String query = "SELECT [Patient_id]\n"
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
            connection = getConnection();
            statement = connection.prepareStatement(query);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                PatientGetByIdDTO p = new PatientGetByIdDTO();
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
            Logger.getLogger(PatientDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return patient;
    }

    public PatientGetByIdDTO getPatient(int pid) throws SQLException {
        ArrayList<PatientGetByIdDTO> patient = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        String query = "SELECT [Patient_id]\n"
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
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, pid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                PatientGetByIdDTO p = new PatientGetByIdDTO();
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
            Logger.getLogger(PatientDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return null;
    }
    
    public Representative getRepresentative(int pid) throws SQLException {
        ArrayList<PatientGetByIdDTO> patient = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        String query = """
                       Select rep.name, rep.relationship, rep.phone, rep.email from Patient p
                       join Representative rep on rep.type = p.type
                       where p.Patient_id = ?""";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, pid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Representative rep = new Representative();
                rep.setName(rs.getString("name"));
                rep.setRelationship(rs.getString("relationship"));
                rep.setPhone(rs.getString("phone"));
                rep.setEmail(rs.getString("email"));
                return rep;
            }

        } catch (SQLException ex) {
            Logger.getLogger(PatientDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return null;
    }

    public boolean updatePatient(PatientGetByIdDTO paInfo) throws SQLException {
        String query = """
                        UPDATE [dbo].[Patient]
                           SET [patient_sin] = ?
                              ,[address] = ?
                              ,[name] = ?
                              ,[gender] = ?
                              ,[email] = ?
                              ,[phone] = ?
                              ,[date_of_birth] = ?
                              ,insurance = ?
                              , rep_id = ?
                         WHERE [Patient_id]=?""";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, paInfo.getSin());
            statement.setString(2, paInfo.getAddress());
            statement.setString(3, paInfo.getName());
            statement.setString(4, paInfo.getGender());
            statement.setString(5, paInfo.getEmail());
            statement.setString(6, paInfo.getPhone());
            statement.setDate(7, paInfo.getDob());
            // Set insurance, handle null
            if (paInfo.getInsurance() != null) {
                statement.setString(8, paInfo.getInsurance());
            } else {
                statement.setObject(8, null);
            }

            // Set rep_id, handle null
            if (paInfo.getRep_id() != null) {
                statement.setInt(9, paInfo.getRep_id());
            } else {
                statement.setObject(9, null);
            }
            statement.setInt(10, paInfo.getId());
            statement.executeUpdate();
            return true;

        } catch (SQLException ex) {
            Logger.getLogger(DBPatientProfile.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
    }

    public static void main(String[] args) {
        try {
            PatientDAO pa = new PatientDAO();
            PatientInfo paInfo = new PatientInfo();
            paInfo.setPatientSin(null);
            paInfo.setName("Do Minh Duong");
            paInfo.setPhoneNumber("");
            paInfo.setEmail(null);
            paInfo.setGender("M");
            paInfo.setDob(Date.valueOf("2012-02-10"));
            paInfo.setAddress("223 Sesame Street, Ottawa, ON, Canada");
            paInfo.setType(null);
            pa.addPatient(paInfo);
            System.out.println(paInfo.getName());
        } catch (SQLException ex) {
            Logger.getLogger(PatientDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
