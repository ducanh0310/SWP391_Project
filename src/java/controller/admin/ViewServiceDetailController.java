/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.ServiceDB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.ProcedureCodes;

/**
 *
 * @author Gia Huy
 */
public class ViewServiceDetailController extends HttpServlet {

    private ServiceDB serviceDB;

    @Override
    public void init() throws ServletException {
        super.init();
        serviceDB = new ServiceDB();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //int sID = Integer.parseInt(request.getParameter("serviceId"));
        ArrayList<ProcedureCodes> services = serviceDB.getService();
     
        request.setAttribute("services", services);
        request.getRequestDispatcher("viewServiceDetail.jsp").forward(request, response);
    }

//    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        try {
//            int serviceId = Integer.parseInt(request.getPathInfo().substring(1)); // Lấy serviceId từ URL
//
//            //ProcedureCodes deletedService = serviceDB.deleteService(serviceId);
//
//            if (deletedService != null) {
//                response.setStatus(HttpServletResponse.SC_OK);
//            } else {
//                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
//            }
//        } catch (NumberFormatException e) {
//            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//        } catch (Exception e) {
//            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//        }
//    }

}
