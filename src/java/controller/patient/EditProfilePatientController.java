/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.patient;

import dao1.DBAccount;
import dao1.DBPatientProfile;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PatientInfo;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import model.Account;
import model.User;
import validation.Validation;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name = "EditProfilePatientController", urlPatterns = {"/patient/profile/edit"})

public class EditProfilePatientController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //elmurder666
            HttpSession session = request.getSession();
           User currentUser = (User) session.getAttribute("currentUser");
        try {
            DBPatientProfile db = new DBPatientProfile();            
            PatientInfo patientInfo= db.getInfoPatient(currentUser.getName());  
            DBAccount db1 = new DBAccount();
            Account acc= db1.showAccountInfo(currentUser.getName());
            request.setAttribute("image", acc.getImage());
            request.setAttribute("paInfo", patientInfo);
            request.setAttribute("username", currentUser.getName());

            request.getRequestDispatcher("../../view/patient/editProfilePatient.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewProfilePatientController.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
         User currentUser = (User) session.getAttribute("currentUser");
         Map<String, String> errorMsg = new HashMap<>();
    try {
        int patientId = Integer.parseInt(request.getParameter("id"));
        String patientSin = request.getParameter("medicineCode");
        String fullname = request.getParameter("fullname");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String dobStr = request.getParameter("dob");
        String address = request.getParameter("address");

        Validation valid= new Validation();
        // Validate name
        if (!valid.isName(fullname)) {
            errorMsg.put("fullname","Full name must be between 2 and 50 characters.") ;
        }
        
        //Validate phone number
        if (!valid.isPhoneNumber(phoneNumber)) {
            errorMsg.put("phoneNumber","Phone number must exactly 10 digits.") ;
        }

        // Validate email format
        if (!valid.isEmail(email)) {
            errorMsg.put("email","Invalid email format.");
        }

        //Validate Medical code
        int medicalCode =0;
        if(!valid.isMedicalCode(patientSin)){
            errorMsg.put("medicalCode","Medical code must exactly 10 digits.");
        }else{
            medicalCode=Integer.parseInt(patientSin);
        }
        
        // Validate date format
        Date dob=null;
        int flag=0;
        if(valid.isDateOfBirth(dobStr)==false){
            errorMsg.put("dob","Use yyyy-mm-dd.");
        }else{
            dob= Date.valueOf(dobStr);
            flag=1;
        }
        if(flag==1){
            if(valid.isDistantDOB(dob) == false ){
            errorMsg.put("dob","Your date of birth must before now and you must be 18 years or older.") ;
            }
        }
        
        //Validate address
        if(!valid.isAddress(address)){
            errorMsg.put("address","Address must from 2 to 100 character.");
        }
        
        
        //Validate address 
        if (!errorMsg.isEmpty()) {
            request.setAttribute("errorMsg", errorMsg);
            DBPatientProfile db = new DBPatientProfile();            
            PatientInfo patientInfo= db.getInfoPatient(currentUser.getName());  
            DBAccount db1 = new DBAccount();
            Account acc= db1.showAccountInfo(currentUser.getName());
            request.setAttribute("image", acc.getImage());
            request.setAttribute("paInfo", patientInfo);
            request.setAttribute("username", currentUser.getName());
            request.getRequestDispatcher("../../view/patient/editProfilePatient.jsp").forward(request, response);
            
        }

        // If all validations pass, proceed with updating the patient info
        PatientInfo paInfo = new PatientInfo();
        paInfo.setPatientId(patientId);
        paInfo.setPatientSin(medicalCode);
        paInfo.setName(fullname);
        paInfo.setPhoneNumber(phoneNumber);
        paInfo.setEmail(email);
        paInfo.setGender(gender);
        paInfo.setDob(dob);
        paInfo.setAddress(address);

        DBPatientProfile db = new DBPatientProfile();
        db.editInfoPatient(paInfo);

        response.sendRedirect("view");
    } catch (NumberFormatException e) {
        errorMsg.put("patientId", "Invalid patient ID.");
        errorMsg.put("medicalCode", "Invalid code.");

        request.setAttribute("errorMessages", errorMsg);
        request.getRequestDispatcher("../../view/patient/editProfilePatient.jsp").forward(request, response);
    } catch (ClassNotFoundException ex) {
        Logger.getLogger(EditProfilePatientController.class.getName()).log(Level.SEVERE, null, ex);
        request.setAttribute("errorMsg", "An error occurred while updating the profile.");
        request.getRequestDispatcher("../../view/patient/editProfilePatient.jsp").forward(request, response);
    }
    
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}