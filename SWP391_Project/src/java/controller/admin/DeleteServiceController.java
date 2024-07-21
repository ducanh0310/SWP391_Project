/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.ServiceDB;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Gia Huy
 */
@WebServlet(name = "DeleteService1Controller", urlPatterns = {"/deleteService"})
public class DeleteServiceController extends HttpServlet {

   
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {}
        

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String type = request.getParameter("serviceID");
            ServiceDB db = new ServiceDB();
            db.deleteService(Integer.parseInt(type));
            response.sendRedirect("serviceDetail");
        } catch (SQLException ex) {
            Logger.getLogger(DeleteServiceController.class.getName()).log(Level.SEVERE, null, ex);
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