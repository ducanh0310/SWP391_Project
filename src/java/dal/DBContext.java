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
import java.sql.*;
/**
 *
 * @author ngphn
 */
public class DBContext {

    public Connection connection;

    public DBContext() throws ClassNotFoundException {
        try {
            String user = "sa";
            String pass = "30020102";
            String url = "jdbc:sqlserver://WINDYVU:1433;databaseName=SWP391_Project;encrypt=true;trustServerCertificate=true;";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    public static Connection getConnection() {
        Connection connection = null;
        try {
            String user = "sa";
            String pass = "30020102";
            String url = "jdbc:sqlserver://WINDYVU:1433;databaseName=SWP391_Project;encrypt=true;trustServerCertificate=true;";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return connection;
    }

    public void closeConnection(Connection connection) throws SQLException {
        if (connection != null) {
            connection.close();
        }
    }

    public void closePreparedStatement(PreparedStatement preparedStatement) throws SQLException {
        if (preparedStatement != null) {
            preparedStatement.close();
        }
    }
    public static void main(String[] args) throws ClassNotFoundException {
        DBContext db = new DBContext();
        System.out.println("Hello");
    }
}