/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.payment;

import dao1.PaymentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BookingAppointmentHistory;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name="choosePaymentController", urlPatterns={"/choosePayment"})
public class choosePaymentController extends HttpServlet {
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            PaymentDAO db = new PaymentDAO();
            
            String idApppointment = request.getParameter("id");
            int id = Integer.parseInt(idApppointment);
            ArrayList<BookingAppointmentHistory> paymentPersonalSlot = db.paymentPersonalSlot(id);
            ArrayList<BookingAppointmentHistory> paymentAllSlot = db.paymentAllSlot(id);
            boolean flag = false;
            for (BookingAppointmentHistory allSlot : paymentAllSlot) {
                for (BookingAppointmentHistory onlySlot : paymentPersonalSlot) {
                    if(allSlot.getDate().equals(onlySlot.getDate()) && allSlot.getService().getId() == onlySlot.getService().getId() && allSlot.getSlot().getId() == onlySlot.getSlot().getId()
                            && !(allSlot.getReservationStatus().equals(onlySlot.getReservationStatus()))){
                        
                        flag=true;
                        break;
                    }
                }
            }
            
            if(flag){
                request.setAttribute("announce", "***Booked slot. Reason: May be you pay slow reservation fee.***");
                request.getRequestDispatcher("view/payment/notification.jsp").forward(request, response);
            }
            
            request.getRequestDispatcher("view/payment/vnpay_pay.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(choosePaymentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
