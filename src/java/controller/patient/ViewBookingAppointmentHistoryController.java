/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.patient;

import dao.DBBookingMedicalAppointment;
import dao.FilterAppointmentHisDao;
import java.io.IOException;
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
import model.BookingAppointmentHistory;
import model.User;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name = "ViewBookingAppointmentHistoryController", urlPatterns = {"/patient/viewAppointmentHistory"})
public class ViewBookingAppointmentHistoryController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        try {
            // Log to see if method is called
            Logger.getLogger(ViewBookingAppointmentHistoryController.class.getName()).log(Level.INFO, "Before calling showBookHistory");

            // Take booking appointment history
            DBBookingMedicalAppointment db = new DBBookingMedicalAppointment();
            ArrayList<BookingAppointmentHistory> arrBAH = db.showBookHistory(Integer.parseInt(currentUser.getPatient_Id()));

            // Log to confirm method call completion
            Logger.getLogger(ViewBookingAppointmentHistoryController.class.getName()).log(Level.INFO, "After calling showBookHistory");

            // Put data into jsp
            //Filter
            

            FilterAppointmentHisDao dbFilterAppointmentHisDao = new FilterAppointmentHisDao();
            ArrayList<BookingAppointmentHistory> arrService = dbFilterAppointmentHisDao.getService(Integer.parseInt(currentUser.getPatient_Id()));
            ArrayList<BookingAppointmentHistory> arrDoctor = dbFilterAppointmentHisDao.getDoctor(Integer.parseInt(currentUser.getPatient_Id()));
            ArrayList<BookingAppointmentHistory> arrPrice = dbFilterAppointmentHisDao.getPrice(Integer.parseInt(currentUser.getPatient_Id()));
            ArrayList<BookingAppointmentHistory> arrPay = dbFilterAppointmentHisDao.getPay(Integer.parseInt(currentUser.getPatient_Id()));
            ArrayList<BookingAppointmentHistory> arrDate = dbFilterAppointmentHisDao.getDate(Integer.parseInt(currentUser.getPatient_Id()));
            ArrayList<BookingAppointmentHistory> arrRoom = dbFilterAppointmentHisDao.getRoom(Integer.parseInt(currentUser.getPatient_Id()));
            ArrayList<BookingAppointmentHistory> arrStatus = dbFilterAppointmentHisDao.getStatus(Integer.parseInt(currentUser.getPatient_Id()));
            
            
            request.setAttribute("arrService", arrService);
            request.setAttribute("arrDoctor", arrDoctor);
            request.setAttribute("arrPrice", arrPrice);
            request.setAttribute("arrPay", arrPay);
            request.setAttribute("arrDate", arrDate);
            request.setAttribute("arrRoom", arrRoom);
            request.setAttribute("arrStatus", arrStatus);
            
            request.setAttribute("bookingAppointmentHistory", arrBAH);
            request.getRequestDispatcher("../view/patient/viewAppointmentHistory.jsp").forward(request, response);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewBookingAppointmentHistoryController.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, ex.getMessage());
        } catch (SQLException ex) {
            Logger.getLogger(ViewBookingAppointmentHistoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("currentUser");
            String filterService = request.getParameter("filterService");
            String filterDoctor = request.getParameter("filterDoctor");
            String filterPrice = request.getParameter("filterPrice");
            String filterPayment = request.getParameter("filterPayment");
            String filterTime = request.getParameter("filterTime");
            String filterRoom = request.getParameter("filterRoom");
            String filterStatus = request.getParameter("filterStatus");

            String service = request.getParameter("service");
            String doctor = request.getParameter("doctor");
            String price = request.getParameter("price");
            String payment = request.getParameter("payment");
            String time = request.getParameter("time");
            String room = request.getParameter("room");
            String status = request.getParameter("status");

            DBBookingMedicalAppointment db = new DBBookingMedicalAppointment();
            ArrayList<BookingAppointmentHistory> arrBAH = db.showBookHistoryFilter(Integer.parseInt(currentUser.getPatient_Id()), filterService, filterDoctor, filterPrice, filterPayment, filterTime, filterRoom, filterStatus,
                    service, doctor, price, payment, time, room, status);

            //Filter
            FilterAppointmentHisDao dbFilterAppointmentHisDao = new FilterAppointmentHisDao();
            ArrayList<BookingAppointmentHistory> arrService = dbFilterAppointmentHisDao.getService(Integer.parseInt(currentUser.getPatient_Id()));
            ArrayList<BookingAppointmentHistory> arrDoctor = dbFilterAppointmentHisDao.getDoctor(Integer.parseInt(currentUser.getPatient_Id()));
            ArrayList<BookingAppointmentHistory> arrPrice = dbFilterAppointmentHisDao.getPrice(Integer.parseInt(currentUser.getPatient_Id()));
            ArrayList<BookingAppointmentHistory> arrPay = dbFilterAppointmentHisDao.getPay(Integer.parseInt(currentUser.getPatient_Id()));
            ArrayList<BookingAppointmentHistory> arrDate = dbFilterAppointmentHisDao.getDate(Integer.parseInt(currentUser.getPatient_Id()));
            ArrayList<BookingAppointmentHistory> arrRoom = dbFilterAppointmentHisDao.getRoom(Integer.parseInt(currentUser.getPatient_Id()));
            ArrayList<BookingAppointmentHistory> arrStatus = dbFilterAppointmentHisDao.getStatus(Integer.parseInt(currentUser.getPatient_Id()));
            
            
            request.setAttribute("arrService", arrService);
            request.setAttribute("arrDoctor", arrDoctor);
            request.setAttribute("arrPrice", arrPrice);
            request.setAttribute("arrPay", arrPay);
            request.setAttribute("arrDate", arrDate);
            request.setAttribute("arrRoom", arrRoom);
            request.setAttribute("arrStatus", arrStatus);
            request.setAttribute("bookingAppointmentHistory", arrBAH);
            request.getRequestDispatcher("../view/patient/viewAppointmentHistory.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewBookingAppointmentHistoryController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ViewBookingAppointmentHistoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}