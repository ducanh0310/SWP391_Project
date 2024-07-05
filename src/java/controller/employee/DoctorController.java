/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import dal.DoctorDB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Prescription;

/**
 *
 * @author Gia Huy
 */
public class DoctorController extends HttpServlet {

   @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
        // Lấy danh sách đơn thuốc từ lớp DoctorDB
        DoctorDB doctorDB = new DoctorDB();
        ArrayList<Prescription> prescriptions = doctorDB.getPrescription();
        
        // Đặt danh sách đơn thuốc vào thuộc tính của request
        request.setAttribute("prescriptions", prescriptions);
        
        // Chuyển tiếp request đến prescription.jsp để hiển thị dữ liệu
        request.getRequestDispatcher("prescription.jsp").forward(request, response);
        
    } catch (Exception e) {
        // Xử lý ngoại lệ bằng cách chuyển hướng tới errorPage.jsp
        request.setAttribute("error", e.getMessage()); // truyền thông tin lỗi vào request để hiển thị trang lỗi
        request.getRequestDispatcher("errorPage.jsp").forward(request, response);
    }
}
   

}
