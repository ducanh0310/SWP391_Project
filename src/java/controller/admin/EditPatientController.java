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
        Patient p = new Patient();
        PatientRecords pa = new PatientRecords();
        HistoryAdmin h = new HistoryAdmin();
        p.setId(Integer.parseInt(request.getParameter("Patient_id")));
        p.setSin(request.getParameter("patient_sin"));
        p.setAddress(request.getParameter("address"));
        p.setName(request.getParameter("name"));
        p.setGender(request.getParameter("gender"));
        p.setEmail(request.getParameter("email"));
        p.setPhone(request.getParameter("phone"));
        p.setDob(Date.valueOf(request.getParameter("date_of_birth")));
        p.setInsurance(request.getParameter("insurance"));
        p.setRep_id(Integer.parseInt(request.getParameter("rep_id")));
        h.setDop(Date.valueOf(request.getParameter("date_of_procedure")));
        h.setAppointment_description(request.getParameter("appointment_description"));
        pa.setPatient_details(request.getParameter("patient_details"));
        h.setPatient_details(pa);
        h.setPatient_charge(Double.parseDouble(request.getParameter("patient_charge")));
        h.setInsurance_charge(Double.parseDouble(request.getParameter("insurance_charge")));
        h.setTotal_charge(Double.parseDouble(request.getParameter("total_charge")));
        
        // Thực hiện lưu thông tin vào cơ sở dữ liệu ở đây
        // ...
        // ...

        // Sau khi lưu thành công, chuyển hướng về trang editPatientDetail.jsp
        response.sendRedirect("editPatientDetail.jsp");
    } catch (Exception e) {
        request.getRequestDispatcher("errorPage.jsp").forward(request, response);
    }
}
}
