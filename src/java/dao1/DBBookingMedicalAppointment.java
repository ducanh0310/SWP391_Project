/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao1;

import dal.DBContext;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BookingAppointment;
import model.BookingAppointmentHistory;
import model.Employee;
import model.Patient;
import model.Room;
import model.Service;
import model.Slot;
import model.StatusBook;

/**
 *
 * @author Vu Minh Quan
 */
public class DBBookingMedicalAppointment extends DBContext {

    public DBBookingMedicalAppointment() throws ClassNotFoundException {
        super(); // Calls the constructor of DBContext to initialize the connection
    }

    //Show all slot of a service  
    public ArrayList<Slot> getAllSlot(String idService) {
        ArrayList<Slot> arrSlot = new ArrayList<>();
        try {
            String sql = """
                                     select r.name as room,r.id as rId, e.name as doctor, s.startedTime, s.endTime,  s.id, e.employee_id from Room r
                                     join Procedure_codes pc on pc.procedure_id = r.idService
                                     join Employee e on e.employee_id = pc.doctor_id
                                     join Slot s on pc.procedure_id = s.idService
                                     WHERE s.idService = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, idService);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slot slot = new Slot();
                //Room 
                Room room = new Room();
                room.setName(rs.getString("room"));
                room.setId(rs.getInt("rId"));
                slot.setRoom(room);
                //Employee
                Employee doctor = new Employee();
                doctor.setName(rs.getString("doctor"));
                doctor.setId(rs.getInt("employee_id"));
                slot.setDoctor(doctor);
                //Time slot
                slot.setStartedTime(rs.getTimestamp("startedTime").toLocalDateTime().toLocalTime());
                slot.setEndTime(rs.getTimestamp("endTime").toLocalDateTime().toLocalTime());
                //ID slot
                slot.setId(rs.getInt("id"));

                arrSlot.add(slot);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DBBookingMedicalAppointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arrSlot;
    }

    //Show booked slot
    public ArrayList<Slot> getExistSlot(String idService, Date date) {
        ArrayList<Slot> arrSlot = new ArrayList<>();
        try {
            String sql = """
                         select r.name as room,r.id as rId, e.name as doctor, s.startedTime, s.endTime, s.id, e.employee_id  from Booking_Appointment ba
                         join Room r on r.id = ba.room_id
                         join Employee e on e.employee_id = ba.doctor_id
                         join Slot s on s.id = ba.slot_id
                         where ba.service_id = ? and ba.booking_date = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, idService);
            stm.setDate(2, date);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slot slot = new Slot();
                //Room 
                Room room = new Room();
                room.setId(rs.getInt("rId"));
                room.setName(rs.getString("room"));
                slot.setRoom(room);
                //Employee
                Employee doctor = new Employee();
                doctor.setName(rs.getString("doctor"));
                doctor.setId(rs.getInt("employee_id"));
                slot.setDoctor(doctor);
                //Time slot
                slot.setStartedTime(rs.getTimestamp("startedTime").toLocalDateTime().toLocalTime());
                slot.setEndTime(rs.getTimestamp("endTime").toLocalDateTime().toLocalTime());
                //ID of slot
                slot.setId(rs.getInt("id"));
                arrSlot.add(slot);

            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBookingMedicalAppointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arrSlot;
    }

