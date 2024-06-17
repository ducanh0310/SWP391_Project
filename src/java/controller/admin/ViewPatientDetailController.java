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
import model.HistoryAdmin;
import model.Patient;

/**
 *
 * @author Gia Huy
 */
public class ViewPatientDetailController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int patientId = Integer.parseInt(request.getParameter("pid"));
        PatientViewDB patientView = new PatientViewDB();
        Patient patients = patientView.getPatient(patientId);
        HistoryAdmin history = patientView.getHistory(patientId);
        request.setAttribute("history", history);
        request.setAttribute("patients", patients);
        request.getRequestDispatcher("viewPatientDetail.jsp").forward(request, response);
    }
    
    
}
