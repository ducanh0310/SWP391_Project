/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.employee;

import dao1.DBEmployeeProfile;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DoctorCertification;
import model.Employee;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name="ViewProfileEmployeeController", urlPatterns={"/employee/profile/view"})
public class ViewProfileEmployeeController extends HttpServlet {
   
    

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        try {
            DBEmployeeProfile dbEm=new DBEmployeeProfile();
            Employee emInfo = dbEm.getInfoEmployee("johnli255a");
            if("d".equals(emInfo.getEmployeeType())){
                ArrayList<DoctorCertification> arrayCerti= dbEm.getCertification("johnli255a");
                request.setAttribute("arrayCerti", arrayCerti);
                request.setAttribute("emInfo", emInfo);
                request.setAttribute("username", "johnli255a");
                request.getRequestDispatcher("../../view/employee/doctor/viewProfileDoctor.jsp").forward(request, response);
            }
            if("b".equals(emInfo.getEmployeeType())){
                request.setAttribute("emInfo", emInfo);
                request.setAttribute("username", "kdo2342");
                request.getRequestDispatcher("../../view/employee/admin/viewProfileAdmin.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(ViewProfileEmployeeController.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
            
            
      
    } 

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        String deleteCert = request.getParameter("deleteCert");
        
        if (deleteCert != null) {
            try {
                // Process deletion
                int certId = Integer.parseInt(deleteCert);
                DBEmployeeProfile db = new DBEmployeeProfile();
                db.deleteCertification(certId);
                response.sendRedirect("view");
                return;
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ViewProfileEmployeeController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }


    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
