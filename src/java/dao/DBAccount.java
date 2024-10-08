/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;


import dal.DBContext;
import java.sql.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author Vu Minh Quan
 */
public class DBAccount extends DBContext {

    public Account showAccountInfo(String username) throws SQLException{
        Account acc = new Account();
        Connection connection = null;
        PreparedStatement statement = null;
        String sql = "Select username, password, type_id, patient_id, employee_id, image  from User_account where username=?";

        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);

            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {

                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setType_id(rs.getInt("type_id"));
                acc.setPatient_id(rs.getInt("patient_id"));
                acc.setEmployee_id(rs.getInt("employee_id"));
                acc.setImage(rs.getString("image"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBAccount.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        } 

        return acc;
    }
}
