/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package validation;

import java.time.Period;
import java.sql.*;
import java.time.LocalDate;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author ngphn
 */
public class Validation {

    public static boolean isValidPassword(String password) {
        // Check if the password is at least 8 characters long
        if (password.length() < 8 || password.length() > 128) {
            return false;
        }

        boolean hasLowerCase = false;
        boolean hasUpperCase = false;
        boolean hasDigit = false;
        boolean hasSpace = false;
        // Iterate through each character of the password
        for (char ch : password.toCharArray()) {
            if (Character.isLowerCase(ch)) {
                hasLowerCase = true;
            } else if (Character.isUpperCase(ch)) {
                hasUpperCase = true;
            } else if (Character.isDigit(ch)) {
                hasDigit = true;
            } else if (Character.isSpaceChar(ch)) {
                hasSpace = true;
            }

            // Check if all requirements are met
            if (!hasSpace && hasLowerCase && hasUpperCase && hasDigit) {
                return true;
            }
        }

        // If any requirement is not met, return false
        return false;
    }

    //fulname
    public boolean isName(String name) {
        String fulname = name.trim();
        return fulname.length() >= 2 && fulname.length() <= 50;

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
    public boolean isDateOfBirth(String dobStr) {
        String dob = dobStr.trim();
        try {
            Date.valueOf(dob);
            return true;
        } catch (IllegalArgumentException e) {
            return false;
        }
    }

    public boolean isDistantDOB(Date dob) {
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
    public boolean isAddress(String place) {
        String address = place.trim();

        return address.length() >= 2 && address.length() <= 1000;

    }
    private static final String USERNAME_PATTERN = "^(?=.*[a-zA-Z])[a-zA-Z0-9!@._-]{3,15}$";

    public static boolean isValidUsername(String username) {
        // Compile the regular expression
        Pattern pattern = Pattern.compile(USERNAME_PATTERN);

        // Match the username against the pattern
        Matcher matcher = pattern.matcher(username);

        // Return whether the username matches the pattern
        return matcher.matches();
    }

    public boolean isDistantDOB14(Date dob) {
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
        if (Period.between(birthDate, today).getYears() < 14) {
            return false;
        }
        return true;
    }

    public String checkPrice(String price) {
        if (price == null || price.trim().isEmpty()) {
            return "Price is required.";
        }

        try {
            double priceValue = Double.parseDouble(price);
            if (priceValue < 0) {
                return "Price must be a positive number.";
            }
        } catch (NumberFormatException e) {
            return "Price must be a valid number.";
        }

        return null;
    }

    public static void main(String[] args) {
        // Test usernames
        String[] usernames = {"user_1", "user!23", "usa", "valid username", "12345", "''''"};

        for (String username : usernames) {
            boolean isValid = isValidPassword("Nam 020503");
            System.out.println(isValid);
        }
    }

}
