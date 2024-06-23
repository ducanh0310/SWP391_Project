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
    public ArrayList<Employees> getEmployeeByName(String key) throws SQLException {
        ArrayList<Employees> employeeList = new ArrayList<>();
        String sql = "SELECT * FROM Employee WHERE LOWER(name) LIKE ?";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            // Chuyển đổi key thành chữ thường và thêm ký tự wildcard cho câu truy vấn LIKE
            String searchKey = "%" + key.toLowerCase() + "%";
            statement.setString(1, searchKey);
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

    
    
    public void deleteEmployee(String key) throws SQLException {
        String sql = "DELETE DC FROM Doctor_Certification DC INNER JOIN Employee E ON DC.id = E.employee_id WHERE E.employee_id = ?;\n"
                + "DELETE FROM Employee WHERE employee_id = ?;";
        Connection connection = null;
        PreparedStatement statement = null;
        try{
            connection = getConnection();
            statement = connection.prepareStatement(sql);
             statement.setString(1, key);
             statement.setString(2, key);
             ResultSet rs = statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
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
