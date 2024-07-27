/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.payment;

import dao.DBBookingMedicalAppointment;
import dao.PatientDAO;
import dao.PaymentDAO;
import dao.RoomDAO;
import dao.ServiceDAO;
import dao.SlotDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BookingAppointmentHistory;
import model.PatientGetByIdDTO;
import model.ProcedureCodes;
import model.Slot;
import validation.Email;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name = "PaymentController", urlPatterns = {"/payment"})
public class PaymentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }

        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }

        String signValue = Config.hashAllFields(fields);
        if (signValue.equals(vnp_SecureHash)) {
            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                try {
                    String moneyStr = request.getParameter("vnp_Amount");
                    long money = Long.parseLong(moneyStr);
                    PaymentDAO paymentDAO = new PaymentDAO();
                    String idAppointment = (String) session.getAttribute("idAppointment");
                    int check = paymentDAO.insertPayment(Integer.parseInt(idAppointment), String.valueOf(money / 100));
//                    if (check == 1) {
//                        // Xóa tất cả các thuộc tính trong session
//                        Enumeration<String> attributeNames = session.getAttributeNames();
//                        while (attributeNames.hasMoreElements()) {
//
//                            String attributeName = attributeNames.nextElement();
//                            if (!attributeName.equals("currentUser") && !s) {
//                                session.removeAttribute(attributeName);
//                            }
//
//                        }
//
//                    }

                    session.setAttribute("success", "You pay reservation fee successfully");
//                    BookingAppointmentHistory ba = (BookingAppointmentHistory) sessioban.getAttribute("patientBooking");
                    int patientBookingId = (int) session.getAttribute("patientBookingId");
                    BookingAppointmentHistory ba = new DBBookingMedicalAppointment().getAppointmentEmail(patientBookingId);
                    PatientGetByIdDTO patient = new PatientDAO().getPatientById(String.valueOf(ba.getPatient()));
                    Slot slot = new SlotDAO().getSlotByID(ba.getID());
                    ProcedureCodes serviceName = new ServiceDAO().getServiceById(ba.getService().getId());

                    Email.sendBookingAppointment(ba.getPatient().getEmail(),ba.getPatient().getName() , ba.getDate(), ba.getService().getName(), ba.getRoom().getName(), ba.getSlot().getStartedTime(), ba.getSlot().getEndTime());
                    session.removeAttribute("patientBooking");
                    response.sendRedirect("patient/viewAppointmentHistory");
                } catch (SQLException ex) {
                    Logger.getLogger(PaymentController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                session.setAttribute("deleteSuccess", "You pay reservation fee fail");
                response.sendRedirect("patient/viewAppointmentHistory");
            }

        } else {
            response.getWriter().print("invalid signature");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
