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
import java.lang.System.Logger.Level;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Logger;
import model.*;
import java.sql.*;
import java.util.ArrayList;

public class ServiceDAO extends DBContext {

    public boolean addService(ProcedureCodes p) throws SQLException {
        String query = "INSERT INTO Procedure_codes(procedure_name,price) VALUES(?,?)";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, p.getProcedure_name());
            statement.setString(2, p.getPrice());
            statement.executeQuery();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName());
            return false;
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
    }

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
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName());
            throw ex;
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }

        return procedureCode;
    }

    public ArrayList<ProcedureCodes> getServicesName() throws SQLException {
        String query = "select procedure_name, price from Procedure_codes";
        Connection connection = null;
        PreparedStatement statement = null;
        ArrayList<ProcedureCodes> servicesName = new ArrayList<>();
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
             ResultSet rs = statement.executeQuery();
             while(rs.next()){
                 ProcedureCodes pro = new ProcedureCodes();
                 pro.setProcedure_name(rs.getString("procedure_name"));
                 servicesName.add(pro);
             }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return servicesName;
    }

    public static void main(String[] args) {
        ServiceDAO s = new ServiceDAO();
        try {
            System.out.println(s.getServicesName());
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
    }
}
