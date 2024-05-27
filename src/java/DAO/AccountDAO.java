package DAO;

import dal.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Logger;

public class AccountDAO {

    private final Connection connection;

    public AccountDAO() {
        this.connection = DBContext.getConnection();
    }
    public ArrayList<String> getAllAccount() {
        ArrayList<String> list = new ArrayList<>();
        String query = "SELECT username FROM User_account";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("username"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
        }
        return list;
    }


    public ArrayList<String> getAllEmail() {
        ArrayList<String> list = new ArrayList<>();
        String query = "SELECT email FROM Patient";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("email"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
        }
        return list;
    }
    public boolean addPatient(String address, String name, String gender, String email, Date DOB ) {
        String query = "INSERT INTO Patient_info(address, name, gender, email, DOB) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, address);
            statement.setString(2, name);
            statement.setString(3, gender);
            statement.setString(4, email);
            statement.setDate(5, DOB);
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
            return false;
        }
    }
    public boolean addAccount(String username, String password, int patientId, int type_id) {
        String query = "INSERT INTO User_account(username, password, patient_id, type_id) VALUES(?,?,?, 1)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setInt(3, patientId);
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName());
            return false;
        }
    }
    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        ArrayList<String> listUser = dao.getAllAccount();
         ArrayList<String> listEmail = dao.getAllEmail();
         listUser.addAll(listEmail);
        for (String s : listUser) {
            System.out.println(s);
        }
    }

}
