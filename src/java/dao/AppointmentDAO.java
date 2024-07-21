/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Service.IAppointmentDAO;
import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AppointmentDTO;

/**
 *
 * @author trung
 */
public class AppointmentDAO extends DBContext implements IAppointmentDAO{
    public ArrayList<AppointmentDTO> getAppointment() {
        ArrayList<AppointmentDTO> appointmentList = new ArrayList<>();
        String query = "Select ba.id, ba.patient_id, p.name, pc.procedure_name as service, pc.price, e.name as doctor, ba.booking_date, s.startedTime, s.endTime, r.name as room,sb.id as idStatus, sb.name as status, ba.payReservationStatus from Booking_Appointment ba\n" +
"                           join Procedure_codes pc on pc.procedure_id = ba.service_id\n" +
"                           join Employee e on e.employee_id = ba.doctor_id\n" +
"                           join Slot s on s.id = ba.slot_id\n" +
"                           join Room r on r.id = ba.room_id\n" +
"                           join Status_Book sb on sb.id = ba.status_id\n" +
"                           join Patient p on p.Patient_id = ba.patient_id\n" +
"                             ORDER BY ba.id DESC;";
        Connection connection = null;
        PreparedStatement statement = null;
        try{
            connection = getConnection();
            statement = connection.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                AppointmentDTO appointment = new AppointmentDTO();
                appointment.setId(rs.getInt("id"));
                appointment.setPatientId(rs.getInt("patient_id"));
                appointment.setPatientName(rs.getString("name"));
                appointment.setService(rs.getString("service"));
                appointment.setPrice(rs.getInt("price"));
                appointment.setDoctor(rs.getString("doctor"));
                appointment.setBookingDate(rs.getDate("booking_date"));
                appointment.setStartTime(rs.getString("startedTime"));
                appointment.setEndTime(rs.getString("endTime"));
                appointment.setRoom (rs.getInt("room"));
                appointment.setIdStatus(rs.getInt("idStatus"));
                appointment.setStatus(rs.getString("status"));
                appointment.setPayRevervationStatus(rs.getString("payReservationStatus"));
                appointmentList.add(appointment);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                closePreparedStatement(statement);
                closeConnection(connection);
            } catch (SQLException ex) {
                Logger.getLogger(AppointmentDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return appointmentList;
    }
    
    public AppointmentDTO getAppointmentDTOById(int searchKey) throws SQLException{
        String query = "Select ba.id, ba.patient_id, p.name, pc.procedure_name as service, pc.price, e.name as doctor, ba.booking_date, s.startedTime, s.endTime, r.name as room,sb.id as idStatus, sb.name as status, ba.payReservationStatus from Booking_Appointment ba\n" +
"                           join Procedure_codes pc on pc.procedure_id = ba.service_id\n" +
"                           join Employee e on e.employee_id = ba.doctor_id\n" +
"                           join Slot s on s.id = ba.slot_id\n" +
"                           join Room r on r.id = ba.room_id\n" +
"                           join Status_Book sb on sb.id = ba.status_id\n" +
"                           join Patient p on p.Patient_id = ba.patient_id\n" +
"						   where ba.id = ?\n" +
"                             ORDER BY ba.id DESC;";
        Connection connection = null;
        PreparedStatement statement = null;
        try{
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, searchKey);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                AppointmentDTO appointment = new AppointmentDTO();
                appointment.setId(rs.getInt("id"));
                appointment.setPatientId(rs.getInt("patient_id"));
                appointment.setPatientName(rs.getString("name"));
                appointment.setService(rs.getString("service"));
                appointment.setPrice(rs.getInt("price"));
                appointment.setDoctor(rs.getString("doctor"));
                appointment.setBookingDate(rs.getDate("booking_date"));
                appointment.setStartTime(rs.getString("startedTime"));
                appointment.setEndTime(rs.getString("endTime"));
                appointment.setRoom (rs.getInt("room"));
                appointment.setIdStatus(rs.getInt("idStatus"));
                appointment.setStatus(rs.getString("status"));
                appointment.setPayRevervationStatus(rs.getString("payReservationStatus"));
                return appointment;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return null;
    }
    
    public static void main(String[] args) {
        AppointmentDAO dao = new AppointmentDAO();
        ArrayList<AppointmentDTO> list = dao .getAppointment();
        System.out.println(list);
    }
}