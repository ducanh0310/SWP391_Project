/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ngphn
 */
public interface IAccountDAO {

    public boolean addPatient(String address, String name, String gender, String email, Date DOB) throws SQLException;

    public ArrayList<String> getAllAccount() throws SQLException;

    public ArrayList<String> getAllEmail() throws SQLException;

    public boolean addAccount(String username, String password, int patientId, int type_id) throws SQLException;

    public boolean checkAccount(String username) throws SQLException;

    public boolean checkEmail(String email) throws SQLException;

    public boolean checkUserNameAndEmail(String acc) throws SQLException;
    public String getEmailByUsername(String username) throws SQLException;
    public boolean addPatientAccount(String email, String username, String password);
    public boolean updatePasswordByEmail(String email, String password) throws SQLException;
}
