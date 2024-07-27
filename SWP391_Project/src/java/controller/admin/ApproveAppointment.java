/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.DBBookingMedicalAppointment;
import dao.DBEmployeeProfile;
import dao.DBService;
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
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Timer;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BookingAppointmentHistory;
import model.Employee;
import model.Service;
import model.Slot;
import model.User;
import validation.Email;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ApproveAppointment", urlPatterns = {"/appointment/approveAppointment"})
public class ApproveAppointment extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ApproveAppointment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApproveAppointment at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userRole = (String) session.getAttribute("userRole");
        if (userRole == null || userRole.isEmpty()) {
            session.invalidate();
            request.getRequestDispatcher("../index.jsp").forward(request, response);
            return;
        }
        if (userRole.contains("patient")) {
            session.invalidate();
            request.getRequestDispatcher("../accessDenied.jsp").forward(request, response);
            return;
        }
        try {
            User currentUser = (User) session.getAttribute("currentUser");
            if (currentUser == null) {
                session.invalidate();
                request.getRequestDispatcher("../index.jsp").forward(request, response);
                return;
            }
            DBEmployeeProfile dbEm = new DBEmployeeProfile();
            Employee emInfo = dbEm.getInfoEmployee(currentUser.getName());
            //Get parameter
            String idAppointment = request.getParameter("id");
            //Get information from DB
            DBBookingMedicalAppointment db = new DBBookingMedicalAppointment();
            int id = Integer.parseInt(idAppointment);
            db.approveAppointment(id);
            BookingAppointmentHistory ba = db.getAppointmentEmail(id);
            //String to, String username, Date date, String service, String room, LocalTime startTime, LocalTime endTime
            //ba.getPatient().getEmail(),ba.getPatient().getName() , ba.getDate(), ba.getService().getName(), ba.getRoom().getName(), ba.getSlot().getStartedTime(), ba.getSlot().getEndTime()
            Email.sendApproveBookingAppointment(ba.getPatient().getEmail(),ba.getPatient().getName() , ba.getDate(), ba.getService().getName(), ba.getRoom().getName(), ba.getSlot().getStartedTime(), ba.getSlot().getEndTime());
            Timer timer = new Timer();
            session.setAttribute("ApproveSuccess", "Appointment approved successfully");
            timer.schedule(new TimerTask() {
                @Override
                public void run() {
                    session.removeAttribute("ApproveSuccess");
                }
            }, 5000);
            ArrayList<BookingAppointmentHistory> arrBAH = db.showAllBookHistory();

            // Put data into jsp
            request.setAttribute("bookingAppointmentHistory", arrBAH);
            request.setAttribute("emInfo", emInfo);
            request.setAttribute("username", currentUser.getName());
            request.getRequestDispatcher("../view/employee/admin/viewAppointmentHistoryAdmin.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(EditAppointmentAdminController.class.getName()).log(Level.SEVERE, null, ex);
        }
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
