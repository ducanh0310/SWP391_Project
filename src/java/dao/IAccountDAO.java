/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.SQLException;

/**
 *
 * @author ngphn
 */
public interface IAccountDAO {
    public boolean addPatient(String address, String name, String gender, String email, Date DOB) throws SQLException;
}
