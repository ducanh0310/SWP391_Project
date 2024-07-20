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
        String sql = "SELECT * FROM [dbo].[Procedure_codes]";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
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
