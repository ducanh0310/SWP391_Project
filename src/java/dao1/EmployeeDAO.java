/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao1;

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
public class EmployeeDAO {
     private final Connection connection;
    
    public EmployeeDAO(){
        this.connection = DBContext.getConnection();
    }
    
    public Employee getEmployeeByEmployeeId(String employeeId){
        String sql = "select * from Employee where employee_id = ?";
        Employee emp = new Employee();
        try{
            PreparedStatement prepare = connection.prepareStatement(sql);
            prepare.setString(1, employeeId);
            ResultSet rs = prepare.executeQuery();
            if(rs.next()){
                emp.setId(rs.getInt("employee_id"));
                emp.setEmployeeSin(rs.getInt("employee_sin"));
                emp.setEmployeeType(rs.getString("employee_type"));
                emp.setName(rs.getString("name"));
                emp.setAddress(rs.getString("address"));
                emp.setAnnualSalary(rs.getFloat("annual_salary"));
                emp.setBranchId(rs.getInt("branch_id"));
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return emp;
    }
    
    public static void main(String[] args) {
        EmployeeDAO emp = new EmployeeDAO();
        System.out.println(emp.getEmployeeByEmployeeId("3").getName());
    }
}
