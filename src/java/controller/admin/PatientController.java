/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.DBEmployeeProfile;
import dao.PatientDAO;
import jakarta.servlet.RequestDispatcher;
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
import model.Employee;
import model.Patient;
import model.PatientGetByIdDTO;
import model.User;

/**
 *
 * @author Gia Huy
 */
@WebServlet("/PatientController")
public class PatientController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("currentUser");
            if (currentUser == null) {
                session.invalidate();
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }
            DBEmployeeProfile dbEm = new DBEmployeeProfile();
            Employee emInfo = dbEm.getInfoEmployee(currentUser.getName());
            String userRole = (String) session.getAttribute("userRole");
            if (userRole.contains("patient") || userRole.isEmpty() || userRole == null) {
                session.invalidate();
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }
            PatientDAO patientList = new PatientDAO();
            ArrayList<PatientGetByIdDTO> patients;
            try {
                patients = patientList.getPatient();
                request.setAttribute("patients", patients);
                // Forward to different JSPs based on the role
                request.setAttribute("emInfo", emInfo);
                request.setAttribute("username", currentUser.getName());
                if (userRole.contains("doctor")) {
                    request.getRequestDispatcher("view/employee/doctor/viewListPatientDoctor.jsp").forward(request, response);
                } else if (userRole.contains("admin")) {

                    request.getRequestDispatcher("viewListPatientAdmin.jsp").forward(request, response);
                } else {
                    // Handle unknown roles
                    response.sendError(HttpServletResponse.SC_FORBIDDEN, "Unauthorized access");
                }
            } catch (SQLException ex) {
                Logger.getLogger(PatientController.class.getName()).log(Level.SEVERE, null, ex);
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PatientController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
