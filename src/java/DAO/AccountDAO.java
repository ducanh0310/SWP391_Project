package DAO;

import dal.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Logger;

public class AccountDAO {

    private final Connection connection;

    public AccountDAO() {
        this.connection = DBContext.getConnection();
    }
    public ArrayList<String> getAllAccount() {
        ArrayList<String> list = new ArrayList<>();
        String query = "SELECT username FROM User_account";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("username"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
        }
        return list;
    }


    public ArrayList<String> getAllEmail() {
        ArrayList<String> list = new ArrayList<>();
        String query = "SELECT email FROM Patient";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("email"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
        }
        return list;
    }
    public boolean addPatient(String address, String name, String gender, String email, Date DOB ) {
        String query = "INSERT INTO Patient_info(address, name, gender, email, DOB) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, address);
            statement.setString(2, name);
            statement.setString(3, gender);
            statement.setString(4, email);
            statement.setDate(5, DOB);
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
            return false;
        }
    }
    public boolean addAccount(String username, String password, int patientId, int type_id) {
        String query = "INSERT INTO User_account(username, password, patient_id, type_id) VALUES(?,?,?, 1)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setInt(3, patientId);
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
            return false;
        }
    }
    public boolean checkAccount(String username) {
        String query = "SELECT username FROM User_account WHERE username = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
            return false;
        }
    }
    public boolean addPatientAccount(String email, String username, String password) {
        String insertPatientSQL = "INSERT INTO Patient (email) VALUES (?)";
        String insertUserAccountSQL = "INSERT INTO User_account (username, password, type_id, patient_id) VALUES (?, ?, ?, ?)";

        PreparedStatement insertPatientStmt = null;
        PreparedStatement insertUserAccountStmt = null;
        ResultSet generatedKeys = null;

        try {
            // Start transaction
            connection.setAutoCommit(false);

            // Insert into Patient table
            insertPatientStmt = connection.prepareStatement(insertPatientSQL, PreparedStatement.RETURN_GENERATED_KEYS);
            insertPatientStmt.setString(1, email);
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
                if (generatedKeys != null) generatedKeys.close();
                if (insertPatientStmt != null) insertPatientStmt.close();
                if (insertUserAccountStmt != null) insertUserAccountStmt.close();
                if (connection != null) connection.setAutoCommit(true); // Reset auto-commit to true
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        System.out.println(dao.checkAccount("elmurder666"));
    }

}
