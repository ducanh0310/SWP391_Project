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
import dao.*;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Timer;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.*;
import validation.Validation;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "EditServiceController", urlPatterns = {"/editservice"})
public class EditServiceController extends HttpServlet {

    /*    int id;*/
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
            out.println("<title>Servlet EditServiceController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditServiceController at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("id"));
        ServiceDAO s = new ServiceDAO();
        EmployeeDAO eDAO = new EmployeeDAO();
        try {
            ProcedureCodes service = s.getServiceById(id);
            request.setAttribute("service", service);
            ArrayList<Employees> listDoctor = eDAO.getAllDoctor();
            request.setAttribute("listDoctor", listDoctor);
            request.getRequestDispatcher("editservice.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditServiceController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", "Database error: " + ex.getMessage());
            request.getRequestDispatcher("viewservices.jsp").forward(request, response);
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
            String name = request.getParameter("name");
            String price = request.getParameter("price");
            String description = request.getParameter("description");
            String dName = request.getParameter("dName");
            int id = Integer.parseInt(request.getParameter("id"));
            String doctorIdParam = request.getParameter("dId");

            System.out.println("Check dIParam:" + doctorIdParam);
            ServiceDAO s = new ServiceDAO();
            ProcedureCodes sv = s.getServiceById(id);
            EmployeeDAO employeeDAO = new EmployeeDAO();
            ArrayList<Employees> listDoctor = employeeDAO.getAllDoctor();
            request.setAttribute("listDoctor", listDoctor);
            boolean hasError = false;

            if (name == null || name.trim().isEmpty()) {
                request.setAttribute("serviceError", "Service name is required.");
                hasError = true;
            }

            Validation validation = new Validation();
            String priceError = validation.checkPrice(price);
            if (priceError != null) {
                request.setAttribute("priceError", priceError);
                hasError = true;
            }
            if (dName == null || dName.trim().isEmpty()) {
                request.setAttribute("dNameErrorr", "Doctor is required.");
                hasError = true;
            }
            if (description == null || description.trim().isEmpty()) {
                request.setAttribute("descriptionError", "Description is required.");
                hasError = true;
            }

            int doctorId = -1;
            boolean doctorExists = false;
            if (doctorIdParam != null && !doctorIdParam.trim().isEmpty()) {
                try {
                    doctorId = Integer.parseInt(doctorIdParam);
                    for (Employees doctor : listDoctor) {
                        if (doctor.getId() == doctorId) {
                            doctorExists = true;
                            break;
                        }
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("dIdErrorr", "Doctor not found.1");
                    hasError = true;
                }
            }

            System.out.println("Check old sv: " + sv.getEmployee().getName());
            System.out.println("Check new sv: " + dName);
            if (sv.getEmployee().getName().equals(dName)) {
                doctorId = sv.getEmployee().getId();
            }
            System.out.println("Check doctorId: " + doctorId);

            if (doctorId == -1) {
                request.setAttribute("dIdErrorr", "Doctor not found.");
                hasError = true;
            }
            if (hasError) {
                ProcedureCodes service = new ProcedureCodes();
                service.setProcedure_id(id);
                service.setProcedure_name(name);
                service.setPrice(price);
                service.setDescription(description);
                if (doctorId != -1) {
                    service.setEmployee(employeeDAO.getEmployeeByEmployeeId(doctorId));
                }
                request.setAttribute("service", service);
                request.getRequestDispatcher("editservice.jsp").forward(request, response);
                return;
            }

            if (s.updateService(id, name, price, description, doctorId)) {
                HttpSession session = request.getSession();
                session.setAttribute("editServiceSuccess", "Service updated successfully.");
                Timer timer = new Timer();
                timer.schedule(new TimerTask() {
                    @Override
                    public void run() {
                        session.removeAttribute("editServiceSuccess");
                    }
                }, 5000);
                response.sendRedirect("ViewServiceDetail?id=" + id);
            } else {
                request.setAttribute("errorMessage", "Failed to update service.");
                request.getRequestDispatcher("editservice.jsp").forward(request, response);
            }
        } catch (NumberFormatException ex) {
            Logger.getLogger(EditServiceController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", "Invalid ID format: " + ex.getLocalizedMessage());
            request.getRequestDispatcher("editservice.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditServiceController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", "Database error: " + ex.getMessage());
            request.getRequestDispatcher("editservice.jsp").forward(request, response);
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
