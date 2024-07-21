/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.examination;

import dao.AppointmentDAO;
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
import model.AppointmentDTO;
import model.ExaminationResult;
import model.User;

/**
 *
 * @author trung
 */
@WebServlet(name="SearchExaminationResult", urlPatterns={"/SearchExaminationResult"})
public class SearchExaminationResult extends HttpServlet {
   
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
            out.println("<title>Servlet SearchExaminationResult</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchExaminationResult at " + request.getContextPath () + "</h1>");
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
                try {
                    // Retrieve the search key from the request
                    String key = request.getParameter("searchKey");
                    
                    // Perform the search operation
                    ExaminationDAO examDAO = new ExaminationDAO();
                    ArrayList<ExaminationResult> examList = examDAO.SearchERByKey(key);
                    // Set the search key and examination result list as request attributes
                    request.setAttribute("searchKey", key);
                    request.setAttribute("examList", examList);
                    
                    // Forward to the JSP page for displaying the search results
                    request.getRequestDispatcher("view/examination/ExaminationResultList.jsp").forward(request, response);
                    
                } catch (SQLException ex) {
                    Logger.getLogger(SearchExaminationResult.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
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