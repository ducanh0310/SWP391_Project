/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.lang.RuntimeException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author trung
 */
public class UserDAO extends DBContext {

    public User checkUser(String username) throws SQLException {
        String query = "select * from User_account where username = ? or patient_id = (select patient_id from Patient where email =  ?) or employee_id = (select employee_id from Employee where email = ?)";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);

            statement.setString(1, username);
            statement.setString(2, username);
            statement.setString(3, username);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return null;
    }

    public ArrayList<User> getAll() throws SQLException {
        ArrayList<User> list = new ArrayList<>();

        String query = "select * from User_account";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5));
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }

        return list;
    }

    public User getUserByPatientId(int patientId) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        String query = "SELECT * FROM User_account WHERE patient_id = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, patientId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return null;
    }
    public User getUserByEmployeeId(int patientId) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        String query = "SELECT * FROM User_account WHERE [employee_id] = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, patientId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return null;
    }

    public String checkPasswordByUsername(String username) throws SQLException {
        String query = "select password from User_account where username = ?";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getString("password");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return null;
    }

    public void changePassword(String username, String newPass) throws SQLException {
        String query = "UPDATE [dbo].[User_account] SET password = ? WHERE username = ?";
        Connection connection = null;
        PreparedStatement statement = null;
        try {

            connection = getConnection();
            statement = connection.prepareStatement(query);

            statement.setString(1, newPass);
            statement.setString(2, username);
            int rs = statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }

    }
    public static void main(String[] args) {
        try {
            User u = new UserDAO().getUserByEmployeeId(3);
            System.out.println(u.getName());
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
