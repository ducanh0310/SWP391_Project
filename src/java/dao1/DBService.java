/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao1;

import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Service;

/**
 *
 * @author Vu Minh Quan
 */
public class DBService extends DBContext {

    public DBService() throws ClassNotFoundException {
        super(); // Calls the constructor of DBContext to initialize the connection
    }

    public ArrayList<Service> getService() {
        ArrayList<Service> arrService = new ArrayList<>();
        try {
            String sql = "SELECT procedure_id, procedure_name from Procedure_codes";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs =stm.executeQuery();
             while(rs.next()){
                Service service= new Service();
                service.setId(rs.getInt("procedure_id"));
                service.setName(rs.getString("procedure_name"));
                arrService.add(service);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arrService;

    }
}
