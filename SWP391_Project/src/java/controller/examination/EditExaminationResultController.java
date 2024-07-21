/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.examination;

import com.google.gson.Gson;
import dao.EmployeeDAO;
import dao.ExaminationDAO;
import dao.ServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Employee;
import model.Employees;
import model.ExaminationResult;
import model.ProcedureCodes;

/**
 *
 * @author trung
 */
@WebServlet(name="EditExaminationResultController", urlPatterns={"/EditExaminationResultController"})
public class EditExaminationResultController extends HttpServlet {
   
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
            out.println("<title>Servlet EditExaminationResultController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditExaminationResultController at " + request.getContextPath () + "</h1>");
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
        try {
             // Retrieve the examination result ID from the request
            String get = request.getParameter("AppID");
            int id = Integer.parseInt(get);
            
              // Retrieve necessary data for editing
            ServiceDAO services = new ServiceDAO();
            EmployeeDAO empDAO = new EmployeeDAO();
            ExaminationDAO dao = new ExaminationDAO();
            ExaminationResult editExam = dao.FindExaminationResultByID(id );
            
              // Set attributes for the request
            request.setAttribute("edit", editExam);
            
            // Forward the request to the JSP page for editing
            request.getRequestDispatcher("view/examination/EditExaminationResult.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditExaminationResultController.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
               // Retrieve form data from the request
            int id = Integer.parseInt(request.getParameter("appID"));
            int price = Integer.parseInt(request.getParameter("price"));
            String doctor = request.getParameter("doctor");
            int room = Integer.parseInt(request.getParameter("room"));
            String status = request.getParameter("appointmentStatus");
            String description = request.getParameter("description");
            
            ExaminationDAO dao = new ExaminationDAO();
            
            // Check if the examination result exists
            ExaminationResult check = dao.FindExaminationResultByID(id);
            if(check != null){
                  // Update the examination result
                boolean update = dao.UpdateExaminationResult(id, price, doctor, room, status, description);
                request.setAttribute("mess", "Update successfully!");
                request.getRequestDispatcher("ExaminationResultListController").forward(request, response);
            }else{
                request.setAttribute("error", "Update failed!");
                request.getRequestDispatcher("ExaminationResultListController").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EditExaminationResultController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
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