/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.patient;

import dao1.DBBookingMedicalAppointment;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BookingAppointmentHistory;
import model.User;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name = "ViewBookingAppointmentHistoryController", urlPatterns = {"/patient/viewAppointmentHistory"})
public class ViewBookingAppointmentHistoryController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        try {
            // Log to see if method is called
            Logger.getLogger(TempController.class.getName()).log(Level.INFO, "Before calling showBookHistory");

            // Take booking appointment history
            DBBookingMedicalAppointment db = new DBBookingMedicalAppointment();
            ArrayList<BookingAppointmentHistory> arrBAH = db.showBookHistory(Integer.parseInt(currentUser.getPatient_Id()));

            // Log to confirm method call completion
            Logger.getLogger(TempController.class.getName()).log(Level.INFO, "After calling showBookHistory");

            // Put data into jsp
            request.setAttribute("bookingAppointmentHistory", arrBAH);
            request.getRequestDispatcher("../view/patient/viewAppointmentHistory.jsp").forward(request, response);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TempController.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, ex.getMessage());
        }
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
