/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao1;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author Vu Minh Quan
 */
public class DBAccount extends DBContext{
     public DBAccount() throws ClassNotFoundException {
        super(); // Calls the constructor of DBContext to initialize the connection
    }
     
    public Account showAccountInfo(String username){
        Account acc = new Account();
        try {
            String sql="Select username, password, type_id, patient_id, employee_id, image  from User_account where username=?";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs =stm.executeQuery();
            while(rs.next()){
                
                acc.setUsername(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                acc.setType_id(rs.getInt("type_id"));
                acc.setPatient_id(rs.getInt("patient_id"));
                acc.setEmployee_id(rs.getInt("employee_id"));
                acc.setImage(rs.getString("image"));
            }

            
        } catch (SQLException ex) {
            Logger.getLogger(DBAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return acc;

    }
}
