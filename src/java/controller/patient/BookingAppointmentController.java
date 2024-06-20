/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.patient;

import com.google.gson.Gson;
import dao1.DBBookingMedicalAppointment;
import dao1.DBService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Service;
import model.Slot;
import java.sql.*;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name = "BookingAppointmentController", urlPatterns = {"/patient/bookAppointment"})
public class BookingAppointmentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            DBService dbService = new DBService();
            ArrayList<Service> arrService = dbService.getService();
            request.setAttribute("arrService", arrService);
            request.getRequestDispatcher("../view/patient/bookAppointment.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BookingAppointmentController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {
            // Take parameters from the request
            Date dateBook = Date.valueOf(request.getParameter("date"));
            String service = request.getParameter("service");

            DBBookingMedicalAppointment db = new DBBookingMedicalAppointment();
            ArrayList<Slot> arrAllSlot = db.getAllSlot(service);
            ArrayList<Slot> arrExitSlot = db.getExistSlot(service, dateBook);
            ArrayList<Slot> arrRestSlot = new ArrayList<>();

            for (Slot slotAll : arrAllSlot) {
                boolean isExist = false;
                for (Slot slotExist : arrExitSlot) {
                    if (slotAll.getId()==slotExist.getId() && slotAll.getDoctor().getId() == slotExist.getDoctor().getId() && slotAll.getRoom().getId() == slotExist.getRoom().getId()) {
                        isExist = true;
                        break;
                    }
                }
                if (!isExist) {
                    arrRestSlot.add(slotAll);
                }
            }

            if (arrRestSlot.isEmpty()) {
                out.print("{\"success\": false, \"message\": \"No available slots.\"}");
            } else {
                StringBuilder jsonResponse = new StringBuilder();
                jsonResponse.append("{\"success\": true, \"slots\": [");
                for (Slot slot : arrRestSlot) {
                    jsonResponse.append("{")
                            .append("\"room\": \"").append(slot.getRoom().getName()).append("\",")
                            .append("\"doctor\": \"").append(slot.getDoctor().getName()).append("\",")
                            .append("\"startedTime\": \"").append(slot.getStartedTime()).append("\",")
                            .append("\"endTime\": \"").append(slot.getEndTime()).append("\",")
                            .append("\"idSlot\": \"").append(slot.getId()).append("\",")
                            .append("\"idDoctor\": \"").append(slot.getDoctor().getId()).append("\",")
                            .append("\"date\": \"").append(dateBook).append("\",")
                            .append("\"idService\": \"").append(service).append("\",")
                            .append("\"idRoom\": \"").append(slot.getRoom().getId()).append("\"")
                            .append("},");
                }
                // Remove the last comma and close the JSON array and object
                jsonResponse.setLength(jsonResponse.length() - 1);
                jsonResponse.append("]}");
                out.print(jsonResponse.toString());                
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BookingAppointmentController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
