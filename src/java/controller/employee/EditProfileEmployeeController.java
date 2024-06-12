package controller.employee;

import dao.DBAccount;
import dao.DBEmployeeProfile;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
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

@WebServlet(name="EditProfileEmployeeController", urlPatterns={"/employee/profile/edit"})
public class EditProfileEmployeeController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        try {
            DBEmployeeProfile dbEm = new DBEmployeeProfile();
            Employee emInfo = dbEm.getInfoEmployee(currentUser.getName());
            DBAccount db = new DBAccount();
            Account acc = db.showAccountInfo(currentUser.getName());
            
            request.setAttribute("image", acc.getImage());
            request.setAttribute("emInfo", emInfo);
            request.setAttribute("username", currentUser.getName());
            
            if("d".equals(emInfo.getEmployeeType())) {
                ArrayList<DoctorCertification> arrayCerti = dbEm.getCertification(currentUser.getName());
                request.setAttribute("arrayCerti", arrayCerti);
                request.getRequestDispatcher("../../view/employee/doctor/editProfileDoctor.jsp").forward(request, response);
            } else if("b".equals(emInfo.getEmployeeType())) {
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
                //Validation data
                Employee emInfo = getEmployeeFromRequest(request, errorMsg);
                if (!errorMsg.isEmpty()) {
                    //Announce error into jsp
                    handleErrors(request, response, currentUser, errorMsg);
                } else {
                    db.editInfoEmployee(emInfo);
                    // submit certification for doctor 
                    handleCertifications(request, currentUser, db, errorMsg);
                    response.sendRedirect("view");
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(EditProfileEmployeeController.class.getName()).log(Level.SEVERE, null, ex);
                 Logger.getLogger(EditProfileEmployeeController.class.getName()).log(Level.SEVERE, null, ex);
            }

    }
    //Validation data
    private Employee getEmployeeFromRequest(HttpServletRequest request, Map<String, String> errorMsg) {
        Validation valid = new Validation();
        Employee emInfo = new Employee();
        
        try {
            emInfo.setId(Integer.parseInt(request.getParameter("id")));
            emInfo.setEmployeeType(request.getParameter("role").trim());
            emInfo.setAnnualSalary(Float.parseFloat(request.getParameter("salary")));
            emInfo.setBranchId(Integer.parseInt(request.getParameter("branchid")));
            emInfo.setEmployeeSin(request.getParameter("medicineCode").trim());
            emInfo.setName(request.getParameter("fullname").trim());
            emInfo.setPhoneNumber(request.getParameter("phoneNumber").trim());
            emInfo.setEmail(request.getParameter("email").trim());
            emInfo.setGender(request.getParameter("gender").trim());
            emInfo.setAddress(request.getParameter("address").trim());
            
            String dobStr = request.getParameter("dob");
            if (!valid.isDateOfBirth(dobStr)) {
                errorMsg.put("dob", "Use yyyy-mm-dd.");
            } else {
                Date dob = Date.valueOf(dobStr);
                if (!valid.isDistantDOB(dob)) {
                    errorMsg.put("dob", "Your date of birth must before now and you must be 18 years or older.");
                } else {
                    emInfo.setDob(dob);
                }
            }
            
            if (!valid.isName(emInfo.getName())) {
                errorMsg.put("fullname", "Full name must be between 2 and 50 characters.");
            }
            if (!valid.isPhoneNumber(emInfo.getPhoneNumber())) {
                errorMsg.put("phoneNumber", "Phone number must exactly 10 digits.");
            }
            if (!valid.isMedicalCode(emInfo.getEmployeeSin())) {
                errorMsg.put("medicalCode", "Medical code must be exactly 10 digits.");
            }
            if (!valid.isAddress(emInfo.getAddress())) {
                errorMsg.put("address", "Address must from 2 to 100 character.");
            }
        } catch (Exception ex) {
            Logger.getLogger(EditProfileEmployeeController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return emInfo;
    }
    //Announce error into jsp
    private void handleErrors(HttpServletRequest request, HttpServletResponse response, User currentUser, Map<String, String> errorMsg)
    throws ServletException, IOException, ClassNotFoundException {
        DBEmployeeProfile dbEm = new DBEmployeeProfile();
        Employee emInfo = dbEm.getInfoEmployee(currentUser.getName());
        DBAccount dbA = new DBAccount();
        Account acc = dbA.showAccountInfo(currentUser.getName());
        
        request.setAttribute("errorMsg", errorMsg);
        request.setAttribute("image", acc.getImage());
        request.setAttribute("emInfo", emInfo);
        request.setAttribute("username", currentUser.getName());
        
        if("d".equals(emInfo.getEmployeeType())) {
            ArrayList<DoctorCertification> arrayCerti = dbEm.getCertification(currentUser.getName());
            request.setAttribute("arrayCerti", arrayCerti);
            request.getRequestDispatcher("../../view/employee/doctor/editProfileDoctor.jsp").forward(request, response);
        } else if("b".equals(emInfo.getEmployeeType())) {
            request.getRequestDispatcher("../../view/employee/admin/editProfileAdmin.jsp").forward(request, response);
        }
    }
    // submit certification for doctor 
    private void handleCertifications(HttpServletRequest request, User currentUser, DBEmployeeProfile db, Map<String, String> errorMsg)
    throws ClassNotFoundException {
        Employee emInfo = db.getInfoEmployee(currentUser.getName());
        if("d".equals(emInfo.getEmployeeType())) {
            String[] imageLinks = request.getParameterValues("imageLink");
            String[] imageNames = request.getParameterValues("imageName");
            String[] idStrings = request.getParameterValues("idCer");
            int[] idImage = new int[100];
            
            for (int i = 0; i < idStrings.length; i++) {
                idImage[i] = idStrings[i] == null || idStrings[i].isEmpty() ? 0 : Integer.parseInt(idStrings[i]);
            }
            
            if (imageLinks != null && imageNames != null && imageLinks.length == imageNames.length) {
                for (int i = 0; i < imageLinks.length; i++) {
                    String imageLink = imageLinks[i];
                    String imageName = imageNames[i];
                    int imageId = idImage[i];
                    
                    if (isValidURL(imageLink)) {
                        if (imageId != 0) {
                            db.updateCertificate(currentUser.getName(), imageName, imageLink, imageId);
                        } else {
                            db.insertCertification(imageName, imageLink, emInfo.getId());
                        }
                    } else {
                        errorMsg.put("link", "Invalid link form");
                    }
                }
            }
        }
    }
    
    private boolean isValidURL(String urlStr) {
        try {
            URL url = new URL(urlStr);
            HttpURLConnection huc = (HttpURLConnection) url.openConnection();
            huc.setRequestMethod("HEAD");
            return huc.getResponseCode() == HttpURLConnection.HTTP_OK;
        } catch (Exception e) {
            return false;
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Edit Profile Employee Controller";
    }
}