/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.PatientList;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Patient;

/**
 *
 * @author Gia Huy
 */
@WebServlet("/PatientController")
public class PatientController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            PatientList patientList = new PatientList();
            ArrayList<Patient> patients = patientList.getPatient();
            request.setAttribute("patients", patients);
            request.getRequestDispatcher("viewListPatient.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }

}
