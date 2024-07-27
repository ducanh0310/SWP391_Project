/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import dao.DBAccount;
import dao.DBEmployeeProfile;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Timer;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.DoctorCertification;
import model.Employee;
import model.User;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name = "ViewProfileEmployeeController", urlPatterns = {"/employee/profile/view"})
public class ViewProfileEmployeeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            session.invalidate();
            response.sendRedirect("../../index.jsp");
            return;
        } else if (currentUser.getPatient_Id() != null) {
            request.getRequestDispatcher("../../accessDenied.jsp").forward(request, response);
            session.invalidate();
            return;
        }
        try {
            DBEmployeeProfile dbEm = new DBEmployeeProfile();
            Employee emInfo = dbEm.getInfoEmployee(currentUser.getName());
            DBAccount db = new DBAccount();
            Account acc = db.showAccountInfo(currentUser.getName());
            ArrayList<DoctorCertification> arrayCerti = dbEm.getCertification(currentUser.getName());
            request.setAttribute("arrayCerti", arrayCerti);
            request.setAttribute("image", acc.getImage());
            request.setAttribute("emInfo", emInfo);
            request.setAttribute("username", currentUser.getName());
            //johnli255a
            if ("d".equals(emInfo.getEmployeeType())) {
                request.getRequestDispatcher("../../view/employee/doctor/viewProfileDoctor.jsp").forward(request, response);
            }
            //kdo2342
            if ("b".equals(emInfo.getEmployeeType())) {
                request.getRequestDispatcher("../../view/employee/admin/viewProfileAdmin.jsp").forward(request, response);
            }
            if ("n".equals(emInfo.getEmployeeType())) {
                request.getRequestDispatcher("../../view/employee/nurse/viewProfileNurse.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            java.util.logging.Logger.getLogger(ViewProfileEmployeeController.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        String deleteCert = request.getParameter("deleteCert");

        if (deleteCert != null) {
            try {
                // Process deletion
                int certId = Integer.parseInt(deleteCert);
                DBEmployeeProfile db = new DBEmployeeProfile();
                db.deleteCertification(certId);

                Timer timer = new Timer();
                session.setAttribute("DeleteCertificationSuccess", "Deleting profile successfully");
                timer.schedule(new TimerTask() {
                    @Override
                    public void run() {
                        session.removeAttribute("DeleteCertificationSuccess");
                    }
                }, 5000);
                response.sendRedirect("view");
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ViewProfileEmployeeController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
