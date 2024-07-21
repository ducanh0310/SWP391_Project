/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author ADMIN
 */
import dal.DBContext;
import java.io.IOError;
import java.lang.System.Logger.Level;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Logger;
import model.*;
import java.sql.*;

public class ServiceDAO extends DBContext {

    public String addService(ProcedureCodes p) throws SQLException {
        String query = "INSERT INTO Procedure_codes(procedure_name, price, [description], [type]) VALUES(?,?,?, 'a')";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getProcedure_name());
            statement.setString(2, p.getPrice());
            statement.setString(3, p.getDescription());
            statement.executeUpdate();
            return "true";
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName());
            return String.valueOf(ex);
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
    }

    public boolean isServiceNameExists(String serviceName) throws SQLException {
        String query = "SELECT COUNT(*) FROM Procedure_codes WHERE procedure_name = ?";
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, serviceName);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    public boolean updateService(int id, String name, String price, String description) throws SQLException {
        String query = "UPDATE Procedure_codes SET procedure_name = ?, price = ?, description = ? WHERE procedure_id = ?";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, price);
            statement.setString(3, description); //
            statement.setInt(4, id); // Đặt id vào vị trí tham số thứ 4
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.getSQLState();
            return false;
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
    }

public ProcedureCodes getServiceById(int id) throws SQLException {
    String query = "SELECT procedure_id, procedure_name, price, description FROM Procedure_codes WHERE procedure_id = ?";
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;
    ProcedureCodes procedureCode = null;
    
    try {
        connection = getConnection();
        statement = connection.prepareStatement(query);
        statement.setInt(1, id);
        resultSet = statement.executeQuery();
        
        if (resultSet.next()) {
            procedureCode = new ProcedureCodes();
            procedureCode.setProcedure_id(resultSet.getInt("procedure_id"));
            procedureCode.setProcedure_name(resultSet.getString("procedure_name"));
            procedureCode.setPrice(resultSet.getString("price"));
            procedureCode.setDescription(resultSet.getString("description")); // Thêm trường description
        }
    } catch (SQLException ex) {
        ex.getSQLState();
        throw ex;
    } finally {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.getSQLState();
            }
        }
        closePreparedStatement(statement);
        closeConnection(connection);
    }
    
    return procedureCode;
}


    public static void main(String[] args) {
        ServiceDAO s = new ServiceDAO();
        try {
            System.out.println(s.getServiceById(1));
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
    }
}
