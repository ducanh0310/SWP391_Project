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
            , Date bookingDate, String startTime, String endTime, int room, String status, String payRevervationStatus,String examinationStatus, String description) throws SQLException{
        String query = "INSERT INTO [dbo].[ExaminationResult]([appointmentId], [patientId],[patientName],[service]\n" +
            ",[price],[doctor],[bookingDate],[startTime],[endTime],[room],[status],[payReservationStatus],[examination_status],[description]) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        java.sql.Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.setInt(2, patientId);
            statement.setString(3, patientName);
            statement.setString(4, service);
            statement.setInt(5, price);
            statement.setString(6, doctor);
            statement.setDate(7, bookingDate);
            statement.setString(8, startTime);
            statement.setString(9, endTime);
            statement.setInt(10, room);
            statement.setString(11, status);
            statement.setString(12, payRevervationStatus);
            statement.setString(13, examinationStatus);
            statement.setString(14, description);
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
