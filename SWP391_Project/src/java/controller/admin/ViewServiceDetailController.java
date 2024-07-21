/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.ServiceDB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
<<<<<<< HEAD:SWP391_Project/src/java/controller/admin/ViewServiceDetailController.java
import jakarta.servlet.http.HttpSession;
=======
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/controller/admin/ViewServiceDetailController.java
import java.util.ArrayList;
import model.ProcedureCodes;

/**
 *
 * @author Gia Huy
<<<<<<< HEAD:SWP391_Project/src/java/controller/admin/ViewServiceDetailController.java
 */
@WebServlet(name = "ViewServiceDetailController", urlPatterns = {"/viewservices"})
=======
 */@WebServlet(name="ViewServiceDetailController", urlPatterns={"/viewservices"})
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/controller/admin/ViewServiceDetailController.java

public class ViewServiceDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD:SWP391_Project/src/java/controller/admin/ViewServiceDetailController.java
        HttpSession session = request.getSession(false); // get existing session if exists
        if (session == null) {
            response.sendRedirect("login");
            return;
        }

        String userRole = (String) session.getAttribute("userRole");
        if (userRole == null || "patient".equals(userRole)) {
            // Redirect to error page or home page if userRole is patient or userRole is null
            response.sendRedirect("accessDenied.jsp"); // You can change this to a relevant page
            return;
        }
=======
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/controller/admin/ViewServiceDetailController.java
        try {
            ServiceDB service = new ServiceDB();
            ArrayList<ProcedureCodes> services = service.getService();
            request.setAttribute("services", services);
<<<<<<< HEAD:SWP391_Project/src/java/controller/admin/ViewServiceDetailController.java
            request.getRequestDispatcher("viewServiceDetail.jsp").forward(request, response);
=======
            request.getRequestDispatcher("view/employee/admin/viewServiceDetail.jsp").forward(request, response);
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/controller/admin/ViewServiceDetailController.java
        } catch (Exception e) {
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }

<<<<<<< HEAD:SWP391_Project/src/java/controller/admin/ViewServiceDetailController.java
}
=======
}
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/controller/admin/ViewServiceDetailController.java
