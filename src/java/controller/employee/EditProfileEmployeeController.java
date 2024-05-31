/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.employee;

import controller.patient.ViewProfilePatientController;
import dao1.DBEmployeeProfile;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Employee;

/**
 *
 * @author Vu Minh Quan
 */
public class EditProfileEmployeeController extends HttpServlet {
   
   

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       try {
            DBEmployeeProfile db = new DBEmployeeProfile();            
            Employee emInfo= db.getInfoEmployee("bobmley1");            
            request.setAttribute("emInfo", emInfo);
            request.setAttribute("username", "bobmley1");

            request.getRequestDispatcher("../../view/employee/editProfileEmployee.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewProfilePatientController.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            Employee emInfo = new Employee();
            emInfo.setId(Integer.parseInt(request.getParameter("id")));
            emInfo.setName(request.getParameter("fullname"));
            emInfo.setPhoneNumber(request.getParameter("phoneNumber"));
            emInfo.setEmail(request.getParameter("email"));
            emInfo.setEmployeeSin(Integer.parseInt(request.getParameter("medicineCode")));
            emInfo.setGender(request.getParameter("gender"));
            emInfo.setDob(Date.valueOf(request.getParameter("dob")));
            emInfo.setEmployeeType(request.getParameter("role"));
            emInfo.setAnnualSalary(Float.parseFloat(request.getParameter("salary")));
            emInfo.setAddress(request.getParameter("address"));
            emInfo.setBranchId(Integer.parseInt(request.getParameter("branchid"))); 
            
            DBEmployeeProfile db = new DBEmployeeProfile();
            db.editInfoEmployee(emInfo);
            response.sendRedirect("view");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditProfileEmployeeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
