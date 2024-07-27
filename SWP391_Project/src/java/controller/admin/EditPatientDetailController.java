/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.PatientViewDB;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.sql.Date;
import model.HistoryAdmin;
import model.Patient;

/**
 *
 * @author ngphn
 */
@WebServlet(name = "EditPatientDetailController", urlPatterns = {"/editpatientdetail"})
public class EditPatientDetailController extends HttpServlet {

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
            out.println("<title>Servlet EditPatientDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPatientDetailController at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int patientId = Integer.parseInt(request.getParameter("pid"));
            PatientViewDB patientView = new PatientViewDB();
            Patient patients = patientView.getPatient(patientId);
            HistoryAdmin history = patientView.getHistory(patientId);
            request.setAttribute("id", patientId);
            request.setAttribute("patients", patients);
            request.setAttribute("history", history);
            request.getRequestDispatcher("editPatientDetail.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException | SQLException e) {
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int patientId = Integer.parseInt(request.getParameter("Patient_id"));
            Patient p = new Patient();

            p.setId(patientId);
            p.setSin(request.getParameter("patient_sin"));
            p.setAddress(request.getParameter("address"));
            p.setName(request.getParameter("name"));
            p.setGender(request.getParameter("gender"));
            p.setEmail(request.getParameter("email"));
            p.setPhone(request.getParameter("phone"));
            p.setDob(Date.valueOf(request.getParameter("date_of_birth")));

            // Create an instance of PatientViewDB
            PatientViewDB patientViewDB = new PatientViewDB();

            // Call the editInfoPatient method to update the patient info
            patientViewDB.editInfoPatient(p);
            // Redirect to a confirmation or another page
            response.sendRedirect("patientDetail?pid=" + p.getId());
        } catch (IOException | NumberFormatException | SQLException e) {
//            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            response.getWriter().print(e);
        }
    }
}
