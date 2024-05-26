/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.UserDAO;
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
import model.UserGoogleLoginDTO;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import java.sql.*;

/**
 *
 * @author trung
 */
public class AuthenticateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogleLoginDTO user = getUserInfor(accessToken);
        System.out.println(user);
    }

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

    public static UserGoogleLoginDTO getUserInfor(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        UserGoogleLoginDTO googlePojo = new Gson().fromJson(response, UserGoogleLoginDTO.class);

        return googlePojo;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action") == null
                ? ""
                : request.getParameter("action");
        String url = "";
        switch (action) {
            case "login":
                url = "login.jsp";
                break;
            case "logout":
                url = "index.jsp";
                logout(request, response);
                response.sendRedirect(url);
                return;
            default:
                request.getRequestDispatcher("login.jsp").forward(request, response);
                break;
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "login":
            {
                try {
                    login(request, response);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(AuthenticateServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
                break;

            default:
                throw new AssertionError();
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.removeAttribute(Constants.SESSION_CUSTOMER);
        //session.removeAttribute("cart");
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
        UserDAO user = new UserDAO();
        if (request.getParameter("username") == null || request.getParameter("password") == null
                || request.getParameter("username").trim().isEmpty() || request.getParameter("password").trim().isEmpty()) {
            request.setAttribute("mess", "Username or password incorrect !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            String userName = request.getParameter("username");
            String passWord = request.getParameter("password");

            User u = user.check(userName, passWord);
            HttpSession session = request.getSession();
            if (u == null) {
                request.setAttribute("error", "Username or password incorrect !");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                 //set vào session account
            session.setAttribute(Constants.SESSION_CUSTOMER, u);
            //chuyển về trang home
            response.sendRedirect("index.jsp");

            }
        }

    }

    public void getList(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, ServletException, IOException{
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
