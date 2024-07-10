/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao1;

import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BookingAppointmentHistory;
import model.Service;
import model.Slot;
import model.StatusBook;

/**
 *
 * @author Vu Minh Quan
 */
public class PaymentDAO extends DBContext{

     public PaymentDAO() throws ClassNotFoundException {
        super(); // Calls the constructor of DBContext to initialize the connection
    }
    public int insertPayment(int idAppointment, String money) {
         try {
             String sql = """
                                       INSERT INTO [dbo].[ReservationFee]
                                                  ([appointment_id]
                                                  ,[amount]
                                                  ,[payment_type])
                                            VALUES
                                                  (?
                                                  ,?
                                                  ,?)""";
             PreparedStatement stm = connection.prepareStatement(sql);
             stm.setInt(1, idAppointment);
             stm.setString(2, money);
             stm.setString(3, "Bank account");
             stm.executeUpdate();
             
             String sqlUpdate="""
                              UPDATE [dbo].[Booking_Appointment]
                                 SET [payReservationStatus] = ?
                               WHERE [Booking_Appointment].id=?""";
             PreparedStatement stm1 = connection.prepareStatement(sqlUpdate);
             stm1.setString(1, "Pay reser");
             stm1.setInt(2, idAppointment);
             stm1.executeUpdate();
         } catch (SQLException ex) {
             Logger.getLogger(PaymentDAO.class.getName()).log(Level.SEVERE, null, ex);
         }
         return 1;
    }
    
    //check to identify: can pay?
    public ArrayList<BookingAppointmentHistory> paymentPersonalSlot(int idAppointment){
        ArrayList<BookingAppointmentHistory> arrBA= new ArrayList<>();
         try {
             String sql="select ba.id, ba.booking_date, ba.service_id, ba.slot_id, ba.payReservationStatus, ba.status_id from Booking_Appointment ba where ba.id=?";
             PreparedStatement stm = connection.prepareStatement(sql);
             stm.setInt(1, idAppointment);
             ResultSet rs = stm.executeQuery();
             while(rs.next()){
                 BookingAppointmentHistory bAH= new BookingAppointmentHistory();
                 bAH.setID(rs.getInt("id"));
                 bAH.setDate(rs.getDate("booking_date"));
                
                 bAH.setReservationStatus(rs.getString("payReservationStatus"));
                 //Service
                 Service service = new Service();
                 service.setId(rs.getInt("service_id"));
                 bAH.setService(service);
                 //Slot
                 Slot slot = new Slot();
                 slot.setId(rs.getInt("slot_id"));
                 
                 bAH.setSlot(slot);
                
                 
                 arrBA.add(bAH);
                 
             }
         } catch (SQLException ex) {
             Logger.getLogger(PaymentDAO.class.getName()).log(Level.SEVERE, null, ex);
         }
         return arrBA;
    }
    
    //check to identify: can pay?
    public ArrayList<BookingAppointmentHistory> paymentAllSlot(int idAppointment){
        ArrayList<BookingAppointmentHistory> arrBA= new ArrayList<>();
         try {
             String sql="select ba.id, ba.booking_date, ba.service_id, ba.slot_id, ba.payReservationStatus, ba.status_id from Booking_Appointment ba";
             PreparedStatement stm = connection.prepareStatement(sql);
             ResultSet rs = stm.executeQuery();
             while(rs.next()){
                 BookingAppointmentHistory bAH= new BookingAppointmentHistory();
                 bAH.setID(rs.getInt("id"));
                 bAH.setDate(rs.getDate("booking_date"));
                 bAH.setReservationStatus(rs.getString("payReservationStatus"));
                 //Service
                 Service service = new Service();
                 service.setId(rs.getInt("service_id"));
                 bAH.setService(service);
                 //Slot
                 Slot slot = new Slot();
                 slot.setId(rs.getInt("slot_id"));
                 bAH.setSlot(slot);
                  //Status book
                 StatusBook statusBook = new StatusBook();
                 statusBook.setId(rs.getInt("status_id"));
                 bAH.setStatusBook(statusBook);
                 
                 arrBA.add(bAH);
                 
             }
         } catch (SQLException ex) {
             Logger.getLogger(PaymentDAO.class.getName()).log(Level.SEVERE, null, ex);
         }
         return arrBA;
    }

}
