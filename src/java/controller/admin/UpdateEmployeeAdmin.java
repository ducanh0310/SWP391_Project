/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.DBAccount;
import dao.DBEmployeeProfile;
import dao.EmployeeDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.DoctorCertification;
import model.Employee;
import model.User;
import validation.Validation;

/**
 *
 * @author ngphn
 */
@WebServlet(name = "UpdateEmployeeAdmin", urlPatterns = {"/UpdateEmployee"})
public class UpdateEmployeeAdmin extends HttpServlet {

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
            out.println("<title>Servlet UpdateEmployeeAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateEmployeeAdmin at " + request.getContextPath() + "</h1>");
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

//        try {
//            Employee employee = new EmployeeDAO().getEmployeeByEmployeeId(Integer.parseInt(request.getParameter("eId")));
//            PrintWriter out = response.getWriter();
//            out.println("ID: " + employee.getId());
//            out.println("SIN: " + employee.getEmployeeSin());
//            out.println("Type: " + employee.getEmployeeType());
//            out.println("Name: " + employee.getName());
//            out.println("Address: " + employee.getAddress());
//            out.println("Email: " + employee.getEmail());
//            out.println("Annual Salary: $" + employee.getAnnualSalary());
//            out.println("Branch ID: " + employee.getBranchId());
//            out.println("Phone Number: " + employee.getPhoneNumber());
//            out.println("Date of Birth: " + employee.getDob());
//            out.println("Gender: " + employee.getGender());
//            out.println(); // Add a blank line for readability between employees
//        } catch (SQLException ex) {
//            Logger.getLogger(UpdateEmployeeAdmin.class.getName()).log(Level.SEVERE, null, ex);
//        }
        try {
            HttpSession session = request.getSession();
//            String userRole = (String) session.getAttribute("userRole");
//            if (userRole == null || userRole.isEmpty() || !userRole.contains("admin")) {
//                session.invalidate();
//                request.getRequestDispatcher("index.jsp").forward(request, response);
//                return;
//            }
            int eId = Integer.parseInt(request.getParameter("eId"));
            session.setAttribute("eId", eId);
            User employeeUser = new UserDAO().getUserByEmployeeId((int) eId);
            try {
                DBEmployeeProfile dbEm = new DBEmployeeProfile();
                Employee emInfo = dbEm.getInfoEmployee(employeeUser.getName());
                DBAccount db = new DBAccount();
                Account acc = db.showAccountInfo(employeeUser.getName());

                request.setAttribute("image", acc.getImage());
                request.setAttribute("emInfo", emInfo);
                request.setAttribute("username", employeeUser.getName());

                if ("d".equals(emInfo.getEmployeeType())) {
                    ArrayList<DoctorCertification> arrayCerti = dbEm.getCertification(employeeUser.getName());
                    request.setAttribute("arrayCerti", arrayCerti);
                    request.getRequestDispatcher("view/employee/admin/updateEmployeeAdmin.jsp").forward(request, response);
                } else if ("b".equals(emInfo.getEmployeeType())) {
                    request.getRequestDispatcher("view/employee/admin/updateEmployeeAdmin.jsp").forward(request, response);
                }
                request.getRequestDispatcher("view/employee/admin/updateEmployeeAdmin.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(UpdateEmployeeAdmin.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UpdateEmployeeAdmin.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UpdateEmployeeAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            int eId = (int) session.getAttribute("eId");
            User employeeUser = new UserDAO().getUserByEmployeeId(eId);
            Map<String, String> errorMsg = new HashMap<>();
            DBEmployeeProfile db = new DBEmployeeProfile();
            //Validation data
            Employee emInfo = getEmployeeFromRequest(request, errorMsg);
            if (!errorMsg.isEmpty()) {
                //Announce error into jsp
//                PrintWriter out = response.getWriter();
//                out.println("ID: " + emInfo.getId());
//                out.println("SIN: " + emInfo.getEmployeeSin());
//                out.println("Type: " + emInfo.getEmployeeType());
//                out.println("Name: " + emInfo.getName());
//                out.println("Address: " + emInfo.getAddress());
//                out.println("Email: " + emInfo.getEmail());
//                out.println("Annual Salary: $" + emInfo.getAnnualSalary());
//                out.println("Branch ID: " + emInfo.getBranchId());
//                out.println("Phone Number: " + emInfo.getPhoneNumber());
//                out.println("Date of Birth: " + emInfo.getDob());
//                out.println("Gender: " + emInfo.getGender());
//                out.println(); // Add a blank line for readability between employees
                handleErrors(request, response, employeeUser, errorMsg);
            } else {
                db.editInfoEmployee(emInfo);

                // submit certification for doctor 
                handleCertifications(request, employeeUser, db, errorMsg);
                PrintWriter out = response.getWriter();
                out.print("update successfully");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateEmployeeAdmin.class.getName()).log(Level.SEVERE, null, ex);
            Logger.getLogger(UpdateEmployeeAdmin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateEmployeeAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Validation data
    private Employee getEmployeeFromRequest(HttpServletRequest request, Map<String, String> errorMsg) {
        Validation valid = new Validation();
        Employee emInfo = new Employee();

        try {
            emInfo.setId(Integer.parseInt(request.getParameter("id")));
            emInfo.setEmployeeType(request.getParameter("role").trim());
            emInfo.setAnnualSalary(Float.parseFloat(request.getParameter("salary")));
            emInfo.setBranchId(Integer.parseInt(request.getParameter("branchid")));
            emInfo.setEmployeeSin(request.getParameter("medicineCode").trim());
            emInfo.setName(request.getParameter("fullname").trim());
            emInfo.setPhoneNumber(request.getParameter("phoneNumber").trim());
            emInfo.setEmail(request.getParameter("email").trim());
            emInfo.setGender(request.getParameter("gender").trim());
            emInfo.setAddress(request.getParameter("address").trim());

            String dobStr = request.getParameter("dob");
            if (!valid.isDateOfBirth(dobStr)) {
                errorMsg.put("dob", "Use yyyy-mm-dd.");
            } else {
                Date dob = Date.valueOf(dobStr);
                if (!valid.isDistantDOB(dob)) {
                    errorMsg.put("dob", "Your date of birth must before now and you must be 18 years or older.");
                } else {
                    emInfo.setDob(dob);
                }
            }

            if (!valid.isName(emInfo.getName())) {
                errorMsg.put("fullname", "Full name must be between 2 and 50 characters.");
            }
            if (!valid.isPhoneNumber(emInfo.getPhoneNumber())) {
                errorMsg.put("phoneNumber", "Phone number must exactly 10 digits.");
            }
            if (!valid.isMedicalCode(emInfo.getEmployeeSin())) {
                errorMsg.put("medicalCode", "Medical code must be exactly 10 digits.");
            }
            if (!valid.isAddress(emInfo.getAddress())) {
                errorMsg.put("address", "Address must from 2 to 100 character.");
            }
        } catch (Exception ex) {
            Logger.getLogger(UpdateEmployeeAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }

        return emInfo;
    }

    //Announce error into jsp
    private void handleErrors(HttpServletRequest request, HttpServletResponse response, User currentUser, Map<String, String> errorMsg)
            throws ServletException, IOException, ClassNotFoundException {
        try {
            DBEmployeeProfile dbEm = new DBEmployeeProfile();
            Employee emInfo = dbEm.getInfoEmployee(currentUser.getName());
            DBAccount dbA = new DBAccount();
            Account acc = dbA.showAccountInfo(currentUser.getName());

            request.setAttribute("errorMsg", errorMsg);
            request.setAttribute("image", acc.getImage());
            request.setAttribute("emInfo", emInfo);
            request.setAttribute("username", currentUser.getName());
            if ("d".equals(emInfo.getEmployeeType())) {
                ArrayList<DoctorCertification> arrayCerti = dbEm.getCertification(currentUser.getName());
                request.setAttribute("arrayCerti", arrayCerti);
//                response.sendRedirect("UpdateEmployee?eId=" + emInfo.getId());
                request.getRequestDispatcher("view/employee/admin/updateEmployeeAdmin.jsp").forward(request, response);
            } else if ("b".equals(emInfo.getEmployeeType())) {
//                response.sendRedirect("UpdateEmployee?eId=" + emInfo.getId());
                request.getRequestDispatcher("view/employee/admin/updateEmployeeAdmin.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UpdateEmployeeAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("view/employee/admin/updateEmployeeAdmin.jsp").forward(request, response);
    }

    // submit certification for doctor 
    private void handleCertifications(HttpServletRequest request, User currentUser, DBEmployeeProfile db, Map<String, String> errorMsg)
            throws ClassNotFoundException {
        try {
            Employee emInfo = db.getInfoEmployee(currentUser.getName());
            if ("d".equals(emInfo.getEmployeeType())) {
                String[] imageLinks = request.getParameterValues("imageLink");
                String[] imageNames = request.getParameterValues("imageName");
                String[] idStrings = request.getParameterValues("idCer");
                int[] idImage = new int[100];

                for (int i = 0; i < idStrings.length; i++) {
                    idImage[i] = idStrings[i] == null || idStrings[i].isEmpty() ? 0 : Integer.parseInt(idStrings[i]);
                }

                if (imageLinks != null && imageNames != null && imageLinks.length == imageNames.length) {
                    for (int i = 0; i < imageLinks.length; i++) {
                        String imageLink = imageLinks[i];
                        String imageName = imageNames[i];
                        int imageId = idImage[i];

                        if (isValidURL(imageLink)) {
                            if (imageId != 0) {
                                db.updateCertificate(currentUser.getName(), imageName, imageLink, imageId);
                            } else {
                                db.insertCertification(imageName, imageLink, emInfo.getId());
                            }
                        } else {
                            errorMsg.put("link", "Invalid link form");
                        }
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UpdateEmployeeAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    @Override
    public String getServletInfo() {
        return "Edit Profile Employee Controller";
    }
}
