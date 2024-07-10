/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.patient;

import dao1.DBBookingMedicalAppointment;
import dao1.DBService;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BookingAppointmentHistory;
import model.Slot;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import model.Service;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name = "EditAppointmentController", urlPatterns = {"/patient/editAppointment"})
public class EditAppointmentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Get parameter
            String idAppointment = request.getParameter("id");
            //Get information from DB
            DBBookingMedicalAppointment db = new DBBookingMedicalAppointment();
            BookingAppointmentHistory bAH = db.getDateAppointment(Integer.parseInt(idAppointment));

            int idService = bAH.getService().getId();
            Date date = bAH.getDate();

            ArrayList<Slot> arrAllSlot = db.getAllSlot(String.valueOf(idService));
            ArrayList<Slot> arrExitSlot = db.getExistSlot(String.valueOf(idService), date);
            ArrayList<Slot> arrRestSlot = new ArrayList<>();
            int flag = 0;
            for (Slot slotAll : arrAllSlot) {
                boolean isExist = false;
                for (Slot slotExist : arrExitSlot) {
                    if (slotAll.getId() == slotExist.getId() && slotAll.getDoctor().getId() == slotExist.getDoctor().getId() && slotAll.getRoom().getId() == slotExist.getRoom().getId()
                            && slotExist.getStatusBook().getId() != 4) {
                        isExist = true;
                        break;
                    }
                    if (slotExist.getStatusBook().getId() == 4) {
                        flag = 1;
                    }
                }

                if (!isExist) {

                    arrRestSlot.add(slotAll);
                }
            }

            //Get Service
            DBService dbService = new DBService();
            ArrayList<Service> arrService = dbService.getService();

            //Redirect
            request.setAttribute("idAppointment", idAppointment);
            request.setAttribute("arrService", arrService);
            request.setAttribute("DateServiceAppointment", bAH);
            request.setAttribute("arrRestSlot", arrRestSlot);
            if (flag == 1) {
                request.getRequestDispatcher("../view/patient/notificationEdit.jsp").forward(request, response);
            }
            request.getRequestDispatcher("../view/patient/editAppointment.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditAppointmentController.class.getName()).log(Level.SEVERE, null, ex);
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
            String serviceName = request.getParameter("serviceName");

            DBBookingMedicalAppointment db = new DBBookingMedicalAppointment();
            ArrayList<Slot> arrAllSlot = db.getAllSlot(service);
            ArrayList<Slot> arrExitSlot = db.getExistSlot(service, dateBook);
            ArrayList<Slot> arrRestSlot = new ArrayList<>();

            // Get the current time
            LocalTime now = LocalTime.now();
            LocalDate today = LocalDate.now();

            for (Slot slotAll : arrAllSlot) {
                boolean isExist = false;
                for (Slot slotExist : arrExitSlot) {
                    if (slotAll.getId() == slotExist.getId() && slotAll.getDoctor().getId() == slotExist.getDoctor().getId() && slotAll.getRoom().getId() == slotExist.getRoom().getId()
                            && slotExist.getStatusBook().getId() != 4) {
                        isExist = true;
                        break;
                    }
                }
                // Check if the slot's start time is after the current time
                LocalDate slotDate = dateBook.toLocalDate();
                LocalTime slotStartTime = slotAll.getStartedTime();

                if (!isExist && (slotDate.isAfter(today) || (slotDate.isEqual(today) && slotStartTime.isAfter(now)))) {
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
                            .append("\"serviceName\": \"").append(serviceName).append("\",")
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
