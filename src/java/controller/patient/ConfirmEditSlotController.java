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
import java.sql.Date;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BookingAppointment;
import model.BookingAppointmentHistory;
import model.User;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name = "ConfirmEditSlotController", urlPatterns = {"/patient/confirmEditSlot"})
public class ConfirmEditSlotController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        try {
            //Get parameter from server
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
            ba.setPatiendId(Integer.parseInt(currentUser.getPatient_Id()));
            ba.setSlotId(Integer.parseInt(slotId));
            ba.setStatusId(1);
            ba.setId(Integer.parseInt(bookAppointmentId));
            DBBookingMedicalAppointment dbBookingMedicalAppointment = new DBBookingMedicalAppointment();
            dbBookingMedicalAppointment.updateAppointment(ba);

            //Move view appointment history
            session.setAttribute("success", "Edit appointment successfully");
            response.sendRedirect("viewAppointmentHistory");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConfirmSlotController.class.getName()).log(Level.SEVERE, null, ex);
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
