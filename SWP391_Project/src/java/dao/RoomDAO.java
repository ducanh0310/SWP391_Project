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
import java.util.logging.Logger;
import model.Slot;

/**
 *
 * @author ngphn
 */
public class RoomDAO extends DBContext {

    public String getRoomNameByID(int id) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        String query = "select name from Room where id = ?";
        String roomName = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);

            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                roomName = rs.getString("name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
            throw ex; //nesm exception ra ngoai
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return roomName;
    }
}
