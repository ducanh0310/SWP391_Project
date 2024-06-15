/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authen;

import Service.IAccountDAO;
import java.io.IOException;
import java.io.PrintWriter;

import dao.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import validation.Email;

/**
 *
 * @author ngphn
 */
@WebServlet(name = "registeraccountcontroller", urlPatterns = {"/registeraccount"})
public class registeraccountcontroller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registeraccountcontroller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registeraccountcontroller at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/authen/registeraccount.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String repassword = request.getParameter("repassword");
            if (!validation.Validation.isValidUsername(username)) {
                request.setAttribute("errorUsn", "Username must be 3 to 15 characters and cannot contain spaces.");
                request.getRequestDispatcher("view/authen/registeraccount.jsp").forward(request, response);
                return;
            }
            if (!validation.Validation.isValidPassword(password)) {
                request.setAttribute("error", "Password must be at least 8 characters, uppercase, lowercase and numbers!");
                request.getRequestDispatcher("view/authen/registeraccount.jsp").forward(request, response);
                return;
            } else if (!password.equals(repassword)) {
                request.setAttribute("error", "Password and Re-password are not the same!");
                request.getRequestDispatcher("view/authen/registeraccount.jsp").forward(request, response);
                return;
            }
            //check if username is existed
            IAccountDAO accountDAO = new AccountDAO();
            if (accountDAO.checkAccount(username)) {
                request.setAttribute("error", "Username is existed!");
                request.getRequestDispatcher("view/authen/registeraccount.jsp").forward(request, response);
                return;
            }
            //insert account
            accountDAO.addPatientAccount(email, username, password);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(registeraccountcontroller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
