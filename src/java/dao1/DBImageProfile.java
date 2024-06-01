/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao1;

/**
 *
 * @author Vu Minh Quan
 */

import dal.DBContext;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Vu Minh Quan
 */
public class DBImageProfile extends DBContext{
    public DBImageProfile() throws ClassNotFoundException {
        super(); // Calls the constructor of DBContext to initialize the connection
    }
    
    
    
    public void updateImageProfile(String username, String image){
        try {
            String sql="""
                                   UPDATE [dbo].[User_account]
                                    SET [image] = ?
                                    WHERE username=?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, image);
            stm.setString(2, username);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBImageProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    
      
      
}