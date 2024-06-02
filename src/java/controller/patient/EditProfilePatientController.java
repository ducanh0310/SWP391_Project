/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.patient;

import dao1.DBPatientProfile;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PatientInfo;
import java.text.ParseException;
import java.sql.Date;

/**
 *
 * @author Vu Minh Quan
 */
public class EditProfilePatientController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            DBPatientProfile db = new DBPatientProfile();            
            PatientInfo patientInfo= db.getInfoPatient("elmurder666");            
            request.setAttribute("paInfo", patientInfo);
            request.setAttribute("username", "elmurder666");

            request.getRequestDispatcher("../../view/patient/editProfilePatient.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewProfilePatientController.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            PatientInfo paInfo = new PatientInfo();
            paInfo.setPatientId(Integer.parseInt(request.getParameter("id")));
            paInfo.setPatientSin(Integer.parseInt(request.getParameter("medicineCode")));
            paInfo.setName(request.getParameter("fullname"));
            paInfo.setPhoneNumber(request.getParameter("phoneNumber"));
            paInfo.setEmail(request.getParameter("email"));
            paInfo.setGender(request.getParameter("gender"));
            paInfo.setDob(Date.valueOf(request.getParameter("dob")));
            paInfo.setAddress(request.getParameter("address"));
            DBPatientProfile db = new DBPatientProfile();
            db.editInfoPatient(paInfo);
            
            response.sendRedirect("view");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditProfilePatientController.class.getName()).log(Level.SEVERE, null, ex); 
        }
    
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
