package dao;

import dal.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Logger;

public class AccountDAO extends DBContext implements IAccountDAO {
    //mo truoc dong sau ex statement mo sau cung close dau tien

    public ArrayList<String> getAllAccount() throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        ArrayList<String> list = new ArrayList<>();
        String query = "SELECT username FROM User_account";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("username"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
            throw ex; //nesm exception ra ngoai
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return list;
    }

    public ArrayList<String> getAllEmail() throws SQLException{
        Connection connection = null;
        PreparedStatement statement = null;
        ArrayList<String> list = new ArrayList<>();
        String query = "SELECT email FROM Patient union select email from Employee";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("email"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
        }finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return list;
    }

    @Override
    public boolean addPatient(String address, String name, String gender, String email, Date DOB) throws SQLException  {
        String query = "INSERT INTO Patient_info(address, name, gender, email, DOB) VALUES(?,?,?,?,?)";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
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
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
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

    public boolean checkEmail(String email) {
        String query = "SELECT email FROM Patient WHERE email = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
            return false;
        }
    }

    public boolean checkUserNameAndEmail(String acc) {
        String query = "SELECT username FROM User_account WHERE username = ? UNION SELECT email FROM Patient WHERE email = ? UNION SELECT email FROM Employee WHERE email = ?;";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, acc);
            statement.setString(2, acc);
            statement.setString(3, acc);
            ResultSet rs = statement.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
            return false;
        }
    }

    public String getEmailByUsername(String username) {
        String query = "SELECT email FROM Patient WHERE patient_id = (SELECT patient_id FROM User_account WHERE username = ?) UNION SELECT email FROM Employee WHERE employee_id = (SELECT employee_id FROM User_account WHERE username = ?);";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, username);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getString("email");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
        }
        return null;
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

    public static boolean updatePasswordByEmail(String email, String password) {
        String query = "UPDATE User_account "
                + "SET password = ? "
                + "WHERE patient_id = (SELECT patient_id FROM Patient WHERE email = ?) "
                + "   OR employee_id = (SELECT employee_id FROM Employee WHERE email = ?)";
        try {
            Connection connection = DBContext.getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, password);
            statement.setString(2, email);
            statement.setString(3, email);
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
            return false;
        }
    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        System.out.println(dao.getAllEmail());
    }

}
