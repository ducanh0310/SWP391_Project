/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.PatientDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Patient;
import model.PatientGetByIdDTO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "EditPatientController", urlPatterns = {"/editpatient"})
public class EditPatientController extends HttpServlet {

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
            out.println("<title>Servlet EditPatientController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPatientController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(false); // get existing session if exists
        if (session == null) {
            response.sendRedirect("login");
            return;
        }
        String userRole = (String) session.getAttribute("userRole");
        if (userRole == null || "patient".equals(userRole)) {
            // Redirect to error page or home page if userRole is patient or userRole is null
            response.sendRedirect("accessDenied.jsp"); // You can change this to a relevant page
        }
        try {
            String pid = request.getParameter("pid");
            PatientDAO pa = new PatientDAO();
            PatientGetByIdDTO p = pa.getPatientById(pid);
            request.setAttribute("patient", p);
            request.getRequestDispatcher("view/employee/admin/editPatientDetail.jsp").forward(request, response);
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditPatientController.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            String sin = request.getParameter("sin");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            int code = Integer.parseInt(request.getParameter("code"));
            String gender = request.getParameter("gender");
            Date dob = Date.valueOf(request.getParameter("dob"));
            String address = request.getParameter("address");
            String insurance = request.getParameter("insurance");
            int repId = Integer.parseInt("repId");
            PatientGetByIdDTO p = new PatientGetByIdDTO(sin, address, name, gender, email, phone, dob, insurance, repId);
            PatientDAO pa = new PatientDAO();
            if (pa.updatePatient(p)) {
                request.getRequestDispatcher("home.jsp").forward(request, response);
            }
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditPatientController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