    //Insert slot
    public void insertSlot(BookingAppointment ba) {
        try {
            String sql = """
                                     INSERT INTO [dbo].[Booking_Appointment]
                                                ([patient_id]
                                                ,[doctor_id]
                                                ,[booking_date]
                                                ,[slot_id]
                                                ,[status_id]
                                                ,[room_id]
                                                ,[service_id])
                                          VALUES
                                                (?
                                                ,?
                                                ,?
                                                ,?
                                                ,?
                                                ,?
                                                ,?)""";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, ba.getPatiendId());
            stm.setInt(2, ba.getDoctorId());
            stm.setDate(3, ba.getBookingDate());
            stm.setInt(4, ba.getSlotId());
            stm.setInt(5, ba.getStatusId());
            stm.setInt(6, ba.getRoomId());
            stm.setInt(7, ba.getServiceId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBBookingMedicalAppointment.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    //Show  booking medical history
    public ArrayList<BookingAppointmentHistory> showBookHistory(int patientId) {
        ArrayList<BookingAppointmentHistory> arrBookHistory = new ArrayList<>();
        try {
            String sql = """
            Select ba.id, ba.patient_id, pc.procedure_name as service, pc.price, e.name as doctor, ba.booking_date, s.startedTime, s.endTime, r.name as room,sb.id as idStatus, sb.name as status from Booking_Appointment ba
               join Procedure_codes pc on pc.procedure_id = ba.service_id
               join Employee e on e.employee_id = ba.doctor_id
               join Slot s on s.id = ba.slot_id
               join Room r on r.id = ba.room_id
               join Status_Book sb on sb.id = ba.status_id
               join Patient p on p.Patient_id = ba.patient_id
               where ba.patient_id = ?""";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, patientId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                BookingAppointmentHistory bah = new BookingAppointmentHistory();
                bah.setID(rs.getInt("id"));
                //Patient
                Patient patient = new Patient();
                patient.setId(rs.getInt("patient_id"));
                bah.setPatient(patient);
                //Service
                Service service = new Service();
                service.setName(rs.getString("service"));
                service.setPrice(rs.getString("price"));
                bah.setService(service);
                //Doctor
                Employee doctor = new Employee();
                doctor.setName(rs.getString("doctor"));
                bah.setDoctor(doctor);
                //Date
                bah.setDate(rs.getDate("booking_date"));
                //Slot
                Slot slot = new Slot();
                slot.setStartedTime(rs.getTimestamp("startedTime").toLocalDateTime().toLocalTime());
                slot.setEndTime(rs.getTimestamp("endTime").toLocalDateTime().toLocalTime());
                slot.setId(rs.getInt("idStatus"));
                bah.setSlot(slot);
                //Room
                Room room = new Room();
                room.setName(rs.getString("room"));
                bah.setRoom(room);
                //Status
                StatusBook statusBook = new StatusBook();
                statusBook.setName(rs.getString("status"));
                bah.setStatusBook(statusBook);
                //add arrayList
                arrBookHistory.add(bah);

            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBookingMedicalAppointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arrBookHistory;
    }

    //Edit appointment
    //Get date and service of appointment
    public BookingAppointmentHistory getDateAppointment(int id) {
        try {
            String sql = """
                            Select ba.booking_date, ba.service_id, pc.procedure_name from Booking_Appointment ba
                            join Procedure_codes pc on pc.procedure_id = ba.service_id
                            where ba.id=?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                BookingAppointmentHistory bAH = new BookingAppointmentHistory();
                bAH.setDate(rs.getDate("booking_date"));
                //Service
                Service service = new Service();
                service.setId(rs.getInt("service_id"));
                service.setName(rs.getString("procedure_name"));
                bAH.setService(service);
                return bAH;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBookingMedicalAppointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    //Update appointment
    public void updateAppointment(BookingAppointment ba){
        try {
            String sql="""
                                   UPDATE [dbo].[Booking_Appointment]
                                      SET [patient_id] = ?
                                         ,[doctor_id] = ?
                                         ,[booking_date] = ?
                                         ,[slot_id] = ?
                                         ,[status_id] = ?
                                         ,[room_id] = ?
                                         ,[service_id] = ?
                                    WHERE [Booking_Appointment].id=?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, ba.getPatiendId());
            stm.setInt(2,ba.getDoctorId());
            stm.setDate(3, ba.getBookingDate());
            stm.setInt(4, ba.getSlotId());
            stm.setInt(5, ba.getStatusId());
            stm.setInt(6,ba.getRoomId());
            stm.setInt(7, ba.getServiceId());
            stm.setInt(8, ba.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBBookingMedicalAppointment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    

    public static void main(String[] args) {
        try {
            DBBookingMedicalAppointment db = new DBBookingMedicalAppointment();
            ArrayList<BookingAppointmentHistory> bah = db.showBookHistory(1);

            for (BookingAppointmentHistory bookingAppointmentHistory : bah) {
                System.out.println(bookingAppointmentHistory.getDate());
                System.out.println(bookingAppointmentHistory.getPatient().getName());
                System.out.println(bookingAppointmentHistory.getDoctor().getName());
                System.out.println(bookingAppointmentHistory.getSlot().getId());
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBBookingMedicalAppointment.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
