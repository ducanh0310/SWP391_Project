/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao1.PatientDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.SecureRandom;
import java.sql.*;
import java.time.LocalDate;
import model.Patient;
import validation.Email;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "EditPatientController", urlPatterns = {"/addPatient"})
public class AddPatientController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet AddPatientController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPatientController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/employee/admin/addPatient.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        int code = Integer.parseInt(request.getParameter("code"));
        String gender = request.getParameter("gender");
        Date dob = Date.valueOf(request.getParameter("dob"));
        String address = request.getParameter("address");
        Patient p = new Patient(code, address, name, gender, email, phone, dob, "abc", 1);
        PatientDAO pa = new PatientDAO();
        String pasword = generateNewPassword();
        if (pa.addPatientAccount(p, extractUsername(email), pasword)) {
            Email e = new Email();
            e.sendNewAccount(email, extractUsername(email), pasword);
            request.getRequestDispatcher("view/employee/admin/home.jsp").forward(request, response);
        } else {
            response.sendRedirect("view/employee/admin/addPatient.jsp");
        }
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    private static final String LOWERCASE_LETTERS = "abcdefghijklmnopqrstuvwxyz";
    private static final String UPPERCASE_LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String NUMBERS = "0123456789";
    private static final String SPECIAL_CHARACTERS = "!@#$%^&*()-_=+";

    private static String generateNewPassword() {
        SecureRandom random = new SecureRandom();
        StringBuilder newPassword = new StringBuilder();
        String combinedCharacters = LOWERCASE_LETTERS + UPPERCASE_LETTERS + NUMBERS + SPECIAL_CHARACTERS;

        for (int i = 0; i < 8; i++) {
            int randomIndex = random.nextInt(combinedCharacters.length());
            newPassword.append(combinedCharacters.charAt(randomIndex));
        }

        return newPassword.toString();
    }

    public static String extractUsername(String email) {
        String[] parts = email.split("@");
        if (parts.length == 2) {
            return parts[0];
        }
        return null; // Invalid email format
    }
}
