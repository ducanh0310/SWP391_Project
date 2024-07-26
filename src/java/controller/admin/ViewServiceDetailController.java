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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.ProcedureCodes;

/**
 *
 * @author Gia Huy
 */
@WebServlet(name = "ViewServiceDetailController", urlPatterns = {"/viewservices"})

public class ViewServiceDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        try {
            ServiceDB service = new ServiceDB();
            ArrayList<ProcedureCodes> services = service.getService();
            request.setAttribute("services", services);
            request.getRequestDispatcher("viewServiceDetail.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }

}
