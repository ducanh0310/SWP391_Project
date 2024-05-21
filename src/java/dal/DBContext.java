/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ngphn
 */
public class DBContext {

    Connection connection;

//    public DBContext() throws ClassNotFoundException {
//        try {
//            String user = "sa";
//            String pass = "namnp";
//            String url = "jdbc:sqlserver://localhost:1433;databaseName=SWP391_Project";
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//            connection = DriverManager.getConnection(url, user, pass);
//        } catch (SQLException e) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
//        }
//    }
    public static Connection getConnection() {
        Connection connection = null;
        try {
            String user = "sa";
            String pass = "namnp";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=SWP391_Project";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return connection;
    }

    public static void main(String[] args) throws ClassNotFoundException {
        DBContext db = new DBContext();
        System.out.println("Hello");
    }
}
