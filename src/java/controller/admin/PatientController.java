/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

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
import model.Patient;
import model.PatientGetByIdDTO;

/**
 *
 * @author Gia Huy
 */
@WebServlet("/PatientController")
public class PatientController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
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
            request.getRequestDispatcher("viewListPatient.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PatientController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
