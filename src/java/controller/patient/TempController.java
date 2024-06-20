/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.patient;

import dao1.DBBookingMedicalAppointment;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name="TempController", urlPatterns={"/patient/TempController"})
public class TempController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
 
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       
       try {
           // Log to see if method is called
           Logger.getLogger(TempController.class.getName()).log(Level.INFO, "Before calling showBookHistory");

           // Take booking appointment history
           DBBookingMedicalAppointment db = new DBBookingMedicalAppointment();
           ArrayList<BookingAppointmentHistory> arrBAH = db.showBookHistory(1);

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

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
