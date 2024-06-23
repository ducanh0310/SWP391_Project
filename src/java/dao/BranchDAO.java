/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import model.Branch;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ngphn
 */
public class BranchDAO extends DBContext {

    public ArrayList<Branch> getAllBranch() throws SQLException {
        String query = "SELECT * FROM branch";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = (Connection) getConnection();
            statement = connection.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            ArrayList<Branch> branches = new ArrayList<>();
            while (rs.next()) {
                Branch branch = new Branch();
                branch.setId(rs.getInt("branch_id"));
                branch.setCity(rs.getString("city"));
                branch.setManagerId(rs.getInt("manager_id"));
                branch.setReceptionist1Id(rs.getInt("receptionist1_id"));
                branch.setReceptionist2Id(rs.getInt("receptionist2_id"));
                branches.add(branch);
            }
            return branches;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return null;
    }
    public static void main(String[] args) {
        try {
            ArrayList<Branch> b = new BranchDAO().getAllBranch();
            System.out.println(b);
        } catch (SQLException ex) {
            Logger.getLogger(BranchDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
