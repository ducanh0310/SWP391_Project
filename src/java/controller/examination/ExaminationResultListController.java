/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.examination;

import dao.ExaminationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ExaminationResult;
import model.User;

/**
 *
 * @author trung
 */
@WebServlet(name = "ExaminationResultListController", urlPatterns = {"/ExaminationResultListController"})
public class ExaminationResultListController extends HttpServlet {

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
            out.println("<title>Servlet ExaminationResultListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExaminationResultListController at " + request.getContextPath() + "</h1>");
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
             // Retrieve the current session
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("currentUser");
            String userRole = (String) session.getAttribute("userRole");
             // Check if the user is logged in and has the appropriate role
            if (currentUser == null) {
                request.setAttribute("error", "You are not permission!");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                if (userRole.contains("patient") || userRole.contains("admin") ) {
                    request.setAttribute("error", "You are not permission!");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                      // Retrieve the list of examination results from the database
                    ExaminationDAO dao = new ExaminationDAO();
                    ArrayList<ExaminationResult> examList = dao.getAllExaminationResult();
                     // Set the list of examination results as a request attribute
                    request.setAttribute("examList", examList);
                    // Forward to the JSP page for displaying the examination results
                    request.getRequestDispatcher("view/examination/ExaminationResultList.jsp").forward(request, response);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ExaminationResultListController.class.getName()).log(Level.SEVERE, null, ex);
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
            // Retrieve the current session
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("currentUser");
            String userRole = (String) session.getAttribute("userRole");
             // Check if the user is logged in and has the appropriate role
            if (currentUser == null) {
                request.setAttribute("error", "You are not permission!");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                if (userRole.contains("patient") || userRole.contains("admin") ) {
                    request.setAttribute("error", "You are not permission!");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    // Retrieve the list of examination results from the database
                    ExaminationDAO dao = new ExaminationDAO();
                    ArrayList<ExaminationResult> examList = dao.getAllExaminationResult();
                     // Set the list of examination results as a request attribute
                    request.setAttribute("examList", examList);
                     // Forward to the JSP page for displaying the examination results
                    request.getRequestDispatcher("view/examination/ExaminationResultList.jsp").forward(request, response);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ExaminationResultListController.class.getName()).log(Level.SEVERE, null, ex);
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
