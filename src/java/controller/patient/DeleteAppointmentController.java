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
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name = "DeleteAppointmentController", urlPatterns = {"/patient/deleteAppointment"})
public class DeleteAppointmentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            String id = request.getParameter("idDelete");
           
            DBBookingMedicalAppointment db = new DBBookingMedicalAppointment();
            db.cancelledAppointment(Integer.parseInt(id), 4);

            // Xóa tất cả các thuộc tính trong session
            Enumeration<String> attributeNames = session.getAttributeNames();
            while (attributeNames.hasMoreElements()) {
                
                String attributeName = attributeNames.nextElement();
                if(!attributeName.equals("currentUser")){
                    session.removeAttribute(attributeName);
                }
                
            }

            session.setAttribute("deleteSuccess", "Appointment cancelled successfully");
            response.sendRedirect("viewAppointmentHistory");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DeleteAppointmentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
