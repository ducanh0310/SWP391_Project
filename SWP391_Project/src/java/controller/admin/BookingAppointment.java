/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import controller.patient.BookingAppointmentController;
import dao.DBBookingMedicalAppointment;
import dao.DBEmployeeProfile;
import dao.DBService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import model.Employee;
import model.Service;
import model.Slot;
import model.User;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name = "BookingAppointment", urlPatterns = {"/BookingAppointment"})
public class BookingAppointment extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userRole = (String) session.getAttribute("userRole");
        if (userRole == null || userRole.isEmpty()) {
            session.invalidate();
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }
        try {
            if (userRole.contains("admin")) {
                User currentUser = (User) session.getAttribute("currentUser");
                if (currentUser == null) {
                    session.invalidate();
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    return;
                }

                DBEmployeeProfile dbEm = new DBEmployeeProfile();
                Employee emInfo = dbEm.getInfoEmployee(currentUser.getName());
                request.setAttribute("emInfo", emInfo);
                DBService dbService = new DBService();
                ArrayList<Service> arrService = dbService.getService();
                request.setAttribute("arrService", arrService);
                request.setAttribute("username", currentUser.getName());
                request.getRequestDispatcher("view/employee/admin/bookAppointment.jsp").forward(request, response);
            } else {
                session.invalidate();
                request.getRequestDispatcher("accessDenied.jsp").forward(request, response);
                
            }

        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(BookingAppointment.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(BookingAppointment.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
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
//            String service = request.getParameter("service");
            String[] serviceIds = request.getParameterValues("service");
            //String serviceName = request.getParameter("serviceName");

            DBBookingMedicalAppointment db = new DBBookingMedicalAppointment();

            ArrayList<Slot> arrRestSlot = new ArrayList<>();

            // Get the current time
            LocalTime now = LocalTime.now();
            LocalDate today = LocalDate.now();
            for (String serviceId : serviceIds) {
                ArrayList<Slot> arrAllSlot = db.getAllSlot(serviceId);
                ArrayList<Slot> arrExitSlot = db.getExistSlot(serviceId, dateBook);
                for (Slot slotAll : arrAllSlot) {
                    boolean isExist = false;
                    for (Slot slotExist : arrExitSlot) {
                        //Slots are not booked by patient 
                        if (slotAll.getId() == slotExist.getId() && slotAll.getDoctor().getId() == slotExist.getDoctor().getId() && slotAll.getRoom().getId() == slotExist.getRoom().getId()
                                && slotExist.getStatusBook().getId() != 4 && slotExist.getStatusBook().getId() != 1) {
                            isExist = true;
                            break;
                        }
                        if (slotAll.getId() == slotExist.getId() && slotAll.getDoctor().getId() == slotExist.getDoctor().getId() && slotAll.getRoom().getId() == slotExist.getRoom().getId()
                                && slotExist.getStatusBook().getId() == 1 && slotExist.getBookingAppointment().getReservationStatus().equals("Pay reser")) {
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
                            .append("\"idService\": \"").append(slot.getService().getId()).append("\",")
                            .append("\"serviceName\": \"").append(slot.getService().getName()).append("\",")
                            .append("\"idRoom\": \"").append(slot.getRoom().getId()).append("\"")
                            .append("},");
                }
                // Remove the last comma and close the JSON array and object
                jsonResponse.setLength(jsonResponse.length() - 1);
                jsonResponse.append("]}");
                out.print(jsonResponse.toString());
            }

        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(BookingAppointment.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
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