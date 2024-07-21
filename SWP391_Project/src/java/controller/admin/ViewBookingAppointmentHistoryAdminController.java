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
<<<<<<< HEAD:SWP391_Project/src/java/controller/admin/ViewBookingAppointmentHistoryAdminController.java
        HttpSession session = request.getSession(false); // get existing session if exists
        if (session == null) {
            response.sendRedirect("../login");
            return;
        }

        String userRole = (String) session.getAttribute("userRole");
        if (userRole == null || "patient".equals(userRole)) {
            // Redirect to error page or home page if userRole is patient or userRole is null
            response.sendRedirect("../accessDenied.jsp"); // You can change this to a relevant page
=======
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
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/controller/admin/ViewBookingAppointmentHistoryAdminController.java
            return;
        }
        try {
            User currentUser = (User) session.getAttribute("currentUser");
            if (currentUser == null) {
                session.invalidate();
<<<<<<< HEAD:SWP391_Project/src/java/controller/admin/ViewBookingAppointmentHistoryAdminController.java
                response.sendRedirect("../accessDenied.jsp"); // You can change this to a relevant page
=======
                request.getRequestDispatcher("../index.jsp").forward(request, response);
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/controller/admin/ViewBookingAppointmentHistoryAdminController.java
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
<<<<<<< HEAD:SWP391_Project/src/java/controller/admin/ViewBookingAppointmentHistoryAdminController.java
                if (userRole.contains("admin")) {
                    request.getRequestDispatcher("../view/employee/admin/viewAppointmentHistoryAdmin.jsp").forward(request, response);
                }
                if (userRole.contains("doctor")) {
                    request.getRequestDispatcher("../view/employee/doctor/viewAppointmentHistoryDoctor.jsp").forward(request, response);
                }
                if (userRole.contains("nurse")) {
                    request.getRequestDispatcher("../view/employee/nurse/viewAppointmentHistoryNurse.jsp").forward(request, response);
                }
=======
                request.getRequestDispatcher("../view/employee/admin/viewAppointmentHistoryAdmin.jsp").forward(request, response);
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/controller/admin/ViewBookingAppointmentHistoryAdminController.java

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
