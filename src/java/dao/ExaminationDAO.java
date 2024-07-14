/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;


import dal.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Logger;

/**
 *
 * @author trung
 */
public class ExaminationDAO extends DBContext{
    public boolean addExaminationResult(int id, int patientId, String patientName, String service, int price, String doctor
            , Date bookingDate, String startTime, String endTime, int room, int idStatus, String status, String payRevervationStatus, String description) throws SQLException{
        String query = "INSERT INTO [dbo].[ExaminationResult]\n" +
"           ([patientId]\n" +
"           ,[patientName]\n" +
"           ,[service]\n" +
"           ,[price]\n" +
"           ,[doctor]\n" +
"           ,[bookingDate]\n" +
"           ,[startTime]\n" +
"           ,[endTime]\n" +
"           ,[room]\n" +
"           ,[idStatus]\n" +
"           ,[status]\n" +
"           ,[payReservationStatus]\n" +
"           ,[description])\n" +
"     VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        java.sql.Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, patientId);
            statement.setString(2, patientName);
            statement.setString(3, service);
            statement.setInt(4, price);
            statement.setString(5, doctor);
            statement.setDate(6, bookingDate);
            statement.setString(7, startTime);
            statement.setString(8, endTime);
            statement.setInt(9, room);
            statement.setInt(10, idStatus);
            statement.setString(11, status);
            statement.setString(12, payRevervationStatus);
            statement.setString(13, description);
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
            return false;
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
    }
}
