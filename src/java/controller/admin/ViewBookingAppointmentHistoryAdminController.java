/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.DBBookingMedicalAppointment;
import dao.DBEmployeeProfile;
import java.io.IOException;
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
@WebServlet(name = "ViewBookingAppointmentHistoryAdminController", urlPatterns = {"/appointment/viewAppointmentHistory"})
public class ViewBookingAppointmentHistoryAdminController extends HttpServlet {

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
        //Decentralize to admin, doctor, nurse
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
            try {

                // Take booking appointment history
                DBBookingMedicalAppointment db = new DBBookingMedicalAppointment();
                ArrayList<BookingAppointmentHistory> arrBAH = db.showAllBookHistory();

                // Put data into jsp
                request.setAttribute("bookingAppointmentHistory", arrBAH);
                request.setAttribute("emInfo", emInfo);
                request.setAttribute("username", currentUser.getName());
                if (userRole.contains("admin")) {
                    request.getRequestDispatcher("../view/employee/admin/viewAppointmentHistoryAdmin.jsp").forward(request, response);
                }
                if (userRole.contains("doctor")) {
                    request.getRequestDispatcher("../view/employee/doctor/viewAppointmentHistoryDoctor.jsp").forward(request, response);
                }
                if (userRole.contains("nurse")) {
                    request.getRequestDispatcher("../view/employee/nurse/viewAppointmentHistoryNurse.jsp").forward(request, response);
                }

            } catch (SQLException ex) {
                Logger.getLogger(ViewBookingAppointmentHistoryAdminController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ViewBookingAppointmentHistoryAdminController.class.getName()).log(Level.SEVERE, null, ex);
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
