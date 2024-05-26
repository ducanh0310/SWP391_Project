/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.lang.RuntimeException;
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
    
    public UserDAO() throws ClassNotFoundException {
        super();
        if (connection == null) {
            throw new RuntimeException("Không thể kết nối đến cơ sở dữ liệu");
        }
    }
    
    public User check(String username, String password) {
        String sql = "select * from [User_account] "
                + " where username = ? "
                + " and password = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
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
}
