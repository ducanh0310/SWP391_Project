/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import dal.DoctorDB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Prescription;

/**
 *
 * @author Gia Huy
 */
public class DoctorController extends HttpServlet {

   @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
        DoctorDB doctorDB = new DoctorDB();
        ArrayList<Prescription> doctors = doctorDB.getPrescription();
        request.setAttribute("doctors", doctors);
        request.getRequestDispatcher("prescription.jsp").forward(request, response);
        
    } catch (Exception e) {
        request.setAttribute("error", e.getMessage()); 
        request.getRequestDispatcher("errorPage.jsp").forward(request, response);
    }
}
   

}
