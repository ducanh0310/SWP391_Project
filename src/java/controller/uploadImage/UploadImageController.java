/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.uploadImage;

import dao1.DBAccount;
import dao1.DBImageProfile;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import static java.lang.System.out;
import java.net.HttpURLConnection;
import java.net.URL;
import model.Account;

/**
 *
 * @author Vu Minh Quan
 */
@WebServlet(name="UploadImageController", urlPatterns={"/uploadimage"})
public class UploadImageController extends HttpServlet {


 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       
        
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PrintWriter out = null;
    try {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out = response.getWriter();
        
        DBImageProfile db = new DBImageProfile();
        String imageLink = request.getParameter("imageUrl");
        
        // Log the received image URL
        System.out.println("Received image URL: " + imageLink);
        
        if (isValidURL(imageLink)) {
            db.updateImageProfile("elmurder666", imageLink);
            out.write("{\"success\": true, \"imageUrl\": \"" + imageLink + "\"}");
        } else {
            out.write("{\"success\": false, \"message\": \"Invalid image link.\"}");
        }
    } catch (ClassNotFoundException ex) {
        java.util.logging.Logger.getLogger(UploadImageController.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        out.write("{\"success\": false, \"message\": \"Server error.\"}");
    } finally {
        if (out != null) {
            out.flush();
            out.close();
        }
    }
    }
    


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

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
}
