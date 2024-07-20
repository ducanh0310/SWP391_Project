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
public class DBImageProfile extends DBContext {

    public void updateImageProfile(String username, String image) throws SQLException {
        String query = """
                                   UPDATE [dbo].[User_account]
                                    SET [image] = ?
                                    WHERE username=?""";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, image);
            statement.setString(2, username);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBImageProfile.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
    }

}
