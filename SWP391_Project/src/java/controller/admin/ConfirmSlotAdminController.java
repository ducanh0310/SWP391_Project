/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import controller.patient.ConfirmSlotController;
import dao.DBBookingMedicalAppointment;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name="ConfirmSlotAdminController", urlPatterns={"/ConfirmSlotAdminController"})
public class ConfirmSlotAdminController extends HttpServlet {
   
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        String userRole = (String) session.getAttribute("userRole");
        if (userRole == null || userRole.isEmpty()) {
            session.invalidate();
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }
        if (currentUser == null) {
            session.invalidate();
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }
        try {
            // Assuming maximum 10 slots to simplify. Adjust as needed.
            int maxSlots = 10;
            ArrayList<model.BookingAppointment> appointments = new ArrayList<>();

            for (int i = 0; i < maxSlots; i++) {
                String slotIdParam = "slots[" + i + "][slotId]";
                String doctorIdParam = "slots[" + i + "][doctorId]";
                String roomIdParam = "slots[" + i + "][roomId]";
                String dateParam = "slots[" + i + "][date]";
                String serviceIdParam = "slots[" + i + "][serviceId]";

                String slotId = request.getParameter(slotIdParam);
                String doctorId = request.getParameter(doctorIdParam);
                String roomId = request.getParameter(roomIdParam);
                String date = request.getParameter(dateParam);
                String serviceId = request.getParameter(serviceIdParam);
                String paID = request.getParameter("paID");
                // Check if slotId is null to determine if there are no more slots
                if (slotId == null) {
                    break;
                }

                // Create and populate BookingAppointment object
                model.BookingAppointment ba = new model.BookingAppointment();
                ba.setSlotId(Integer.parseInt(slotId));
                ba.setDoctorId(Integer.parseInt(doctorId));
                ba.setRoomId(Integer.parseInt(roomId));
                ba.setBookingDate(Date.valueOf(date));
                ba.setServiceId(Integer.parseInt(serviceId));
                ba.setPatiendId(Integer.parseInt(paID));
                ba.setStatusId(1); // Assuming 1 represents some kind of default status

                appointments.add(ba);
            }

            // Insert each appointment into the database
            DBBookingMedicalAppointment dbBookingMedicalAppointment = new DBBookingMedicalAppointment();
            for (model.BookingAppointment appointment : appointments) {
                dbBookingMedicalAppointment.insertSlot(appointment);
            }

            // Clear session attributes except 'currentUser'
            Enumeration<String> attributeNames = session.getAttributeNames();
            while (attributeNames.hasMoreElements()) {
                String attributeName = attributeNames.nextElement();
                if (!attributeName.equals("currentUser") && !attributeName.equals("userRole")) {
                    session.removeAttribute(attributeName);
                }
            }

            if (userRole.contains("admin")) {
                response.sendRedirect("appointment/viewAppointmentHistory");

            } else {
                session.invalidate();
                request.getRequestDispatcher("accessDenied.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ConfirmSlotController.class.getName()).log(Level.SEVERE, null, ex);
        }
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