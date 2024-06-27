/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ProcedureCodes;

/**
 *
 * @author Gia Huy
 */
public class ServiceDB extends DBContext {
    
    public ArrayList<ProcedureCodes> getService() {
        ArrayList<ProcedureCodes> service = new ArrayList<>();
        try {
            String sql = "SELECT [procedure_id], [procedure_name], [price],[type] FROM [dbo].[Procedure_codes]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ProcedureCodes p = new ProcedureCodes();
                p.setProcedure_id(rs.getInt("procedure_id"));
                p.setProcedure_name(rs.getString("procedure_name"));
                p.setPrice(rs.getString("price"));
                p.setType(rs.getString("type"));
                service.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return service;
    }
    
    public void deleteService(int serviceId){
        try {
            //ProcedureCodes deletedService = null;
            String sql="""
                               UPDATE [dbo].[Procedure_codes]
                                  SET [type] = ?
                                WHERE [Procedure_codes].procedure_id=?""";
            
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "i");
            statement.setInt(2, serviceId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
//    public Ar deleteService(int serviceId) {
//        ProcedureCodes deletedService = null;
//        try {
//            String sql = "SELECT [procedure_id], [procedure_name], [price],[type] FROM Procedure_codes WHERE procedure_id = ?";
//            PreparedStatement statement = connection.prepareStatement(sql);
//            statement.setInt(1, serviceId);
//            ResultSet rs = statement.executeQuery();
//            while (rs.next()) {
//                ProcedureCodes p = new ProcedureCodes();
//                p.setProcedure_id(rs.getInt("procedure_id"));
//                p.setProcedure_name(rs.getString("procedure_name"));
//                p.setPrice(rs.getString("price"));
//                p.setType(rs.getString("type"));
//            }
//            int rowsAffected = statement.executeUpdate();
//            if (rowsAffected > 0) {
//                System.out.println("Dịch vụ đã được xóa thành công.");
//                deletedService = new ProcedureCodes();
//                deletedService.setProcedure_id(serviceId);
//            } else {
//                System.out.println("Không tìm thấy dịch vụ để xóa.");
//            }
//            statement.close();
//            connection.close();
//        } catch (SQLException e) {
//            System.out.println("Lỗi khi xóa dịch vụ: " + e.getMessage());
//        }
//        return deletedService;
//    }
    
//    public static void main(String[] args) {
//        ServiceDB sv = new ServiceDB();
//        System.out.println(sv.deleteService(1));
//    }
}
