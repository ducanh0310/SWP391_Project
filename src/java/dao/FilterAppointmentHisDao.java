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
import model.BookingAppointmentHistory;
import model.Employee;
import model.Room;
import model.Service;
import model.StatusBook;

/**
 *
 * @author Vu Minh Quan
 */
public class FilterAppointmentHisDao extends DBContext {

    public FilterAppointmentHisDao() throws ClassNotFoundException {
        super(); // Calls the constructor of DBContext to initialize the connection
    }

    public ArrayList<BookingAppointmentHistory> getService(int id) throws SQLException {
        ArrayList<BookingAppointmentHistory> arrService = new ArrayList<>();
        String sql = """
                         SELECT DISTINCT pc.procedure_name 
                                              FROM Booking_Appointment ba 
                                              JOIN Procedure_codes pc ON pc.procedure_id = ba.service_id 
                                              JOIN Employee e ON e.employee_id = ba.doctor_id 
                                              JOIN Slot s ON s.id = ba.slot_id 
                                              JOIN Room r ON r.id = ba.room_id 
                                              JOIN Status_Book sb ON sb.id = ba.status_id 
                                              JOIN Patient p ON p.Patient_id = ba.patient_id 
                                              WHERE ba.patient_id = ?""";
        Connection connection = null;
        PreparedStatement stm = null;

        try {
            connection = getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                BookingAppointmentHistory bah = new BookingAppointmentHistory();
                Service service = new Service();
                service.setName(rs.getString("procedure_name"));
                bah.setService(service);
                arrService.add(bah);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FilterAppointmentHisDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(stm);
            closeConnection(connection);
        }
        return arrService;

    }

    public ArrayList<BookingAppointmentHistory> getDoctor(int id) throws SQLException {
        ArrayList<BookingAppointmentHistory> arrDoctor = new ArrayList<>();
        String sql = """
                         SELECT DISTINCT e.name AS doctor
                                              FROM Booking_Appointment ba 
                                              JOIN Procedure_codes pc ON pc.procedure_id = ba.service_id 
                                              JOIN Employee e ON e.employee_id = ba.doctor_id 
                                              JOIN Slot s ON s.id = ba.slot_id 
                                              JOIN Room r ON r.id = ba.room_id 
                                              JOIN Status_Book sb ON sb.id = ba.status_id 
                                              JOIN Patient p ON p.Patient_id = ba.patient_id 
                                              WHERE ba.patient_id = ?""";

        Connection connection = null;
        PreparedStatement stm = null;
        try {
            connection = getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                BookingAppointmentHistory bah = new BookingAppointmentHistory();
                Employee doctor1 = new Employee();
                doctor1.setName(rs.getString("doctor"));
                bah.setDoctor(doctor1);
                arrDoctor.add(bah);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FilterAppointmentHisDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(stm);
            closeConnection(connection);
        }
        return arrDoctor;
    }

    public ArrayList<BookingAppointmentHistory> getPrice(int id) throws SQLException {
        ArrayList<BookingAppointmentHistory> arrPrice = new ArrayList<>();
        String sql = """
                         SELECT DISTINCT pc.price
                                              FROM Booking_Appointment ba 
                                              JOIN Procedure_codes pc ON pc.procedure_id = ba.service_id 
                                              JOIN Employee e ON e.employee_id = ba.doctor_id 
                                              JOIN Slot s ON s.id = ba.slot_id 
                                              JOIN Room r ON r.id = ba.room_id 
                                              JOIN Status_Book sb ON sb.id = ba.status_id 
                                              JOIN Patient p ON p.Patient_id = ba.patient_id 
                                              WHERE ba.patient_id = ?""";
        Connection connection = null;
        PreparedStatement stm = null;
        try {
            connection = getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                BookingAppointmentHistory bah = new BookingAppointmentHistory();
                Service service = new Service();
                service.setPrice(rs.getString("price"));
                bah.setService(service);
                arrPrice.add(bah);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FilterAppointmentHisDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(stm);
            closeConnection(connection);
        }

        return arrPrice;
    }

