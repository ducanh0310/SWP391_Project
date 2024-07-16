/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;



import dal.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Logger;
import model.ExaminationResult;

/**
 *
 * @author trung
 */
public class ExaminationDAO extends DBContext{
   
    public boolean addExaminationResult(int id, int patientId, String patientName, String service, int price, String doctor
            , Date bookingDate, String startTime, String endTime, int room, String status, String payRevervationStatus,String examinationStatus, String description) throws SQLException{
        String query = "INSERT INTO [dbo].[ExaminationResult]([appointmentId], [patientId],[patientName],[service]\n" +
            ",[price],[doctor],[bookingDate],[startTime],[endTime],[room],[status],[payReservationStatus],[examination_status],[description]) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Connection connection = null;
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
    
    
    public ExaminationResult checkExaminationResultExist(int appID) throws SQLException{
        String query = "select * from ExaminationResult where appointmentId = ?";
        Connection connection = null;
        PreparedStatement statement = null;
        try{
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, appID);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                ExaminationResult exam = new  ExaminationResult();
                exam.setAppointmentId(rs.getInt("appointmentId"));
                exam.setPatientId(rs.getInt("patientId"));
                exam.setPatientName(rs.getString("patientName"));
                exam.setService(rs.getString("service"));
                exam.setPrice(rs.getInt("price"));
                exam.setDoctor(rs.getString("doctor"));
                exam.setBookingDate(rs.getDate("bookingDate"));
                exam.setStartTime(rs.getString("startTime"));
                exam.setEndTime(rs.getString("endTime"));
                exam.setRoom(rs.getInt("room"));
                exam.setStatus(rs.getString("status"));
                exam.setPayRevervationStatus(rs.getString("payRevervationStatus"));
                exam.setExaminationStatus(rs.getString("examination_status"));
                exam.setDescription(rs.getString("description"));
                return exam;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return null;
    }
    
    public ArrayList<ExaminationResult> getAllExaminationResult() throws SQLException{
        ExaminationResult exam = new  ExaminationResult();
        String query = "select * from ExaminationResult";
        Connection connection = null;
        PreparedStatement statement = null;
        ArrayList<ExaminationResult> examList = new ArrayList<>();
        try{
            connection = getConnection();
            statement = connection.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                exam.setAppointmentId(rs.getInt("appointmentId"));
                exam.setPatientId(rs.getInt("patientId"));
                exam.setPatientName(rs.getString("patientName"));
                exam.setService(rs.getString("service"));
                exam.setPrice(rs.getInt("price"));
                exam.setDoctor(rs.getString("doctor"));
                exam.setBookingDate(rs.getDate("bookingDate"));
                exam.setStartTime(rs.getString("startTime"));
                exam.setEndTime(rs.getString("endTime"));
                exam.setRoom(rs.getInt("room"));
                exam.setStatus(rs.getString("status"));
                exam.setPayRevervationStatus(rs.getString("payRevervationStatus"));
                exam.setExaminationStatus(rs.getString("examination_status"));
                exam.setDescription(rs.getString("description"));
                examList.add(exam);
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return examList;
    }
    
    
    
    public static void main(String[] args) {
        ExaminationDAO dao = new ExaminationDAO();
        ArrayList<ExaminationResult> exam = new ArrayList<>();
        System.out.println(exam);
    }
}
