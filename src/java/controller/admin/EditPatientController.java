/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.PatientViewDB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import model.HistoryAdmin;
import model.Patient;
import model.PatientRecords;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author Gia Huy
 */
@WebServlet(name = "EditPatientController", urlPatterns = {"/editPatient"})
public class EditPatientController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int patientId = Integer.parseInt(request.getParameter("pid"));
            PatientViewDB patientView = new PatientViewDB();
            Patient patients = patientView.getPatient(patientId);
            HistoryAdmin history = patientView.getHistory(patientId);
            request.setAttribute("id", patientId);
            request.setAttribute("patients", patients);
            request.setAttribute("history", history);
            request.getRequestDispatcher("editPatientDetail.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int patientId = Integer.parseInt(request.getParameter("Patient_id"));
            Patient p = new Patient();

            p.setId(patientId);
            p.setSin(request.getParameter("patient_sin"));
            p.setAddress(request.getParameter("address"));
            p.setName(request.getParameter("name"));
            p.setGender(request.getParameter("gender"));
            p.setEmail(request.getParameter("email"));
            p.setPhone(request.getParameter("phone"));
            p.setDob(Date.valueOf(request.getParameter("date_of_birth")));

            
            // Create an instance of PatientViewDB
            PatientViewDB patientViewDB = new PatientViewDB();

            // Call the editInfoPatient method to update the patient info
            patientViewDB.editInfoPatient(p);
            // Redirect to a confirmation or another page
            response.sendRedirect("patientDetail?pid=" + p.getId());
        } catch (Exception e) {

            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }
}
