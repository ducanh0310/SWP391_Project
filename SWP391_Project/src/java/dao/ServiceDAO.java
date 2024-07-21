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
<<<<<<< HEAD:SWP391_Project/src/java/dao/ServiceDAO.java
import java.io.IOError;
=======
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/dao/ServiceDAO.java
import java.lang.System.Logger.Level;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Logger;
import model.*;
import java.sql.*;
<<<<<<< HEAD:SWP391_Project/src/java/dao/ServiceDAO.java

public class ServiceDAO extends DBContext {

    public String addService(ProcedureCodes p) throws SQLException {
        String query = "INSERT INTO Procedure_codes(procedure_name, price, [description], [type]) VALUES(?,?,?, 'a')";
=======
public class ServiceDAO extends DBContext {

    public boolean addService(ProcedureCodes p) throws SQLException {
        String query = "INSERT INTO Procedure_codes(procedure_name,price) VALUES(?,?)";
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/dao/ServiceDAO.java
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getProcedure_name());
            statement.setString(2, p.getPrice());
<<<<<<< HEAD:SWP391_Project/src/java/dao/ServiceDAO.java
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
=======
            statement.executeQuery();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName());
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/dao/ServiceDAO.java
            return false;
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
    }
<<<<<<< HEAD:SWP391_Project/src/java/dao/ServiceDAO.java

public ProcedureCodes getServiceById(int id) throws SQLException {
    String query = "SELECT procedure_id, procedure_name, price, description FROM Procedure_codes WHERE procedure_id = ?";
=======
    
    public boolean updateService(int id, String name, String price) throws SQLException {
    String query = "UPDATE Procedure_codes SET procedure_name = ?, price = ? WHERE procedure_id = ?";
    Connection connection = null;
    PreparedStatement statement = null;
    try {
        connection = getConnection();
        statement = connection.prepareStatement(query);
        statement.setString(1, name);
        statement.setString(2, price);
        statement.setInt(3, id); // assuming the primary key is of type int
        statement.executeUpdate();
        return true;
    } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName());
        return false;
    } finally {
        closePreparedStatement(statement);
        closeConnection(connection);
    }
}
    
    public ProcedureCodes getServiceById(int id) throws SQLException {
    String query = "SELECT procedure_id, procedure_name, price FROM Procedure_codes WHERE procedure_id = ?";
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/dao/ServiceDAO.java
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
<<<<<<< HEAD:SWP391_Project/src/java/dao/ServiceDAO.java
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
=======
        }
    } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName());
        throw ex;
    } finally {
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/dao/ServiceDAO.java
        closePreparedStatement(statement);
        closeConnection(connection);
    }
    
    return procedureCode;
}

<<<<<<< HEAD:SWP391_Project/src/java/dao/ServiceDAO.java

=======
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/dao/ServiceDAO.java
    public static void main(String[] args) {
        ServiceDAO s = new ServiceDAO();
        try {
            System.out.println(s.getServiceById(1));
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
    }
<<<<<<< HEAD:SWP391_Project/src/java/dao/ServiceDAO.java
}
=======
}
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/dao/ServiceDAO.java
