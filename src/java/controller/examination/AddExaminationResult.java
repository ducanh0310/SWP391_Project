/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.examination;

import dao.AppointmentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AppointmentDTO;
import model.ExaminationResult;
import dao.ExaminationDAO;
import java.io.PrintWriter;
import java.util.ArrayList;
import model.User;

/**
 *
 * @author trung
 */
@WebServlet(name = "AddExaminationResult", urlPatterns = {"/AddExaminationResult"})
public class AddExaminationResult extends HttpServlet {

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
            User currentUser = (User) session.getAttribute("currentUser");
            String userRole = (String) session.getAttribute("userRole");
            if (currentUser == null) {
                request.setAttribute("error", "You are not permission!");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                if (userRole.contains("patient")) {
                    request.setAttribute("error", "You are not permission!");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    String appIdParam = request.getParameter("appId");
                    int appId = Integer.parseInt(appIdParam);
                    AppointmentDAO dao = new AppointmentDAO();
                    AppointmentDTO appInfor = dao.getAppointmentDTOById(appId);
                    request.setAttribute("infor", appInfor);
                    request.getRequestDispatcher("view/examination/ExamminationResult.jsp").forward(request, response);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddExaminationResult.class.getName()).log(Level.SEVERE, null, ex);
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
        HttpSession session = request.getSession();
        // Get form data
        int id = Integer.parseInt(request.getParameter("appID"));
        int patientId = Integer.parseInt(request.getParameter("patientID"));
        String patientName = request.getParameter("patientName");
        String service = request.getParameter("service");
        int price = Integer.parseInt(request.getParameter("price"));
        String doctor = request.getParameter("doctor");
        Date bookingDate = Date.valueOf(request.getParameter("bookingDate"));
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        int room = Integer.parseInt(request.getParameter("room"));
        String status = request.getParameter("appointmentStatus");
        String examStatus = "inactive";
        String payStatus = request.getParameter("payStatus");
        String description = request.getParameter("description");

        if (description.contains("!@#$%^&*")) {
            request.setAttribute("error", "Description just accept letter and character");
            request.getRequestDispatcher("view/examination/ExaminationResultList.jsp").forward(request, response);
        } else {
            try {
                ExaminationDAO dao = new ExaminationDAO();
                if(dao.checkExaminationResultExist(id) == null){
                   String exam = dao.addExaminationResult(id, patientId, patientName, service, price, doctor, bookingDate, startTime,
                         endTime, room, status, payStatus, examStatus, description); 
                
                if ("True".equals(exam)) {
                    request.setAttribute("mess", "Add successfully!");
                }
                ArrayList<ExaminationResult> examList = dao.getAllExaminationResult();
                request.setAttribute("examList", examList);
                request.getRequestDispatcher("view/examination/ExaminationResultList.jsp").forward(request, response);
                }else {
                    ArrayList<ExaminationResult> examList = dao.getAllExaminationResult();
                request.setAttribute("examList", examList);
                    request.setAttribute("error", "Cannot add a new Examination Result that already exists!");
                    request.getRequestDispatcher("view/examination/ExaminationResultList.jsp").forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(AddExaminationResult.class.getName()).log(Level.SEVERE, null, ex);
            }
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