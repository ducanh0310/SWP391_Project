/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.DoctorCertification;
import model.Employee;
import model.EmployeeDTO;
import model.Employees;
import model.Patient;
import model.User;

/**
 *
 * @author trung
 */
public class EmployeeDAO extends DBContext {

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

    public Employee getEmployeeByEmployeeId(int employeeId) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        String query = "select * from Employee where employee_id = ?";
        Employee emp = new Employee();
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, employeeId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                emp.setId(rs.getInt("employee_id"));
                emp.setEmployeeSin(rs.getString("employee_sin"));
                emp.setEmployeeType(rs.getString("employee_type"));
                emp.setName(rs.getString("name"));
                emp.setAddress(rs.getString("address"));
                emp.setAnnualSalary(rs.getFloat("annual_salary"));
                emp.setBranchId(rs.getInt("branch_id"));
                emp.setGender(rs.getString("gender"));
                emp.setPhoneNumber(rs.getString("phone"));
                emp.setDob(rs.getDate("dob"));
                emp.setEmail(rs.getString("email"));
                return emp;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return null;
    }

    public boolean addEmployeeAccount(Employee employee, String username, String password, ArrayList<DoctorCertification> certificates) {
        String insertEmployeeSQL = "INSERT INTO [dbo].[Employee] ([employee_sin], [employee_type], [name], [address], [annual_salary], [branch_id], [gender], [phone], [dob], [email] ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String insertUserAccountSQL = "INSERT INTO User_account (username, password, type_id, [employee_id]) VALUES (?, ?, ?, ?)";
        String insertCertificationSQL = "INSERT INTO [dbo].[Doctor_Certification] ([url], [id_doctor], [name_cetification]) VALUES (?, ?, ?)";
        Connection connection = null;
        PreparedStatement insertEmployeeStmt = null;
        PreparedStatement insertUserAccountStmt = null;
        PreparedStatement insertCertificationStmt = null;
        ResultSet generatedKeys = null;

        try {
            // Start transaction
            connection = getConnection();
            connection.setAutoCommit(false);

            // Insert into Patient table
            insertEmployeeStmt = connection.prepareStatement(insertEmployeeSQL, PreparedStatement.RETURN_GENERATED_KEYS);
            insertEmployeeStmt.setString(1, employee.getEmployeeSin());
            insertEmployeeStmt.setString(2, employee.getEmployeeType());
            insertEmployeeStmt.setString(3, employee.getName());
            insertEmployeeStmt.setString(4, employee.getAddress());
            insertEmployeeStmt.setFloat(5, employee.getAnnualSalary());
            insertEmployeeStmt.setInt(6, employee.getBranchId());
            insertEmployeeStmt.setString(7, employee.getGender());
            insertEmployeeStmt.setString(8, employee.getPhoneNumber());
            insertEmployeeStmt.setDate(9, (Date) employee.getDob());
            insertEmployeeStmt.setString(10, employee.getEmail());
            int affectedRows = insertEmployeeStmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Inserting employee failed, no rows affected.");
            }

            // Get the generated employee id
            generatedKeys = insertEmployeeStmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                int employeeid = generatedKeys.getInt(1);

                // Insert into User_account table
                insertUserAccountStmt = connection.prepareStatement(insertUserAccountSQL);
                insertUserAccountStmt.setString(1, username);
                insertUserAccountStmt.setString(2, password);
                insertUserAccountStmt.setInt(3, 1); // Assuming 1 is the type_id for employee
                insertUserAccountStmt.setInt(4, employeeid);

                insertUserAccountStmt.executeUpdate();
                if (certificates != null && !certificates.isEmpty()) {
                    insertCertificationStmt = connection.prepareStatement(insertCertificationSQL);
                    for (DoctorCertification cert : certificates) {
                        insertCertificationStmt.setString(1, cert.getUrl());
                        insertCertificationStmt.setInt(2, employeeid);
                        insertCertificationStmt.setString(3, cert.getName());
                        insertCertificationStmt.executeUpdate();
                    }
                }
            } else {
                throw new SQLException("Inserting employee failed, no ID obtained.");
            }

            // Commit transaction
            connection.commit();
            return true;

        } catch (SQLException e) {
            // Rollback transaction in case of error
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
            return false;
        } finally {
            // Clean up resources
            try {
                if (generatedKeys != null) {
                    generatedKeys.close();
                }
                if (insertEmployeeStmt != null) {
                    insertEmployeeStmt.close();
                }
                if (insertUserAccountStmt != null) {
                    insertUserAccountStmt.close();
                }
                if (insertCertificationStmt != null) {
                    insertCertificationStmt.close();
                }
                if (connection != null) {
                    connection.setAutoCommit(true); // Reset auto-commit to true
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
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
    //get all employee when have username
    public ArrayList<Employees> getEmployeeByName(String key) throws SQLException {
        ArrayList<Employees> employeeList = new ArrayList<>();
        String sql = "SELECT * FROM Employee WHERE LOWER(name) LIKE ? OR LOWER(employee_id) LIKE ? OR LOWER(employee_sin) LIKE ? OR LOWER(employee_type) LIKE ? OR LOWER(phone) LIKE ?";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            // Chuyển đổi key thành chữ thường và thêm ký tự wildcard cho câu truy vấn LIKE
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

    public static void main(String[] args) {
        Employee employee = new Employee("11111", "d", "test dc", "hahah", (float) 10.5, 1, "0123456789", "a.bc@new.b", Date.valueOf("2003-05-02"), "X");
        EmployeeDAO dao = new EmployeeDAO();
        DoctorCertification dc = new DoctorCertification();
        dc.setName("a");
        dc.setUrl("b");
        ArrayList<DoctorCertification> dcArr = new ArrayList<>();
        dcArr.add(dc);
        boolean isAdded = dao.addEmployeeAccount(employee, "a.bc", "vailonluonaothaatday", dcArr);
        System.out.println(isAdded);
    }
}
