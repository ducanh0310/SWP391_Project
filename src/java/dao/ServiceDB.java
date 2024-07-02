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
        try {
            Connection connection = null;
            PreparedStatement statement = null;
            connection = getConnection();
            String sql = "SELECT [procedure_id], [procedure_name], [price] FROM [dbo].[Procedure_codes]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ProcedureCodes p = new ProcedureCodes();
                p.setProcedure_id(rs.getInt("procedure_id"));
                p.setProcedure_name(rs.getString("procedure_name"));
                p.setPrice(rs.getString("price"));
                service.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return service;
    }

    public static void main(String[] args) {
        ServiceDB sv = new ServiceDB();
        System.out.println(sv.getService());
    }
}
