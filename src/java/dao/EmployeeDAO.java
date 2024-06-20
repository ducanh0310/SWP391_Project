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
import model.Employee;
import model.User;

/**
 *
 * @author trung
 */
public class EmployeeDAO extends DBContext {

    public Employee getEmployeeByEmployeeId(String employeeId) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        String query = "select * from Employee where employee_id = ?";
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return emp;
    }
}
