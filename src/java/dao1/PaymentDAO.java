/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao1;

import dal.DBContext;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

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

}
