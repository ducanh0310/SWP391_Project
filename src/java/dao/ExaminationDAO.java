/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ExaminationResult;

/**
 *
 * @author trung
 */
public class ExaminationDAO extends DBContext {

    public String addExaminationResult(int id, int patientId, String patientName, String service, int price, String doctor,
            Date bookingDate, String startTime, String endTime, int room, String status, String payRevervationStatus, String examinationStatus, String description) throws SQLException {
        String query = "INSERT INTO [dbo].[ExaminationResult]([appointmentId], [patientId],[patientName],[service]\n"
                + ",[price],[doctor],[bookingDate],[startTime],[endTime],[room],[status],[payReservationStatus],[examination_status],[description]) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            return "True";
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
            return ex.getMessage();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
    }

    public ExaminationResult FindExaminationResultByID(int appID) throws SQLException {
        String query = "select * from ExaminationResult where id = ?";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, appID);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                ExaminationResult exam = new ExaminationResult();
                exam.setId(rs.getInt("id"));
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
                exam.setPayRevervationStatus(rs.getString("payReservationStatus")); // Đã cập nhật tên cột ở đây
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

    public ExaminationResult checkExaminationResultExist(int appID) throws SQLException {
        String query = "select * from ExaminationResult where appointmentId = ?";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, appID);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                ExaminationResult exam = new ExaminationResult();
                exam.setId(rs.getInt("id"));
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
                exam.setPayRevervationStatus(rs.getString("payReservationStatus")); // Đã cập nhật tên cột ở đây
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

    public ArrayList<ExaminationResult> getAllExaminationResult() throws SQLException {
        String query = "SELECT * FROM ExaminationResult where examination_status = 'inactive'";
        Connection connection = null;
        PreparedStatement statement = null;
        ArrayList<ExaminationResult> examList = new ArrayList<>();
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ExaminationResult exam = new ExaminationResult(); // Tạo đối tượng mới cho mỗi lần lặp
                exam.setAppointmentId(rs.getInt("appointmentId"));
                exam.setId(rs.getInt("id"));
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
                exam.setPayRevervationStatus(rs.getString("payReservationStatus"));
                exam.setExaminationStatus(rs.getString("examination_status"));
                exam.setDescription(rs.getString("description"));
                examList.add(exam); // Thêm đối tượng vào danh sách
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return examList;
    }

    public boolean UpdateExaminationResult(int id, int price, String doctor, int room, String status, String description) throws SQLException {
        String query = "UPDATE ExaminationResult SET price = ?, doctor = ?, room = ?, status = ? , description = ? WHERE id = ?";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, price);
            statement.setString(2, doctor);
            statement.setInt(3, room);
            statement.setString(4, status);
            statement.setString(5, description);
            statement.setInt(6, id);
            statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
    }

    public boolean submitExamination(int id) throws SQLException {
        String query = "UPDATE [dbo].[ExaminationResult] SET [examination_status] = 'active' WHERE [id] = ?";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
    }

    public ArrayList<ExaminationResult> SearchERByKey(String searchKey) throws SQLException{
        String query = "SELECT * FROM  ExaminationResult "
                + "WHERE LOWER(patientName) LIKE '%' + LOWER(?) + '%' "
                + "OR LOWER(doctor) LIKE '%' + LOWER(?) + '%' ";
        ArrayList<ExaminationResult> examinationList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        try{
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, searchKey);
            statement.setString(2, searchKey);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                ExaminationResult exam = new ExaminationResult();
                exam.setAppointmentId(rs.getInt("appointmentId"));
                exam.setId(rs.getInt("id"));
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
                exam.setPayRevervationStatus(rs.getString("payReservationStatus"));
                exam.setExaminationStatus(rs.getString("examination_status"));
                exam.setDescription(rs.getString("description"));
                examinationList.add(exam);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return examinationList;
    }
    
    public static void main(String[] args) {
        try {
            ExaminationDAO dao = new ExaminationDAO();
//            System.out.println(dao.addExaminationResult(2045, 1, "John Doe", "General Checkup",
//                    100, "Dr. Smith", Date.valueOf("2024-07-16"), "09:00", "10:00", 1, "Confirmed", "Paid",
//                    "inactive", "Regular checkup"));;
            ArrayList<ExaminationResult> check = dao.getAllExaminationResult();
            System.out.println(check);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
}
