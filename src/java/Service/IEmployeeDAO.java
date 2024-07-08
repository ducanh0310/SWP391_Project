/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Service;

import java.sql.SQLException;
import java.util.ArrayList;
import model.Appointment;
import model.Employee;
import model.Employees;

/**
 *
 * @author trung
 */
public interface IEmployeeDAO {
    public Employee getEmployeeByEmployeeId(String employeeId) throws SQLException;
    public ArrayList<Employees> getEmployees() throws SQLException;
    public ArrayList<Employees> getEmployeeByName(String key) throws SQLException;
    public void deleteEmployee(String key) throws SQLException;
    public ArrayList<Appointment> getAppointmentByDentisId(String DentistId) throws SQLException;
}