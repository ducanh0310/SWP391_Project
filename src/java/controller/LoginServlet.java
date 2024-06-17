/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.Authorization;
import dao.EmployeeDAO;
import dao.PatientDAO;
import dal.DBContext;
//import com.google.gson.Gson;
//import com.google.gson.JsonObject;
import dao1.DBPatientProfile;
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
import dao.UserDAO;
import model.Employee;
import model.Patient;

/**
 *
 * @author trung
 */
@WebServlet(name="LoginServlet", urlPatterns={"/login"})
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
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession();
        String userName = request.getParameter("username").trim();
        String passWord = request.getParameter("password").trim();

        if (userName.trim() == null || passWord.trim() == null
                || userName.trim().trim().isEmpty() || passWord.trim().isEmpty()) {
            request.setAttribute("error", "Username and password must not be empty.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            try {
                UserDAO userDAO = new UserDAO();
                User user = userDAO.checkUser(userName);
                if (user != null && user.getPassword().equals(passWord)) {
                    session.setAttribute("currentUser", user);
                    Authorization author = new Authorization();
                    if (user.getType_Id() == 0) {
                        PatientDAO patientDAO = new PatientDAO();
                        Patient pat = patientDAO.getPatientById(user.getPatient_Id());
                        session.setAttribute("patient", pat);
                        session.setAttribute("userRole", "patient");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                        //request.getRequestDispatcher("index.jsp").forward(request, response);
                    } else if (user.getType_Id() == 1) {
                        EmployeeDAO empDao = new EmployeeDAO();
                        Employee emp = empDao.getEmployeeByEmployeeId(user.getEmployee_Id());
                        if (author.isEmployee(user.getEmployee_Id()).equals("b")) {
                            session.setAttribute("admin", emp);
                            session.setAttribute("userRole", "admin");
                            request.getRequestDispatcher("view/employee/admin/home.jsp").forward(request, response);
                        } else if (author.isEmployee(user.getEmployee_Id()).equals("d")) {
                            session.setAttribute("doctor", emp);
                            session.setAttribute("userRole", "doctor");
                            request.getRequestDispatcher("view/employee/doctor/home.jsp").forward(request, response);
                        } else if (author.isEmployee(user.getEmployee_Id()).equals("h")) {
                            session.setAttribute("nurse", emp);
                            session.setAttribute("userRole",  "nurse");
                            request.getRequestDispatcher("view/employee/nurse/home.jsp").forward(request, response);
                        } else {
                            session.setAttribute("receptionist", emp);
                            session.setAttribute("userRole", "receptionist");
                            request.getRequestDispatcher("view/employee/receptionist/home.jsp").forward(request, response);
                        }
                    }
                } else {
                    request.setAttribute("error", "Invalid username or password.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            
        }

    }

    

    public void getList(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, ServletException, IOException, SQLException {
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
