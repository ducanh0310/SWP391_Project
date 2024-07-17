/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.employee;

import dao.DoctorDB;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.PatientExamResult;
import model.Prescription;

/**
 *
 * @author ngphn
 */
@WebServlet(name="searchExam", urlPatterns={"/searchExam"})
public class searchExam extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet searchExam</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchExam at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        int patientId = Integer.parseInt(request.getParameter("pid"));
        DoctorDB db = new DoctorDB();
        PatientExamResult patientResult = db.getPatientExamResult(patientId);
        ArrayList<Prescription> doctors = db.getPrescription();
        if (patientResult != null) {
            request.setAttribute("patientResult", patientResult);
            request.setAttribute("doctors", doctors);
            request.getRequestDispatcher("/prescription.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Patient not found");
            request.getRequestDispatcher("/searchExamPatient.jsp").forward(request, response);
        }
        
    } catch (NumberFormatException e) {
        request.setAttribute("errorMessage", "Invalid patient ID format");
        request.getRequestDispatcher("/searchExamPatient.jsp").forward(request, response);
        
    } catch (Exception e) {
        request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
    }
}

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
