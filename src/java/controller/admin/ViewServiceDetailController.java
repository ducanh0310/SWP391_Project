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
import java.util.ArrayList;
import model.ProcedureCodes;

/**
 *
 * @author Gia Huy
 */@WebServlet(name="ViewServiceDetailController", urlPatterns={"/viewservices"})

public class ViewServiceDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ServiceDB service = new ServiceDB();
            ArrayList<ProcedureCodes> services = service.getService();
            request.setAttribute("services", services);
            request.getRequestDispatcher("view/employee/admin/viewServiceDetail.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }

}