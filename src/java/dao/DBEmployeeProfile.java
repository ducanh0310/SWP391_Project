/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Branch;
import model.Employee;
import model.PatientInfo;

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
                       Select e.employee_sin, e.employee_type, e.name, e.address, e.annual_salary,e.gender, e.dob, e.phone, e.email, b.city from Employee e
                       join Branch b on b.branch_id=e.branch_id
                       join User_account u on u.employee_id=e.employee_id
                       where u.username =?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs =stm.executeQuery();
            while(rs.next()){
                Branch br = new Branch();
                employeeInfo.setEmployeeSin(rs.getInt("employee_sin"));
                employeeInfo.setEmployeeType(rs.getString("employee_type"));
                employeeInfo.setName(rs.getString("address"));
                employeeInfo.setAnnualSalary(rs.getFloat("annual_salary"));
                employeeInfo.setAddress(rs.getString("address"));
                employeeInfo.setGender(rs.getString("gender"));
                employeeInfo.setDob(rs.getDate("dob"));
                employeeInfo.setPhoneNumber(rs.getString("phone"));
                employeeInfo.setEmail(rs.getString("email"));
                br.setCity(rs.getString("city"));
                employeeInfo.setBranch(br);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBPatientProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return employeeInfo;
    }
}
