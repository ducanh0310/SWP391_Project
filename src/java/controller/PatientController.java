/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.PatientList;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Patient;

/**
 *
 * @author Gia Huy
 */
public class PatientController extends HttpServlet {

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin leid từ request parameter
        int leid = Integer.parseInt(request.getParameter("leid"));

        PatientList patientList = new PatientList();

        ArrayList<Patient> patients = patientList.getPatient(leid);

        request.setAttribute("patients", patients);

        request.getRequestDispatcher("viewListPatient.jsp").forward(request, response);
    }

}
