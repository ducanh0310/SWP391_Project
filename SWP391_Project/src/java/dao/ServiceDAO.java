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

    public boolean updateService(int id, String name, String price, String description, int dId) throws SQLException {
        String query = "UPDATE Procedure_codes SET procedure_name = ?, price = ?, description = ?, [doctor_id] = ? WHERE procedure_id = ?";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, price);
            statement.setString(3, description); //
            statement.setInt(4, dId); // Đặt id vào vị trí tham số thứ 4
            statement.setInt(5, id);
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
            return false;
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
    }

    public ProcedureCodes getServiceById(int id) throws SQLException {
        String query = """
                       \tSELECT p.* FROM [SWP391_Project].[dbo].[Procedure_codes] AS p WHERE p.[procedure_id] = ? ORDER BY CASE WHEN p.[type] = 'a' THEN 0 ELSE 1 END, p.[procedure_name];""";
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
                EmployeeDAO employeeDAO = new EmployeeDAO();
                Employee e = employeeDAO.getEmployeeByEmployeeId(resultSet.getInt("doctor_id"));
                procedureCode.setEmployee(e);
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
            System.out.println(s.getServiceById(16).getEmployee().getName());
        } catch (SQLException ex) {
            System.out.println("Employee Null");
        }
    }
}
