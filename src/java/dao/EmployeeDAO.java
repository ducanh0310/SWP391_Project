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
import java.util.ArrayList;
import model.Employee;
import model.Employees;
import model.User;
import model.Branch;
import Service.IEmployeeDAO;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author trung
 */
public class EmployeeDAO extends DBContext implements IEmployeeDAO {

    //Get Employee table and doctor certification table
    @Override
    public Employee getEmployeeByEmployeeId(String employeeId) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        String query = "SELECT \n"
                + "    e.*,\n"
                + "    dc.url,\n"
                + "    dc.name_cetification\n"
                + "FROM \n"
                + "    Employee e\n"
                + "LEFT JOIN \n"
                + "    Doctor_Certification dc ON e.employee_id = dc.id_doctor\n"
                + "WHERE \n"
                + "    e.employee_id = ?";
        Employee emp = new Employee();
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, employeeId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                emp.setId(rs.getInt("employee_id"));
                emp.setEmployeeSin(rs.getString("employee_sin"));
                emp.setEmployeeType(rs.getString("employee_type"));
                emp.setName(rs.getString("name"));
                emp.setAddress(rs.getString("address"));
                emp.setAnnualSalary(rs.getFloat("annual_salary"));
                emp.setBranchId(rs.getInt("branch_id"));
                emp.setEmail(rs.getString("email"));
                emp.setDob(rs.getDate("dob"));
                emp.setPhoneNumber(rs.getString("phone"));
                emp.setUrl(rs.getString("url"));
                emp.setCertificationName(rs.getString("name_cetification"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return emp;
    }

    //Get all list of employee do not have condition
    @Override
    public ArrayList<Employees> getEmployees() throws SQLException {
        Employee employeeInfo = new Employee();
        ArrayList<Employees> employeeList = new ArrayList<>();
        String sql = "select * from Employee";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Employees e = new Employees(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getDate(10),
                        rs.getString(11));
                employeeList.add(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return employeeList;
    }

    //get all employee when have username
    @Override
    //get all employee when have username
    public ArrayList<Employees> getEmployeeByName(String key) throws SQLException {
        ArrayList<Employees> employeeList = new ArrayList<>();
        String sql = "SELECT * FROM Employee WHERE LOWER(name) LIKE ? OR LOWER(employee_id) LIKE ? OR LOWER(employee_sin) LIKE ? OR LOWER(employee_type) LIKE ? OR LOWER(phone) LIKE ?";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            //set to lower case
            String searchKey = "%" + key.toLowerCase() + "%";
            statement.setString(1, searchKey);
            statement.setString(2, searchKey);
            statement.setString(3, searchKey);
            statement.setString(4, searchKey);
            statement.setString(5, searchKey);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Employees e = new Employees(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getFloat(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getDate(10),
                        rs.getString(11));
                employeeList.add(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return employeeList;
    }

    // Set role is inactive
    @Override
    public void deleteEmployee(String key) throws SQLException {
    String sql = "UPDATE Employee SET employee_type = 'I' WHERE employee_id = ?;";
    Connection connection = null;
    PreparedStatement statement = null;
    try {
        connection = getConnection();
        statement = connection.prepareStatement(sql);
        statement.setString(1, key);
        statement.executeUpdate();  // Corrected to executeUpdate
    } catch (SQLException e) {
        e.printStackTrace();
        throw e;  // Rethrow the exception to inform the caller
    } finally {
        closePreparedStatement(statement);
        closeConnection(connection);
    }
}


    public static void main(String[] args) {
        try {
            EmployeeDAO emp = new EmployeeDAO();
            emp.deleteEmployee("2");
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
