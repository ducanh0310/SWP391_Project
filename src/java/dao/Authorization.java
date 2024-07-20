/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;

/**
 *
 * @author trung
 */
public class Authorization extends DBContext{

    public String isEmployee(String employeeId) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        String query = "Select employee_type from [Employee] where employee_id = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, employeeId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getString("employee_type");
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return null;
    }

}
