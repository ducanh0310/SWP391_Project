/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.lang.RuntimeException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.User;

/**
 *
 * @author trung
 */
public class UserDAO extends DBContext {

    private final Connection connection;
    
    public UserDAO(){
        this.connection = DBContext.getConnection();
    }

    public User checkUser(String username, String password) {
        String sql = "select * from [User_account] where username = ? and password = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString(1),
                         rs.getString(2),
                         rs.getInt(3),
                         rs.getString(4),
                         rs.getString(5));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) throws ClassNotFoundException {
        UserDAO ud = new UserDAO();
        System.out.println("Hello");
        User user = ud.checkUser("akiti7935", "akiti7935");
        if (user != null) {
            System.out.println(user.getName() + " " + user.getPatient_Id() + " " + user.getEmployee_Id());
        } else {
            System.out.println("User not found or incorrect username/password.");
        }
    }

    public ArrayList<User> getAll() {
        ArrayList<User> list = new ArrayList<>();
        String sql = "select * from User_account";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5));
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    
    
    public User getUserByPatientId(int patientId) {
        try {
            String query = "SELECT * FROM User_account WHERE patient_id = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, patientId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                User u = new User(rs.getString(1),
                         rs.getString(2),
                         rs.getInt(3),
                         rs.getString(4),
                         rs.getString(5));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
