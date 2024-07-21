/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.BranchDAO;
import dao.EmployeeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Logger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;
import java.sql.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import model.Branch;
import model.DoctorCertification;
import model.Employee;
import validation.Email;
import validation.Validation;

/**
 *
 * @author ngphn
 */
@WebServlet(name = "AddEmployeeController", urlPatterns = {"/AddEmployee"})
public class AddEmployeeController extends HttpServlet {

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
            out.println("<title>Servlet AddEmployeeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddEmployeeController at " + request.getContextPath() + "</h1>");
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
        try {
            HttpSession session = request.getSession();
            String userRole = (String) session.getAttribute("userRole");
            if (userRole == null || userRole.isEmpty() || !userRole.contains("admin")) {
                session.invalidate();
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }
            ArrayList<Branch> listBranch = new BranchDAO().getAllBranch();
            request.setAttribute("listBranch", listBranch);
            request.getRequestDispatcher("view/employee/admin/addEmployee.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddEmployeeController.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
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
        Validation valid = new Validation();
        //get data from jsp
        Employee employee = new Employee();
        Map<String, String> errorMsg = new HashMap<>();
        employee.setEmployeeType(request.getParameter("role").trim());
        employee.setAnnualSalary(Float.parseFloat(request.getParameter("salary")));
        employee.setBranchId(Integer.parseInt(request.getParameter("branchid")));
        employee.setEmployeeSin(request.getParameter("medicineCode").trim());
        employee.setName(request.getParameter("fullname").trim());
        employee.setPhoneNumber(request.getParameter("phoneNumber").trim());
        employee.setEmail(request.getParameter("email").trim());
        employee.setGender(request.getParameter("gender").trim());
        employee.setAddress(request.getParameter("address").trim());
        String dobStr = request.getParameter("dob");
        if (!valid.isDateOfBirth(dobStr)) {
            errorMsg.put("dob", "DOB invalid.");
        } else {
            Date dob = Date.valueOf(dobStr);
            if (!valid.isDistantDOB(dob)) {
                errorMsg.put("dob", "Date of birth must be before now and employee must be 18 years or older.");
            } else {
                employee.setDob(dob);
            }
        }
        //validate alert!
        if (!valid.isName(employee.getName())) {
            errorMsg.put("fullname", "Full name must be between 2 and 50 characters.");
        }
        if (!valid.isPhoneNumber(employee.getPhoneNumber())) {
            errorMsg.put("phoneNumber", "Phone number must be exactly 10 digits.");
        }
        if (!valid.isMedicalCode(employee.getEmployeeSin())) {
            errorMsg.put("medicalCode", "Medical code must be exactly 10 digits.");
        }
        if (!valid.isAddress(employee.getAddress())) {
            errorMsg.put("address", "Address must be from 2 to 100 characters.");
        }
        if (!valid.isEmail(employee.getEmail())) {
            errorMsg.put("email", "Email invalid.");
        }
        EmployeeDAO employeeDAO = new EmployeeDAO();
        if (!errorMsg.isEmpty()) {
            handleErrors(request, response, errorMsg);
        } else {
            String[] imageLinks = request.getParameterValues("imageLink");
            String[] imageNames = request.getParameterValues("imageName");
            //add centification
            ArrayList<DoctorCertification> certificates = new ArrayList<>();
            if (imageNames != null && imageLinks != null) {
                for (int i = 0; i < imageNames.length; i++) {
                    if (!imageNames[i].isEmpty() && !imageLinks[i].isEmpty()) {
                        DoctorCertification cert = new DoctorCertification();
                        cert.setName(imageNames[i]);
                        cert.setUrl(imageLinks[i]);
                        certificates.add(cert);
                    }
                }
            }
            String password = generateNewPassword();
            boolean isAdded = employeeDAO.addEmployeeAccount(employee, extractUsername(employee.getEmail()), password, certificates);
<<<<<<< HEAD:SWP391_Project/src/java/controller/admin/AddEmployeeController.java
            if (isAdded) {
                // Set success message
                HttpSession session = request.getSession();
                Email.sendNewAccount(employee.getEmail(), extractUsername(employee.getEmail()), password);
=======
            Email.sendNewAccount(employee.getEmail(), extractUsername(employee.getEmail()), password);
            if (isAdded) {
                // Set success message
                HttpSession session = request.getSession();
                // Xóa tất cả các thuộc tính trong session
                Enumeration<String> attributeNames = session.getAttributeNames();
                while (attributeNames.hasMoreElements()) {

                    String attributeName = attributeNames.nextElement();
                    if (!attributeName.equals("currentUser")) {
                        session.removeAttribute(attributeName);
                    }
                }
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/controller/admin/AddEmployeeController.java
                session.setAttribute("successAddEmployee", "Employee added successfully.");
            } else {
                // Set error message
                request.setAttribute("errorMessage", "Employee added fail!!!");
            }
            request.getRequestDispatcher("view/employee/admin/addEmployee.jsp").forward(request, response);
        }
    }

    private void handleErrors(HttpServletRequest request, HttpServletResponse response, Map<String, String> errorMsg)
            throws ServletException, IOException {
        request.setAttribute("errorMsg", errorMsg);
        request.getRequestDispatcher("view/employee/admin/addEmployee.jsp").forward(request, response);
    }

    private boolean isValidURL(String urlStr) {
        try {
            URL url = new URL(urlStr);
            HttpURLConnection huc = (HttpURLConnection) url.openConnection();
            huc.setRequestMethod("HEAD");
            return huc.getResponseCode() == HttpURLConnection.HTTP_OK;
        } catch (IOException e) {
            return false;
        }
    }
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
