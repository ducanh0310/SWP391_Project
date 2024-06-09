/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.employee;


import dao1.DBAccount;
import dao1.DBEmployeeProfile;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.DoctorCertification;
import model.Employee;
import model.User;
import validation.Validation;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name="EditProfileEmployeeController", urlPatterns={"/employee/profile/edit"})
public class EditProfileEmployeeController extends HttpServlet {
   
  

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException { 
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        try {
            DBEmployeeProfile dbEm=new DBEmployeeProfile();
            Employee emInfo = dbEm.getInfoEmployee(currentUser.getName());
            //johnli255a
            if("d".equals(emInfo.getEmployeeType())){
                ArrayList<DoctorCertification> arrayCerti= dbEm.getCertification(currentUser.getName());
                DBAccount db = new DBAccount();
                Account acc= db.showAccountInfo(currentUser.getName());
                request.setAttribute("image", acc.getImage());
                request.setAttribute("arrayCerti", arrayCerti);
                request.setAttribute("emInfo", emInfo);
                request.setAttribute("username", currentUser.getName());
                request.getRequestDispatcher("../../view/employee/doctor/editProfileDoctor.jsp").forward(request, response);
            }
            //kdo2342
            if("b".equals(emInfo.getEmployeeType())){
                DBAccount db = new DBAccount();
                Account acc= db.showAccountInfo(currentUser.getName());
                request.setAttribute("image", acc.getImage());
                request.setAttribute("emInfo", emInfo);
                request.setAttribute("username", currentUser.getName());
                request.getRequestDispatcher("../../view/employee/admin/editProfileAdmin.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditProfileEmployeeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("currentUser");
            Map<String, String> errorMsg = new HashMap<>();
            DBEmployeeProfile db = new DBEmployeeProfile();
            try {
                int patientId = Integer.parseInt(request.getParameter("id"));
                String role= request.getParameter("role");
                float salary=Float.parseFloat(request.getParameter("salary"));
                int branchId=Integer.parseInt(request.getParameter("branchid"));
                String patientSin = request.getParameter("medicineCode");
                String fullname = request.getParameter("fullname");
                String phoneNumber = request.getParameter("phoneNumber");
                String email = request.getParameter("email");
                String gender = request.getParameter("gender");
                String dobStr = request.getParameter("dob");
                String address = request.getParameter("address");
                String branch = request.getParameter("branch");
                Validation valid= new Validation();
                
                // Validate name
                if (!valid.isName(fullname)) {
                    errorMsg.put("fullname","Full name must be between 2 and 50 characters.") ;
                }
                
                //Validate phone number
                if (!valid.isPhoneNumber(phoneNumber)) {
                    errorMsg.put("phoneNumber","Phone number must exactly 10 digits.") ;
                }
                
                
                
                //Validate Medical code
                
                if (!valid.isMedicalCode(patientSin)) {
                    
                    errorMsg.put("medicalCode", "Medical code must be exactly 10 digits.");
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
                
                
                
                //Validate
                if (!errorMsg.isEmpty()) {
                    
                    DBEmployeeProfile dbEm=new DBEmployeeProfile();
                    Employee emInfo = dbEm.getInfoEmployee(currentUser.getName());
                    //johnli255a
                    if("d".equals(emInfo.getEmployeeType())){
                        ArrayList<DoctorCertification> arrayCerti= dbEm.getCertification(currentUser.getName());
                        DBAccount dbA = new DBAccount();
                        Account acc= dbA.showAccountInfo(currentUser.getName());
                        request.setAttribute("errorMsg", errorMsg);
                        request.setAttribute("image", acc.getImage());
                        request.setAttribute("arrayCerti", arrayCerti);
                        request.setAttribute("emInfo", emInfo);
                        request.setAttribute("username", currentUser.getName());
                        request.getRequestDispatcher("../../view/employee/doctor/editProfileDoctor.jsp").forward(request, response);

                    }
                    //kdo2342
                    if("b".equals(emInfo.getEmployeeType())){
                        DBAccount dbA = new DBAccount();
                        Account acc= dbA.showAccountInfo(currentUser.getName());
                        request.setAttribute("errorMsg", errorMsg);
                        request.setAttribute("image", acc.getImage());
                        request.setAttribute("emInfo", emInfo);
                        request.setAttribute("username", currentUser.getName());
                        request.getRequestDispatcher("../../view/employee/admin/editProfileAdmin.jsp").forward(request, response);
                    }
                    
                }
                
                
                
                
                Employee emInfo = new Employee();
                emInfo.setId(patientId);
                emInfo.setName(fullname);
                emInfo.setPhoneNumber(phoneNumber);
                emInfo.setEmail(email);
                emInfo.setEmployeeSin(patientSin);
                emInfo.setGender(gender);
                emInfo.setDob(dob);
                emInfo.setEmployeeType(role);
                emInfo.setAnnualSalary(salary);
                emInfo.setAddress(address);
                emInfo.setBranchId(branchId);
                db.editInfoEmployee(emInfo);
                //Certification
                //kdo2342
                
                
                Employee emInfoCer = db.getInfoEmployee(currentUser.getName());
                if("d".equals(emInfoCer.getEmployeeType())){
                    int id = Integer.parseInt(request.getParameter("id"));
                    String[] imageLinks = request.getParameterValues("imageLink");
                    String[] imageNames = request.getParameterValues("imageName");
                    String[] idStrings = request.getParameterValues("idCer");
                    int[] idImage = new int[100];
                    // Handle empty strings and null values
                    for (int i = 0; i < idStrings.length; i++) {
                        if (idStrings[i] == null || idStrings[i].isEmpty()) {
                            idImage[i] = 0; // Default value for empty or null strings
                        } else {
                            idImage[i] = Integer.parseInt(idStrings[i]);
                        }
                    }
                    DBEmployeeProfile dbEm = new DBEmployeeProfile();
                    if (imageLinks != null && imageNames != null && imageLinks.length == imageNames.length) {
                        for (int i = 0; i < imageLinks.length; i++) {
                            String imageLink = imageLinks[i];
                            String imageName = imageNames[i];
                            int imageId = idImage[i];
                            
                            if (isValidURL(imageLink)) {
                                if (imageId != 0) {
                                    dbEm.updateCertificate(currentUser.getName(), imageName, imageLink, imageId);
                                } else {
                                    dbEm.insertCertification(imageName, imageLink, id);
                                }
                            } else {
                                errorMsg.put("link", "Invalid link form");
                                
                            }
                        }
                        response.getWriter().println("Processing completed.");
                    }
                } else {
                    response.getWriter().println("Mismatch in number of image links and names.");
                }
                response.sendRedirect("view");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(EditProfileEmployeeController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditProfileEmployeeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private boolean isValidURL(String urlStr) {
    try {
        URL url = new URL(urlStr);
        HttpURLConnection huc = (HttpURLConnection) url.openConnection();
        huc.setRequestMethod("HEAD");
        int responseCode = huc.getResponseCode();
        return (responseCode == HttpURLConnection.HTTP_OK);
    } catch (Exception e) {
        return false;
    }
}
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}