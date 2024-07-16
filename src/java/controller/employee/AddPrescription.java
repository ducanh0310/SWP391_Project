/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import dal.DoctorDB;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Patient;
import model.Prescription;

/**
 *
 * @author Gia Huy
 */
@WebServlet(name = "AddPrescription", urlPatterns = {"/addPrescription"})
public class AddPrescription extends HttpServlet {

     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DoctorDB db = new DoctorDB();
        Prescription p = new Prescription();
        Patient pa = new Patient();

        pa.setName(request.getParameter("name"));
        pa.setPhone(request.getParameter("phone"));
        p.setName(pa);
        p.setPhone(pa);
        p.setDosage(request.getParameter("dosage"));
        p.setDuration(request.getParameter("duration"));
        p.setMedication(request.getParameter("medication"));
        p.setNotes(request.getParameter("notes"));
        
        db.addPrescription(p);
         response.sendRedirect("addPrescription.jsp");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DoctorDB db = new DoctorDB();
        ArrayList<Prescription> pre = db.getPrescription();
        request.setAttribute("pre", pre);
        request.getRequestDispatcher("addPrescription.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "AddPrescription Servlet";
    }
}

