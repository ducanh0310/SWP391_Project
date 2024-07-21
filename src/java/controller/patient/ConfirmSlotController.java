/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.patient;

import dao.DBBookingMedicalAppointment;
import dao.PatientDAO;
import dao.RoomDAO;
import dao.ServiceDAO;
import dao.SlotDAO;
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
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Timer;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BookingAppointment;
import model.Patient;
import model.PatientGetByIdDTO;
import model.ProcedureCodes;
import model.Slot;
import model.User;
import validation.Email;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name = "ConfirmSlotController", urlPatterns = {"/patient/confirmSlot"})
public class ConfirmSlotController extends HttpServlet {

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
            // Assuming maximum 10 slots to simplify. Adjust as needed.
            int maxSlots = 10;
            ArrayList<BookingAppointment> appointments = new ArrayList<>();

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

                // Check if slotId is null to determine if there are no more slots
                if (slotId == null) {
                    break;
                }

                // Create and populate BookingAppointment object
                BookingAppointment ba = new BookingAppointment();
                ba.setSlotId(Integer.parseInt(slotId));
                ba.setDoctorId(Integer.parseInt(doctorId));
                ba.setRoomId(Integer.parseInt(roomId));
                ba.setBookingDate(Date.valueOf(date));
                ba.setServiceId(Integer.parseInt(serviceId));
                ba.setPatiendId(Integer.parseInt(currentUser.getPatient_Id()));
                ba.setStatusId(1); // Assuming 1 represents some kind of default status

                appointments.add(ba);
            }

            // Insert each appointment into the database
            DBBookingMedicalAppointment dbBookingMedicalAppointment = new DBBookingMedicalAppointment();
            for (BookingAppointment appointment : appointments) {
                dbBookingMedicalAppointment.insertSlot(appointment);
            }

            session.setAttribute("payNotification", "***Your appointment is verified when you pay the reservation fee by clicking on 'Pay' button.***");
            session.setAttribute("bookSuccess", "Appointments booked successfully");
            // Schedule a task to remove the session attribute after 5 seconds
            Timer timer = new Timer();
            timer.schedule(new TimerTask() {
                @Override
                public void run() {
                    session.removeAttribute("bookSuccess");
                }
            }, 5000);
            response.sendRedirect("viewAppointmentHistory");
        } catch (SQLException ex) {
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
