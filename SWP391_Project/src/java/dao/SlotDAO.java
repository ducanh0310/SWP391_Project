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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PatientGetByIdDTO;
import model.Slot;

/**
 *
 * @author ngphn
 */
public class SlotDAO extends DBContext {

    public Slot getSlotByID(int id) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        String query = "select * from Slot where id = ?";
        Slot slot = new Slot();
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                slot.setId(rs.getInt(id));
                slot.setStartedTime(rs.getTimestamp("startedTime").toLocalDateTime().toLocalTime());
                slot.setEndTime(rs.getTimestamp("endTime").toLocalDateTime().toLocalTime());
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
            throw ex; //nesm exception ra ngoai
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return slot;
    }
    public static void main(String[] args) {
        try {
            SlotDAO slotDAO = new SlotDAO();
            System.out.println(slotDAO.getSlotByID(1));
        } catch (SQLException ex) {
            Logger.getLogger(SlotDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
