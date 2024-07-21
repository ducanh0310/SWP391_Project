/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.Connection;
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
<<<<<<< HEAD:SWP391_Project/src/java/dao/ServiceDB.java
        String sql = "SELECT * FROM Procedure_codes ORDER BY CASE WHEN type = 'a' THEN 0 ELSE 1 END, procedure_name";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
=======
        try {
            Connection connection = null;
            PreparedStatement statement = null;
            connection = getConnection();
            String sql = "SELECT [procedure_id], [procedure_name], [price] FROM [dbo].[Procedure_codes]";
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/dao/ServiceDB.java
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ProcedureCodes p = new ProcedureCodes();
                p.setProcedure_id(rs.getInt("procedure_id"));
                p.setProcedure_name(rs.getString("procedure_name"));
                p.setPrice(rs.getString("price"));
<<<<<<< HEAD:SWP391_Project/src/java/dao/ServiceDB.java
                p.setDescription(rs.getString("description"));
                p.setType(rs.getString("type"));
=======
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/dao/ServiceDB.java
                service.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return service;
    }

<<<<<<< HEAD:SWP391_Project/src/java/dao/ServiceDB.java
    public void deleteService(int serviceId) throws SQLException {
        String sql = """
                               UPDATE [dbo].[Procedure_codes]
                                  SET [type] = ?
                                WHERE [Procedure_codes].procedure_id=?""";
        Connection connection = null;
        PreparedStatement stm = null;
        try {
            connection = getConnection();
            stm = connection.prepareStatement(sql);
            //ProcedureCodes deletedService = null;
            stm.setString(1, "i");
            stm.setInt(2, serviceId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(stm);
            closeConnection(connection);
        }
    }

}
=======
    public static void main(String[] args) {
        ServiceDB sv = new ServiceDB();
        System.out.println(sv.getService());
    }
}
>>>>>>> 74c5e881ba536df6f8e64777e2abcd589ccb9743:src/java/dao/ServiceDB.java
