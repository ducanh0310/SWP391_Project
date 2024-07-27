/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.DBBookingMedicalAppointment;
import dao.DBEmployeeProfile;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BookingAppointmentHistory;
import model.Employee;
import model.User;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name = "PayController", urlPatterns = {"/PayController"})
public class PayController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userRole = (String) session.getAttribute("userRole");
        if (userRole == null || userRole.isEmpty()) {
            session.invalidate();
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }
        if (userRole.contains("patient")) {
            session.invalidate();
            request.getRequestDispatcher("accessDenied.jsp").forward(request, response);
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
            db.payAppointment(id);
            ArrayList<BookingAppointmentHistory> arrBAH = db.showAllBookHistory();

            // Put data into jsp
            request.setAttribute("bookingAppointmentHistory", arrBAH);
            request.setAttribute("emInfo", emInfo);
            request.setAttribute("username", currentUser.getName());
            request.getRequestDispatcher("view/employee/admin/viewAppointmentHistoryAdmin.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(EditAppointmentAdminController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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