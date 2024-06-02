/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.patient;

import dao1.DBAccount;
import dao1.DBPatientProfile;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.PatientInfo;
import model.User;

/**
 *
 * @author Vu Minh Quan
 */
public class ViewProfilePatientController extends HttpServlet {
   
     

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //elmurder666
        //String username = request.getParameter("username");-> thêm câu lệnh này thì sẽ có tham số trên url 
            HttpSession session = request.getSession();
           User currentUser = (User) session.getAttribute("currentUser");
        try {
            DBPatientProfile dbProfile = new DBPatientProfile();            
           
            DBAccount db = new DBAccount();
            Account acc= db.showAccountInfo(currentUser.getName());
            request.setAttribute("image", acc.getImage());
            PatientInfo patientInfo= dbProfile.getInfoPatient(currentUser.getName()); 
 
              
            request.setAttribute("paInfo", patientInfo);
            request.setAttribute("username", currentUser.getName());

            request.getRequestDispatcher("../../view/patient/viewProfilePatient.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewProfilePatientController.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
