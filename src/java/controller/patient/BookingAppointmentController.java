/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.patient;

import dao1.DBService;
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
import model.Service;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name="BookingAppointmentController", urlPatterns={"/patient/bookAppointment"})
public class BookingAppointmentController extends HttpServlet {
   
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        try {
            DBService dbService = new DBService();
            ArrayList<Service> arrService = dbService.getService();
            request.setAttribute("arrService", arrService);
            request.getRequestDispatcher("../view/patient/bookAppointment.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BookingAppointmentController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String dateBook = request.getParameter("dateBook");
        String service = request.getParameter("service");
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
