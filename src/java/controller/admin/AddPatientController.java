/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.DBAccount;
import dao.DBPatientProfile;
import dao.PatientDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.SecureRandom;
import java.sql.*;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Patient;
import model.PatientInfo;
import model.Representative;
import validation.Email;
import validation.Validation;

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
        Map<String, String> errorMsg = new HashMap<>();

        String name = request.getParameter("name").trim();
        String phone = request.getParameter("phone").trim();
        String email = request.getParameter("email").trim();
        String sin = request.getParameter("code").trim();
        String gender = request.getParameter("gender").trim();
        String dob = request.getParameter("dob").trim();
        String address = request.getParameter("address").trim();

        String repName = request.getParameter("repName").trim();
        String repPhone = request.getParameter("repPhone").trim();
        String reqEmail = request.getParameter("repEmail").trim();
        String relationship = request.getParameter("relationship").trim();

        Validation valid = new Validation();
        // Validate name
        if (!valid.isName(name)) {
            request.setAttribute("fullname", name);
            errorMsg.put("fullname", "Full name must be between 2 and 50 characters.");
        } else {
            request.setAttribute("fullname", name);
        }

        if (repName == null || repName.isEmpty()) {

        } else if (!valid.isName(repName)) {
            request.setAttribute("repName", repName);
            errorMsg.put("repName", "Representative  name must be between 2 and 50 characters.");
        } else {
            request.setAttribute("repName", repName);
        }

        if (relationship == null || relationship.isEmpty()) {

        } else if (!valid.isName(relationship)) {
            request.setAttribute("relationship", relationship);
            errorMsg.put("relationship", "relationship must be between 2 and 50 characters.");
        } else {
            request.setAttribute("relationship", relationship);
        }

        //Validate phone number
        if (phone == null || phone.isEmpty()) {

        } else if (!valid.isPhoneNumber(phone)) {
            request.setAttribute("phoneNumber", phone);
            errorMsg.put("phoneNumber", "Phone number must exactly 10 digits.");
        } else {
            request.setAttribute("phoneNumber", phone);
        }

        if (repPhone == null || repPhone.isEmpty()) {

        } else if (!valid.isPhoneNumber(repPhone)) {
            request.setAttribute("repPhone", repPhone);
            errorMsg.put("repPhone", "Phone number must exactly 10 digits.");
        } else {
            request.setAttribute("repPhone", repPhone);
        }

        // Validate email format
        if (email == null || email.isEmpty()) {

        } else if (!valid.isEmail(email)) {
            request.setAttribute("email", email);
            errorMsg.put("email", "Invalid email format.");
        } else {
            request.setAttribute("email", email);
        }

        if (reqEmail == null || reqEmail.isEmpty()) {

        } else if (!valid.isEmail(reqEmail)) {
            request.setAttribute("reqEmail", reqEmail);
            errorMsg.put("reqEmail", "Invalid email format.");
        } else {
            request.setAttribute("reqEmail", reqEmail);
        }

        //Validate Medical code
        if (sin == null || sin.isEmpty()) {

        } else if (!valid.isMedicalCode(sin)) {
            request.setAttribute("medicalCode", sin);
            errorMsg.put("medicalCode", "Medical code must exactly 10 digits.");
        } else {
            request.setAttribute("medicalCode", sin);
        }

        // Validate date format
        if (!dob.isEmpty()) {
            request.setAttribute("dob", dob);
        }

        //Validate address
        if (address == null || address.isEmpty()) {

        } else if (!valid.isAddress(address)) {
            request.setAttribute("address", address);
            errorMsg.put("address", "Address must from 2 to 100 character.");
        } else {
            request.setAttribute("address", address);
        }

        //Validate address 
        if (!errorMsg.isEmpty()) {

            request.setAttribute("errorMsg", errorMsg);
            request.getRequestDispatcher("view/employee/admin/addPatient.jsp").forward(request, response);

        } else {
            try {

                if (repName != null && !repName.isEmpty() ) {
                    String random = generateUniqueRandomString(10);
                    PatientDAO pa = new PatientDAO();
                    PatientInfo paInfo = new PatientInfo();
                    paInfo.setPatientSin(sin);
                    paInfo.setName(name);
                    paInfo.setPhoneNumber(phone);
                    paInfo.setEmail(email);
                    paInfo.setGender(gender);
                    paInfo.setDob(Date.valueOf(dob));
                    paInfo.setAddress(address);
                    paInfo.setType(random);
                    pa.addPatient(paInfo);
                    
                    Representative representative = new Representative();
                    representative.setName(repName);
                    representative.setEmail(reqEmail);
                    representative.setPhone(repPhone);
                    representative.setRelationship(relationship);
                    representative.setType(random);
                    pa.addRepresentative(representative);
                }else{
                    PatientDAO pa = new PatientDAO();
                    PatientInfo paInfo = new PatientInfo();
                    paInfo.setPatientSin(sin);
                    paInfo.setName(name);
                    paInfo.setPhoneNumber(phone);
                    paInfo.setEmail(email);
                    paInfo.setGender(gender);
                    paInfo.setDob(Date.valueOf(dob));
                    paInfo.setAddress(address);
                    paInfo.setType(null);
                    pa.addPatient(paInfo);
                }
                

                response.sendRedirect("PatientController");
            } catch (SQLException ex) {
                Logger.getLogger(AddPatientController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

//       PatientDAO pa = new PatientDAO();
//        String pasword = generateNewPassword();
//      if (pa.addPatientAccount(pa.addPatientAccount(p,  extractUsername(email), pasword)) {
//            Email.sendNewAccount(email, extractUsername(email), pasword);
//            request.getRequestDispatcher("view/employee/admin/home.jsp").forward(request, response);
//            return;
//        } else {
//            response.sendRedirect("view/employee/admin/addPatient.jsp");
//        }
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
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final Set<String> generatedStrings = new HashSet<>();

    public static String generateUniqueRandomString(int length) {
        String randomString;
        do {
            randomString = generateRandomString(length);
        } while (generatedStrings.contains(randomString));
        generatedStrings.add(randomString);
        return randomString;
    }

    public static String generateRandomString(int length) {
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            SecureRandom random = new SecureRandom();
            int index = random.nextInt(CHARACTERS.length());
            sb.append(CHARACTERS.charAt(index));
        }
        return sb.toString();
    }

//    private static String generateNewPassword() {
//        
//        StringBuilder newPassword = new StringBuilder();
//        String combinedCharacters = LOWERCASE_LETTERS + UPPERCASE_LETTERS + NUMBERS + SPECIAL_CHARACTERS;
//
//        for (int i = 0; i < 8; i++) {
//            int randomIndex = random.nextInt(combinedCharacters.length());
//            newPassword.append(combinedCharacters.charAt(randomIndex));
//        }
//
//        return newPassword.toString();
//    }
    public static String extractUsername(String email) {
        String[] parts = email.split("@");
        if (parts.length == 2) {
            return parts[0];
        }
        return null; // Invalid email format
    }
}
