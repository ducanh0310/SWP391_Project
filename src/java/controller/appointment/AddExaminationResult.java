/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.appointment;

import dao.AppointmentDAO;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.OutputStreamWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AppointmentDTO;

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddExaminationResult</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddExaminationResult at " + request.getContextPath() + "</h1>");
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
            String appIdParam = request.getParameter("appId");
            int appId = Integer.parseInt(appIdParam);
            AppointmentDAO dao = new AppointmentDAO();
            AppointmentDTO appInfor = dao.getAppointmentDTOById(appId);
            request.setAttribute("infor", appInfor);
            request.getRequestDispatcher("view/ExamminationResult.jsp").forward(request, response);
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
    // Get form data
    String id = request.getParameter("id");
    String patientId = request.getParameter("patientId");
    String patientName = request.getParameter("patientName");
    String service = request.getParameter("service");
    String price = request.getParameter("price");
    String doctor = request.getParameter("doctor");
    String bookingDate = request.getParameter("bookingDate");
    String startTime = request.getParameter("startTime");
    String endTime = request.getParameter("endTime");
    String room = request.getParameter("room");
    String status = request.getParameter("status");
    String payStatus = request.getParameter("payRevervationStatus");
    String description = request.getParameter("description");
    String fileName = request.getParameter("fileName");

    // Define the directory and file path
    String directoryPath = "D:\\FPT\\5_SU24\\SWP391\\SWP391_Project\\FileDraft";
    String filePath = Paths.get(directoryPath, fileName).toString();

    // Ensure the directory exists
    File directory = new File(directoryPath);
    if (!directory.exists()) {
        directory.mkdirs();
    }

    // Write data to file
    try (PrintWriter writer = new PrintWriter(new FileWriter(filePath))) {
        writer.println("ID: " + id);
        writer.println("Patient ID: " + patientId);
        writer.println("Patient Name: " + patientName);
        writer.println("Service: " + service);
        writer.println("Price: " + price);
        writer.println("Doctor: " + doctor);
        writer.println("Booking Date: " + bookingDate);
        writer.println("Start Time: " + startTime);
        writer.println("End Time: " + endTime);
        writer.println("Room: " + room);
        writer.println("Status: " + status);
        writer.println("Pay Status: " + payStatus);
        writer.println("Description: " + description);
    }

    // Redirect to a success page after saving the data
    response.sendRedirect("appointmentList");
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
