/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;


import dao.PatientDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
@WebServlet(name="ViewPatientDetailController", urlPatterns={"/patientDetail"})
public class ViewPatientDetailController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int patientId = Integer.parseInt(request.getParameter("pid"));
            PatientDAO patientView = new PatientDAO();
            PatientGetByIdDTO patients = patientView.getPatient(patientId);
            request.setAttribute("patients", patients);
            request.getRequestDispatcher("viewPatientDetail.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ViewPatientDetailController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
