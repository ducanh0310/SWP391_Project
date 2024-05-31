/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao1;

import dal.DBContext;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Branch;
import model.Employee;
import java.sql.*;
/**
 *
 * @author Vu Minh Quan
 */
public class DBEmployeeProfile extends DBContext{
    public DBEmployeeProfile() throws ClassNotFoundException {
        super(); // Calls the constructor of DBContext to initialize the connection
    }
    //Database for view profile
    public Employee getInfoEmployee(String username){
        Employee employeeInfo= new Employee();
        try {            
            String sql="""
                       Select e.employee_id, e.employee_sin, e.employee_type, e.name, e.address, e.annual_salary,e.gender, e.dob, e.phone, e.email,e.branch_id, b.city from Employee e
                       join Branch b on b.branch_id=e.branch_id
                       join User_account u on u.employee_id=e.employee_id
                       where u.username =?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs =stm.executeQuery();
            while(rs.next()){
                Branch br = new Branch();
                employeeInfo.setId(rs.getInt("employee_id"));
                employeeInfo.setEmployeeSin(rs.getInt("employee_sin"));
                employeeInfo.setEmployeeType(rs.getString("employee_type"));
                employeeInfo.setName(rs.getString("name"));
                employeeInfo.setAnnualSalary(rs.getFloat("annual_salary"));
                employeeInfo.setAddress(rs.getString("address"));
                employeeInfo.setGender(rs.getString("gender"));
                employeeInfo.setDob(rs.getDate("dob"));
                employeeInfo.setPhoneNumber(rs.getString("phone"));
                employeeInfo.setEmail(rs.getString("email"));
                employeeInfo.setBranchId(rs.getInt("branch_id"));
                br.setCity(rs.getString("city"));
                employeeInfo.setBranch(br);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBPatientProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return employeeInfo;
    }
    
    //Database fo edit profile
    public void editInfoEmployee(Employee emInfo){
         try {
             String sql="""
                        UPDATE [dbo].[Employee]
                            SET [employee_sin] = ?
                               ,[employee_type] = ?
                               ,[name] = ?
                               ,[address] = ?
                               ,[annual_salary] = ?
                               ,[branch_id] = ?
                               ,[gender] = ?
                               ,[phone] = ?
                               ,[dob] = ?
                               ,[email] = ?
                          WHERE [employee_id]=?""";
             PreparedStatement stm = connection.prepareStatement(sql);
             stm.setInt(1, emInfo.getEmployeeSin());
             stm.setString(2, emInfo.getEmployeeType());
             stm.setString(3, emInfo.getName());
             stm.setString(4, emInfo.getAddress());
             stm.setFloat(5, emInfo.getAnnualSalary());
             stm.setInt(6, emInfo.getBranchId());
             stm.setString(7, emInfo.getGender());
             stm.setString(8, emInfo.getPhoneNumber());
             stm.setDate(9, emInfo.getDob());
             stm.setString(10, emInfo.getEmail());
             stm.setInt(11,emInfo.getId());
             stm.executeUpdate();
             
         } catch (SQLException ex) {
             Logger.getLogger(DBPatientProfile.class.getName()).log(Level.SEVERE, null, ex);
         }
        
    }
}
