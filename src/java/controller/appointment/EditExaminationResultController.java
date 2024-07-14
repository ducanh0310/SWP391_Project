/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.appointment;

import com.google.gson.Gson;
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
import java.util.HashMap;
import java.util.Map;

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
         String fileName = request.getParameter("fileName");
        String directoryPath = "D:\\FPT\\5_SU24\\SWP391\\SWP391_Project\\FileDraft";
        String filePath = Paths.get(directoryPath, fileName).toString();
        Map<String, String> examResults = new HashMap<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(":", 2); // Split each line by first colon
                if (parts.length == 2) {
                    examResults.put(parts[0].trim(), parts[1].trim());
                }
            }
        } catch (IOException e) {
            e.printStackTrace();  // Handle file IO exception properly
        }

        // Convert map to JSON
        String json = new Gson().toJson(examResults);

        // Set content type and write JSON to response
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
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
        String fileName = request.getParameter("fileName");
        String directoryPath = "D:\\FPT\\5_SU24\\SWP391\\SWP391_Project\\FileDraft";
        String filePath = Paths.get(directoryPath, fileName).toString();

        // Extract data from request
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
        String payRevervationStatus = request.getParameter("payRevervationStatus");
        String description = request.getParameter("description");

        // Construct the data to save
        String dataToSave = "id:" + id + "\n"
                          + "patientId:" + patientId + "\n"
                          + "patientName:" + patientName + "\n"
                          + "service:" + service + "\n"
                          + "price:" + price + "\n"
                          + "doctor:" + doctor + "\n"
                          + "bookingDate:" + bookingDate + "\n"
                          + "startTime:" + startTime + "\n"
                          + "endTime:" + endTime + "\n"
                          + "room:" + room + "\n"
                          + "status:" + status + "\n"
                          + "payRevervationStatus:" + payRevervationStatus + "\n"
                          + "description:" + description;

        // Save data to file
        try (PrintWriter writer = new PrintWriter(new FileWriter(filePath))) {
            writer.println(dataToSave);
        } catch (IOException e) {
            e.printStackTrace();  // Handle file IO exception properly
        }

        request.getRequestDispatcher("view/AppointmentList.jsp").forward(request, response);
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
