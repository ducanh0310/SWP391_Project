/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ngphn
 */
public class DBContext {

//    public Connection connection;
//
//    public DBContext() throws ClassNotFoundException {
//        try {
//            String user = "sa";
//            String pass = "namnp";
//            String url = "jdbc:sqlserver://localhost:1433;databaseName=SWP391_Project;encrypt=true;trustServerCertificate=true";
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//            connection = DriverManager.getConnection(url, user, pass);
//        } catch (SQLException e) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
//        }
//    }
    public Connection getConnection() {
        Connection connection2 = null;
        try {
            String user = "sa";
            String pass = "123121";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=SWP391_Project;encrypt=true;trustServerCertificate=true";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection2 = DriverManager.getConnection(url, user, pass);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return connection2;
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

    public static void main(String[] args) {
        DBContext db = new DBContext();
        System.out.println("Hello" + db + "\n" + db.getConnection());
        System.out.println("abc");
    }
}
