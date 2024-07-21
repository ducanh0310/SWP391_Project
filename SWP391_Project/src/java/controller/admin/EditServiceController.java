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
<<<<<<< HEAD:SWP391_Project/src/java/controller/admin/EditServiceController.java
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.Timer;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.*;
import validation.Validation;
=======
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.*;
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/controller/admin/EditServiceController.java

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "EditServiceController", urlPatterns = {"/editservice"})
public class EditServiceController extends HttpServlet {
<<<<<<< HEAD:SWP391_Project/src/java/controller/admin/EditServiceController.java

    int id;

=======
int id;
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/controller/admin/EditServiceController.java
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
<<<<<<< HEAD:SWP391_Project/src/java/controller/admin/EditServiceController.java
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
        try {
            ProcedureCodes service = s.getServiceById(id);
            request.setAttribute("service", service);
            request.getRequestDispatcher("editservice.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditServiceController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", "Database error: " + ex.getMessage());
            request.getRequestDispatcher("viewservices.jsp").forward(request, response);
=======
        try {
            id = Integer.parseInt(request.getParameter("id"));
            ServiceDAO s = new ServiceDAO();
            ProcedureCodes p = s.getServiceById(id);
            request.setAttribute("name", p.getProcedure_name());
            request.setAttribute("price", p.getPrice());
            request.getRequestDispatcher("view/employee/admin/editService.jsp").forward(request, response);
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditServiceController.class.getName()).log(Level.SEVERE, null, ex);
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/controller/admin/EditServiceController.java
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
<<<<<<< HEAD:SWP391_Project/src/java/controller/admin/EditServiceController.java
            String description = request.getParameter("description");
            int id = Integer.parseInt(request.getParameter("id"));

            ServiceDAO s = new ServiceDAO();
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
            if (description == null || description.trim().isEmpty()) {
                request.setAttribute("descriptionError", "Description is required.");
                hasError = true;
            }

            if (hasError) {
                // Load service data again to display on the form
                ProcedureCodes service = new ProcedureCodes();
                service.setProcedure_id(id);
                service.setProcedure_name(name);
                service.setPrice(price);
                service.setDescription(description);
                request.setAttribute("service", service);

                request.getRequestDispatcher("editservice.jsp").forward(request, response);
                return;
            }

            if (s.updateService(id, name, price, description)) {
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
        } catch (SQLException ex) {
            Logger.getLogger(EditServiceController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", "Database error: " + ex.getMessage());
            request.getRequestDispatcher("editservice.jsp").forward(request, response);
        } catch (NumberFormatException ex) {
            Logger.getLogger(EditServiceController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", "Invalid ID format.");
            request.getRequestDispatcher("editservice.jsp").forward(request, response);
=======
//            int id = Integer.parseInt(request.getParameter("id"));
            
            ServiceDAO s = new ServiceDAO();
            if(s.updateService(id, name, price) ==  true) {
                response.sendRedirect("viewservices");
            } else{
                
            }
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditServiceController.class.getName()).log(Level.SEVERE, null, ex);
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/controller/admin/EditServiceController.java
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

<<<<<<< HEAD:SWP391_Project/src/java/controller/admin/EditServiceController.java
}
=======
}
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/controller/admin/EditServiceController.java
