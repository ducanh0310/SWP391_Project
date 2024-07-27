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
import model.Employee;
import model.ProcedureCodes;

/**
 *
 * @author Gia Huy
 */
public class ServiceDB extends DBContext {

    public ArrayList<ProcedureCodes> getService() throws SQLException {
        ArrayList<ProcedureCodes> service = new ArrayList<>();
        String sql = "SELECT p.[procedure_id], p.[procedure_name], p.[price], p.[description], p.[doctor_id], p.[type] FROM [SWP391_Project].[dbo].[Procedure_codes] AS p LEFT JOIN [SWP391_Project].[dbo].[Employee] AS d ON p.[doctor_id] = d.[employee_id] ORDER BY CASE WHEN p.[type] = 'a' THEN 0 ELSE 1 END, p.[procedure_name];";
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
                p.setDescription(rs.getString("description"));
                p.setType(rs.getString("type"));
                EmployeeDAO employeeDAO = new EmployeeDAO();
                Employee e = employeeDAO.getEmployeeByEmployeeId(rs.getInt("doctor_id"));
                p.setEmployee(e);
                service.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDB.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
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

    public ProcedureCodes getProcedureCodesDetail(int pid) {
        String sql = """
                         SELECT [procedure_id]
                               ,[procedure_name]
                               ,[price]
                               ,[doctor_id]
                               ,[type]
                               ,[description]
                               ,[procedure], [procedure2],[procedure3],[procedure4],[procedure5]
                           FROM [dbo].[Procedure_codes]WHERE [procedure_id]=?""";
        Connection connection = null;
        PreparedStatement stm = null;
        try {
            connection = getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ProcedureCodes p = new ProcedureCodes();
                p.setProcedure_id(rs.getInt("procedure_id"));
                p.setProcedure_name(rs.getString("procedure_name"));
                p.setPrice(rs.getString("price"));
                p.setDescription(rs.getString("description"));

                return p;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ServiceDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
