/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DBContext;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.DBPatientProfile;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import model.PatientInfo;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import java.sql.*;
import model.PatientInfo;
import AccountDAO.UserDAO;
/**
 *
 * @author trung
 */
public class LoginServlet extends HttpServlet {

    public static String getToken(String code) throws ClientProtocolException, IOException {
        //call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static PatientInfo getUserInfor(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        PatientInfo googlePojo = new Gson().fromJson(response, PatientInfo.class);

        return googlePojo;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        
        HttpSession session = request.getSession();
        String userName = request.getParameter("username");
        String passWord = request.getParameter("password");

        if (userName == null || passWord == null 
                || userName.trim().isEmpty() || passWord.trim().isEmpty()) {
            request.setAttribute("error", "Username and password must not be empty.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            UserDAO userDAO = new UserDAO();
            User user = userDAO.checkUser(userName, passWord);
            if (user != null) {
                session.setAttribute("currentUser", user);
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("error", "Invalid username or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }

    }

    private void logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.removeAttribute("currentUser");

    }

    public void getList(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, ServletException, IOException {
        UserDAO user = new UserDAO();
        ArrayList<User> userList = user.getAll();
        request.setAttribute("Users", userList);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
