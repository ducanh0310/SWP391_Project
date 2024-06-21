/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.PatientViewDB;
import java.io.IOException;
import jakarta.servlet.ServletException;
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
            request.getRequestDispatcher("viewPatientDetail.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }

}
