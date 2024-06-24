/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.ServiceDB;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.ProcedureCodes;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Gia Huy
 */
@WebServlet(name = "DeleteServiceController", urlPatterns = {"/delete-service"})
public class DeleteServiceController extends HttpServlet {

   private static final long serialVersionUID = 1L;

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy serviceId từ URL
        String pathInfo = request.getPathInfo();
        String[] pathParts = pathInfo.split("/");
        String serviceId = pathParts[1];

        // Kiểm tra serviceId có hợp lệ (không rỗng và là một số nguyên dương)
        if (serviceId != null && !serviceId.isEmpty()) {
            try {
                int id = Integer.parseInt(serviceId);

                // Lấy kết nối từ DBContext
                ArrayList<ProcedureCodes> sv=new ServiceDB().getService();
                String sql="Select username, password, type_id, patient_id, employee_id, image  from User_account where username=?";
                try (PreparedStatement statement = sv.prepareStatement(sql)) {
                    statement.setInt(1, id);
                    int rowsDeleted = statement.executeUpdate();
                    if (rowsDeleted > 0) {
                        // Xóa thành công
                        response.setStatus(HttpServletResponse.SC_OK);
                        PrintWriter out = response.getWriter();
                        out.println("Dịch vụ đã được xóa thành công!");
                    } else {
                        // Không tìm thấy dịch vụ để xóa
                        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                        PrintWriter out = response.getWriter();
                        out.println("Không tìm thấy dịch vụ để xóa!");
                    }
                    // Đóng tài nguyên
                }
            } catch (NumberFormatException e) {
                // serviceId không phải là một số nguyên hợp lệ
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                PrintWriter out = response.getWriter();
                out.println("serviceId không hợp lệ");
            } catch (SQLException e) {
                // Lỗi kết nối cơ sở dữ liệu hoặc xóa dịch vụ
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                PrintWriter out = response.getWriter();
                out.println("Đã xảy ra lỗi khi xóa dịch vụ!");
            }
        } else {
            // serviceId không được cung cấp hoặc rỗng
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            PrintWriter out = response.getWriter();
            out.println("serviceId không được cung cấp");
        }
    }

}
