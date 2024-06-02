/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.employee;

import dao1.DBAccount;
import dao1.DBEmployeeProfile;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Date;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.DoctorCertification;
import model.Employee;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name="EditProfileEmployeeController", urlPatterns={"/employee/profile/edit"})
public class EditProfileEmployeeController extends HttpServlet {
   
  

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException { 
        try {
            DBEmployeeProfile dbEm=new DBEmployeeProfile();
            Employee emInfo = dbEm.getInfoEmployee("johnli255a");
            if("d".equals(emInfo.getEmployeeType())){
                ArrayList<DoctorCertification> arrayCerti= dbEm.getCertification("johnli255a");
                DBAccount db = new DBAccount();
                Account acc= db.showAccountInfo("johnli255a");
                request.setAttribute("image", acc.getImage());
                request.setAttribute("arrayCerti", arrayCerti);
                request.setAttribute("emInfo", emInfo);
                request.setAttribute("username", "johnli255a");
                request.getRequestDispatcher("../../view/employee/doctor/editProfileDoctor.jsp").forward(request, response);
            }
            if("b".equals(emInfo.getEmployeeType())){
                DBAccount db = new DBAccount();
                Account acc= db.showAccountInfo("kdo2342");
                request.setAttribute("image", acc.getImage());
                request.setAttribute("emInfo", emInfo);
                request.setAttribute("username", "kdo2342");
                request.getRequestDispatcher("../../view/employee/admin/viewProfileAdmin.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditProfileEmployeeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            Employee emInfo = new Employee();
            emInfo.setId(Integer.parseInt(request.getParameter("id")));
            emInfo.setName(request.getParameter("fullname"));
            emInfo.setPhoneNumber(request.getParameter("phoneNumber"));
            emInfo.setEmail(request.getParameter("email"));
            emInfo.setEmployeeSin(Integer.parseInt(request.getParameter("medicineCode")));
            emInfo.setGender(request.getParameter("gender"));
            emInfo.setDob(Date.valueOf(request.getParameter("dob")));
            emInfo.setEmployeeType(request.getParameter("role"));
            emInfo.setAnnualSalary(Float.parseFloat(request.getParameter("salary")));
            emInfo.setAddress(request.getParameter("address"));
            emInfo.setBranchId(Integer.parseInt(request.getParameter("branchid"))); 
            
            DBEmployeeProfile db = new DBEmployeeProfile();
            db.editInfoEmployee(emInfo);
            int id = Integer.parseInt(request.getParameter("id"));
             String[] imageLinks = request.getParameterValues("imageLink");
            String[] imageNames = request.getParameterValues("imageName");
            String[] idStrings = request.getParameterValues("idCer");
            int[] idImage = new int[idStrings.length];
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
                        dbEm.updateCertificate("johnli255a", imageName, imageLink, imageId);
                    } else {
                        dbEm.insertCertification(imageName, imageLink, id);
                    }
                } else {
                    response.getWriter().println("Invalid image link: " + imageLink);
                }
            }
            response.getWriter().println("Processing completed.");
        } else {
            response.getWriter().println("Mismatch in number of image links and names.");
        }
        response.sendRedirect("view");
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
