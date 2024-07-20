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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ExaminationResult;

/**
 *
 * @author trung
 */
@WebServlet(name = "SubmitExaminationResult", urlPatterns = {"/SubmitExaminationResult"})
public class SubmitExaminationResult extends HttpServlet {

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
            out.println("<title>Servlet SubmitExaminationResult</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubmitExaminationResult at " + request.getContextPath() + "</h1>");
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
        doPost(request, response);
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
            // Retrieve appointment ID from the request
            int id = Integer.parseInt(request.getParameter("AppID"));
            // Create an instance of ExaminationDAO to interact with the database
            ExaminationDAO examDAO = new ExaminationDAO();
            // Submit the examination result
            boolean submit = examDAO.submitExamination(id);
            // Retrieve all examination results to display
            ArrayList<ExaminationResult> examList = examDAO.getAllExaminationResult();
            request.setAttribute("examList", examList);
            // Set appropriate message based on the result of the submission
            if (submit == true) {
                request.setAttribute("mess", "Submit successfully!");
            } else {
                request.setAttribute("error", "Submit failed!");
            }
            // Forward the request to the JSP page for displaying the results
            request.getRequestDispatcher("view/examination/ExaminationResultList.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(SubmitExaminationResult.class.getName()).log(Level.SEVERE, null, ex);
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
