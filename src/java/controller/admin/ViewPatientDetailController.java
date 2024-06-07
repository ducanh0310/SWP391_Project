/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;


import dao1.PatientDAO;
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
@WebServlet(name="ViewPatientDetailController", urlPatterns={"/patientDetail"})
public class ViewPatientDetailController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int patientId = Integer.parseInt(request.getParameter("pid"));
        PatientDAO patientView = new PatientDAO();
        ArrayList<Patient> patients = patientView.getPatient(patientId);
        request.setAttribute("patients", patients);
        request.getRequestDispatcher("viewPatientDetail.jsp").forward(request, response);
    }
}
