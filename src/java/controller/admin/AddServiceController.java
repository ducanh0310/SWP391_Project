/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;
import dao.*;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.Timer;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import validation.Validation;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AddServiceController", urlPatterns = {"/addservice"})
public class AddServiceController extends HttpServlet {

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
            out.println("<title>Servlet AddServiceController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddServiceController at " + request.getContextPath() + "</h1>");
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
        // Retrieve the current session
        HttpSession session = request.getSession();
        String userRole = (String) session.getAttribute("userRole");
        // Check if the user is not logged in
        if (userRole == null) {
            // Set an error message and redirect to the home page
            request.getRequestDispatcher("accessDenied.jsp").forward(request, response);
            return;
        }
        request.getRequestDispatcher("view/employee/admin/addService.jsp").forward(request, response);
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
            String service = request.getParameter("service");
            String price = request.getParameter("price");
            String description = request.getParameter("description");

            boolean hasError = false;
            ServiceDAO s = new ServiceDAO();
            if (service == null || service.trim().isEmpty()) {
                request.setAttribute("serviceError", "Service name is required.");
                hasError = true;
            } else {
                if (s.isServiceNameExists(service)) {
                    request.setAttribute("serviceError", "Service name already exists.");
                    hasError = true;
                }
            }
            Validation validation = new Validation();
            String priceError = validation.checkPrice(price);
            if (priceError != null) {
                request.setAttribute("priceError", priceError);
                hasError = true;
            }
            if (description == null || description.trim().isEmpty()) {
                request.setAttribute("descriptionError", "Description is required.");
                hasError = true;
            }

            if (hasError) {
                request.getRequestDispatcher("view/employee/admin/addService.jsp").forward(request, response);
                return;
            }

            ProcedureCodes p = new ProcedureCodes(service, price, description);
            String result = s.addService(p);
            HttpSession session = request.getSession();
            Timer timer = new Timer();
            if (result.equals("true")) {
                session.setAttribute("addServicesSuccess", "Service added successfully.");
                timer.schedule(new TimerTask() {
                    @Override
                    public void run() {
                        session.removeAttribute("addServicesSuccess");
                    }
                }, 5000);
                response.sendRedirect("viewservices");
            } else {
                request.setAttribute("errorMessage", "Failed to add service.");
                request.getRequestDispatcher("view/employee/admin/addService.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddServiceController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", "Database error: " + ex.getMessage());
            request.getRequestDispatcher("view/employee/admin/addService.jsp").forward(request, response);
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
