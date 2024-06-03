/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package validation;
import java.sql.*;
import java.time.LocalDate;
import java.time.Period;
/**
 *
 * @author ngphn
 */
public class Validation {
    public static boolean strongPassword(String password) {
        return password.trim().matches("^((?=\\S*?[A-Z])(?=\\S*?[a-z])(?=\\S*?[0-9]).{7,})\\S$");
    }

    //fulname
    public boolean isName(String name){
        String fulname= name.trim();
        return fulname.length()>=2 && fulname.length()<=50;

    }
   
    //phone number   
    public boolean isPhoneNumber(String numberPhone) {
        return numberPhone.trim().matches("\\d{10}");
    }
    
    //email
    
     public boolean isEmail(String email) {
        return email.trim().matches("^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$");
    }
     
    //Medical code    
    public boolean isMedicalCode(String medicalCode) {
        return medicalCode.trim().matches("\\d{10}");
    }
    
    //Date of birth
    public boolean isDateOfBirth(String dobStr){
        String dob = dobStr.trim();
        try {
            Date.valueOf(dob);
            return true;
        } catch (IllegalArgumentException e) {
            return false;
        }
    }
    
    public boolean isDistantDOB(Date dob){
        LocalDate birthDate = dob.toLocalDate();
        LocalDate today = LocalDate.now();

        // Check if the birth date is in the future
        if (birthDate.isAfter(today)) {
            return false;
        }

        // Check if the birth date is too far in the past (e.g., more than 150 years ago)
        if (birthDate.isBefore(today.minusYears(150))) {
            return false;
        }

        // Check if the age is at least 18 years
        if (Period.between(birthDate, today).getYears() < 18) {
            return false;
        }
        return true;
    }
    
    
    
    //Address
    public boolean isAddress(String place){
        String address = place.trim();

        return address.length()>=2 && address.length()<=1000;
        
    }
    
    
}