    public ArrayList<BookingAppointmentHistory> getPay(int id) throws SQLException {
        ArrayList<BookingAppointmentHistory> arrPay = new ArrayList<>();
        String sql = """
                         SELECT DISTINCT ba.payReservationStatus
                                              FROM Booking_Appointment ba 
                                              JOIN Procedure_codes pc ON pc.procedure_id = ba.service_id 
                                              JOIN Employee e ON e.employee_id = ba.doctor_id 
                                              JOIN Slot s ON s.id = ba.slot_id 
                                              JOIN Room r ON r.id = ba.room_id 
                                              JOIN Status_Book sb ON sb.id = ba.status_id 
                                              JOIN Patient p ON p.Patient_id = ba.patient_id 
                                              WHERE ba.patient_id = ?""";

        Connection connection = null;
        PreparedStatement stm = null;
        try {
            connection = getConnection();
            stm = connection.prepareStatement(sql);

            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                BookingAppointmentHistory bah = new BookingAppointmentHistory();
                bah.setReservationStatus(rs.getString("payReservationStatus"));
                arrPay.add(bah);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FilterAppointmentHisDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(stm);
            closeConnection(connection);
        }

        return arrPay;
    }

    public ArrayList<BookingAppointmentHistory> getDate(int id) throws SQLException {
        ArrayList<BookingAppointmentHistory> arrDate = new ArrayList<>();
        String sql = """
                         SELECT DISTINCT ba.booking_date
                                              FROM Booking_Appointment ba 
                                              JOIN Procedure_codes pc ON pc.procedure_id = ba.service_id 
                                              JOIN Employee e ON e.employee_id = ba.doctor_id 
                                              JOIN Slot s ON s.id = ba.slot_id 
                                              JOIN Room r ON r.id = ba.room_id 
                                              JOIN Status_Book sb ON sb.id = ba.status_id 
                                              JOIN Patient p ON p.Patient_id = ba.patient_id 
                                              WHERE ba.patient_id = ?""";
        Connection connection = null;
        PreparedStatement stm = null;
        try {
            connection = getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                BookingAppointmentHistory bah = new BookingAppointmentHistory();
                bah.setDate(rs.getDate("booking_date"));
                arrDate.add(bah);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FilterAppointmentHisDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(stm);
            closeConnection(connection);
        }

        return arrDate;
    }

    public ArrayList<BookingAppointmentHistory> getRoom(int id) throws SQLException {
        ArrayList<BookingAppointmentHistory> arrRoom = new ArrayList<>();
        String sql = """
                         SELECT DISTINCT r.name
                                              FROM Booking_Appointment ba 
                                              JOIN Procedure_codes pc ON pc.procedure_id = ba.service_id 
                                              JOIN Employee e ON e.employee_id = ba.doctor_id 
                                              JOIN Slot s ON s.id = ba.slot_id 
                                              JOIN Room r ON r.id = ba.room_id 
                                              JOIN Status_Book sb ON sb.id = ba.status_id 
                                              JOIN Patient p ON p.Patient_id = ba.patient_id 
                                              WHERE ba.patient_id = ?""";
        Connection connection = null;
        PreparedStatement stm = null;

        try {
            connection = getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                BookingAppointmentHistory bah = new BookingAppointmentHistory();
                Room room = new Room();
                room.setName(rs.getString("name"));
                bah.setRoom(room);
                arrRoom.add(bah);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FilterAppointmentHisDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(stm);
            closeConnection(connection);
        }

        return arrRoom;
    }

    public ArrayList<BookingAppointmentHistory> getStatus(int id) {
        ArrayList<BookingAppointmentHistory> arrStatus = new ArrayList<>();
        String sql = """
                         SELECT DISTINCT sb.name
                                              FROM Booking_Appointment ba 
                                              JOIN Procedure_codes pc ON pc.procedure_id = ba.service_id 
                                              JOIN Employee e ON e.employee_id = ba.doctor_id 
                                              JOIN Slot s ON s.id = ba.slot_id 
                                              JOIN Room r ON r.id = ba.room_id 
                                              JOIN Status_Book sb ON sb.id = ba.status_id 
                                              JOIN Patient p ON p.Patient_id = ba.patient_id 
                                              WHERE ba.patient_id = ?""";
        Connection connection = null;
        PreparedStatement stm = null;
        try {
            connection = getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                BookingAppointmentHistory bah = new BookingAppointmentHistory();
                StatusBook statusBook = new StatusBook();
                statusBook.setName(rs.getString("name"));
                bah.setStatusBook(statusBook);
                arrStatus.add(bah);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FilterAppointmentHisDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return arrStatus;
    }
}
