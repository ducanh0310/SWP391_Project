/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

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
    
    
    
    public void updateImageProfile(String username, String image) throws SQLException{
            String sql="""
                                   UPDATE [dbo].[User_account]
                                    SET [image] = ?
                                    WHERE username=?""";
            Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, image);
            statement.setString(2, username);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        
    }
    
    
      
      
}