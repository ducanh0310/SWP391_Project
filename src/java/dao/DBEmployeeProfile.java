/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author Vu Minh Quan
 */
import dal.DBContext;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Branch;
import model.Employee;
import java.sql.*;
import java.util.ArrayList;
import model.DoctorCertification;

/**
 *
 * @author Vu Minh Quan
 */
public class DBEmployeeProfile extends DBContext {

    public DBEmployeeProfile() throws ClassNotFoundException {
        super(); // Calls the constructor of DBContext to initialize the connection
    }

    //Database for view profile
    public Employee getInfoEmployee(String username) throws SQLException {
        Employee employeeInfo = new Employee();
        String query = """
                       Select e.employee_id, e.employee_sin, e.employee_type, e.name, e.address, e.annual_salary,e.gender, e.dob, e.phone, e.email,e.branch_id, b.city from Employee e
                       join Branch b on b.branch_id=e.branch_id
                       join User_account u on u.employee_id=e.employee_id
                       where u.username =?""";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Branch br = new Branch();
                employeeInfo.setId(rs.getInt("employee_id"));
                employeeInfo.setEmployeeSin(rs.getString("employee_sin"));
                employeeInfo.setEmployeeType(rs.getString("employee_type"));
                employeeInfo.setName(rs.getString("name"));
                employeeInfo.setAnnualSalary(rs.getFloat("annual_salary"));
                employeeInfo.setAddress(rs.getString("address"));
                employeeInfo.setGender(rs.getString("gender"));
                employeeInfo.setDob(rs.getDate("dob"));
                employeeInfo.setPhoneNumber(rs.getString("phone"));
                employeeInfo.setEmail(rs.getString("email"));
                employeeInfo.setBranchId(rs.getInt("branch_id"));
                br.setCity(rs.getString("city"));
                employeeInfo.setBranch(br);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBPatientProfile.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return employeeInfo;
    }

    //Database fo edit profile
    public void editInfoEmployee(Employee emInfo) throws SQLException {
        String query = """
                        UPDATE [dbo].[Employee]
                            SET [employee_sin] = ?
                               ,[employee_type] = ?
                               ,[name] = ?
                               ,[address] = ?
                               ,[annual_salary] = ?
                               ,[branch_id] = ?
                               ,[gender] = ?
                               ,[phone] = ?
                               ,[dob] = ?
                               ,[email] = ?
                          WHERE [employee_id]=?""";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, emInfo.getEmployeeSin());
            statement.setString(2, emInfo.getEmployeeType());
            statement.setString(3, emInfo.getName());
            statement.setString(4, emInfo.getAddress());
            statement.setFloat(5, emInfo.getAnnualSalary());
            statement.setInt(6, emInfo.getBranchId());
            statement.setString(7, emInfo.getGender());
            statement.setString(8, emInfo.getPhoneNumber());
            statement.setDate(9, emInfo.getDob());
            statement.setString(10, emInfo.getEmail());
            statement.setInt(11, emInfo.getId());
            statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DBPatientProfile.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }

    }
    //show certification

    public ArrayList<DoctorCertification> getCertification(String username) throws SQLException {
        ArrayList<DoctorCertification> arrayCerti = new ArrayList<>();
        String query = """
                                   Select dc.id, dc.name_cetification, dc.id_doctor, dc.url from Doctor_Certification dc
                                   join Employee e on e.employee_id = dc.id_doctor
                                   join User_account u on u.employee_id = e.employee_id
                                   where u.username=?""";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                DoctorCertification dc = new DoctorCertification();
                dc.setId(rs.getInt("id"));
                dc.setName(rs.getString("name_cetification"));
                dc.setIdDoctor(rs.getInt("id_doctor"));
                dc.setUrl(rs.getString("url"));
                arrayCerti.add(dc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBEmployeeProfile.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
        return arrayCerti;
    }

    //insert certification 
    public void insertCertification(String nameCert, String url, int id) throws SQLException {
        String query = """
                    INSERT INTO [dbo].[Doctor_Certification]
                               ([url]
                               ,[id_doctor]
                               ,[name_cetification])
                         VALUES
                               (?
                               ,?
                               ,?)""";

        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, url);
            statement.setInt(2, id);
            statement.setString(3, nameCert); // Corrected the index and value
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBEmployeeProfile.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
    }

    //Update certificate 
    public void updateCertificate(String username, String imageName, String imageURL, int imageId) throws SQLException {
        String query = """
                                   UPDATE [dbo].[Doctor_Certification]
                                      SET [url] = ?
                                         ,[name_cetification] = ?
                                    WHERE [id]=?""";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, imageURL);
            statement.setString(2, imageName);
            statement.setInt(3, imageId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBEmployeeProfile.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
    }

    //Delete certification
    public void deleteCertification(int certId) throws SQLException {
        String query = "DELETE FROM [dbo].[Doctor_Certification] WHERE id = ?";
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, certId);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBEmployeeProfile.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closePreparedStatement(statement);
            closeConnection(connection);
        }
    }

}
