
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

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
import model.BookingAppointment;
import model.BookingAppointmentHistory;
import model.User;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name = "ConfirmEditSlotAdminController", urlPatterns = {"/appointment/confirmEditSlot"})
public class ConfirmEditSlotAdminController extends HttpServlet {

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
        if (userRole.contains("patient")) {
            session.invalidate();
            request.getRequestDispatcher("../accessDenied.jsp").forward(request, response);
            return;
        }
        try {
            //Get parameter from server
            String patientId = request.getParameter("patientId");
            String date = request.getParameter("date");
            String service = request.getParameter("idService");
            String doctorId = request.getParameter("idDoctor");
            String slotId = request.getParameter("idSlot");
            String roomId = request.getParameter("idRoom");
            String bookAppointmentId = request.getParameter("id");
            //Insert database
            BookingAppointment ba = new BookingAppointment();
           
            ba.setBookingDate(Date.valueOf(date));
            ba.setServiceId(Integer.parseInt(service));
            ba.setRoomId(Integer.parseInt(roomId));
            ba.setDoctorId(Integer.parseInt(doctorId));
            ba.setPatiendId(new DBBookingMedicalAppointment().getDateAppointmentEmployee(Integer.parseInt(bookAppointmentId)).getPatient().getId());
            ba.setSlotId(Integer.parseInt(slotId));
            ba.setStatusId(1);
            ba.setId(Integer.parseInt(bookAppointmentId));
            DBBookingMedicalAppointment dbBookingMedicalAppointment = new DBBookingMedicalAppointment();
            dbBookingMedicalAppointment.updateAppointment(ba);

            // Xóa tất cả các thuộc tính trong session
//            Enumeration<String> attributeNames = session.getAttributeNames();
//            while (attributeNames.hasMoreElements()) {
//
//                String attributeName = attributeNames.nextElement();
//                if (!attributeName.equals("currentUser")) {
//                    session.removeAttribute(attributeName);
//                }
//
//            }
            //Move view appointment history
            session.setAttribute("successEditAdmin", "Edit appointment successfully");
            response.sendRedirect("viewAppointmentHistory");
        } catch (SQLException ex) {
            Logger.getLogger(ConfirmEditSlotAdminController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
