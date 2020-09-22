/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jdbc;

import common.DB_Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Helix
 */
@WebServlet(name = "registerServlet", urlPatterns = {"/registerServlet"})
public class registerServlet extends HttpServlet {

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
            out.println("<title>Servlet registerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registerServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        try {
            String u_fname = request.getParameter("u_fname");
            String u_lname = request.getParameter("u_lname");
            String u_email = request.getParameter("u_email");
            String u_uname = request.getParameter("u_uname");
            String u_pwd = request.getParameter("u_pwd");

            Statement statement = null;
            ResultSet unameresultSet = null;
            ResultSet emailresultSet = null;
            String unameCountrow = "";
            String emailCountrow = "";

            DB_Connection obj_DB_Connection1 = new DB_Connection();
            Connection connection1 = obj_DB_Connection1.get_connection();
            try {
                statement = connection1.createStatement();
            } catch (SQLException ex) {
                Logger.getLogger(registerServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            String sqluname = "SELECT COUNT(user_username) FROM users WHERE user_username='" + u_uname + "'";
            String sqlemail = "SELECT COUNT(user_email) FROM users WHERE user_email='" + u_email + "'";

            unameresultSet = statement.executeQuery(sqluname);
            while (unameresultSet.next()) {
                unameCountrow = unameresultSet.getString(1);
            }
            emailresultSet = statement.executeQuery(sqlemail);
            while (emailresultSet.next()) {
                emailCountrow = emailresultSet.getString(1);
            }

            if (unameCountrow.equals("1")) {

                out.print("Username not avalaible");

            } else if (emailCountrow.equals("1")) {

                out.print("Email not avalaible");

            } else if (unameCountrow.equals("0") && emailCountrow.equals("0")) {

                DB_Connection obj_DB_Connection = new DB_Connection();
                Connection connection = obj_DB_Connection.get_connection();
                PreparedStatement ps = null;

                String sql = "insert into users (user_fname,user_lname,user_username,user_email,user_password,user_type) values(?,?,?,?,?,?)";
                Class.forName("com.mysql.jdbc.Driver");

                ps = connection.prepareStatement(sql);
                ps.setString(1, u_fname);
                ps.setString(2, u_lname);
                ps.setString(3, u_uname);
                ps.setString(4, u_email);
                ps.setString(5, u_pwd);
                ps.setString(6, "user");

                ps.executeUpdate();
                out.println("Success");

            } else {
                out.print("something went wrong");
            }

        } catch (SQLException ex) {
            out.println(ex);
        } catch (ClassNotFoundException ex) {
            out.println(ex);
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
