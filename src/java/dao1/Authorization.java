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
import java.util.logging.Logger;

/**
 *
 * @author trung
 */
public class Authorization {

    private final Connection connection;

    public Authorization() {
        this.connection = DBContext.getConnection();
    }

    public String isEmployee(String employeeId) {
        String sql = "Select employee_type from [Employee] where employee_id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, employeeId);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                return rs.getString("employee_type");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
        }
        return null;
    }
    
    
    public static void main(String[] args) {
        Authorization autho = new Authorization();
        
        System.out.println(autho.isEmployee("1"));
    }
}
