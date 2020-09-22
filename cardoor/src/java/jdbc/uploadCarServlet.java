/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jdbc;

import common.DB_Connection;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Helix
 */
@WebServlet(name = "uploadCarServlet", urlPatterns = {"/uploadCarServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10MB
        maxFileSize = 1024 * 1024 * 1000, // 1GB
        maxRequestSize = 1024 * 1024 * 1000) // 1GB
public class uploadCarServlet extends HttpServlet {

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
            out.println("<title>Servlet uploadCarServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet uploadCarServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {

            String folderName = "resources";
            String uploadPath = request.getServletContext().getRealPath("") + File.separator + folderName;

            File dir = new File(uploadPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            Part filePart = request.getPart("file");
            String fileName = filePart.getSubmittedFileName();
            String RetrivePath = folderName + File.separator + fileName;

            String fileuploadPath = request.getServletContext().getRealPath("") + File.separator + folderName + File.separator + fileName;
            

            String cname = request.getParameter("cname");
            String cdescription = request.getParameter("cdescription");
            String cprice = request.getParameter("cprice");
            String cmanufacturer = request.getParameter("cmanufacturer");
            String ctype = request.getParameter("ctype");
            
            if (ctype.equals("notselected") || cmanufacturer.equals("notselected")) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Please select the car type !!');");
                out.println("location='admin/index.jsp'");
                out.println("</script>");
            } else {
                
                out.print("<h3>fileuploadPath :-</h3>");
            out.println(fileuploadPath);
            out.print("<hr>");

            out.print("<h3>RetrivePath :-</h3>");
            out.println(RetrivePath);
            out.print("<hr>");

            try {
                InputStream is = filePart.getInputStream();
                Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
                out.println("copied<hr>");
            } catch (Exception ex) {
                out.println(ex);
            }

            try {

                DB_Connection obj_DB_Connection = new DB_Connection();
                Connection connection = obj_DB_Connection.get_connection();
                PreparedStatement ps = null;

                String sql = "insert into cars (c_name,c_description,c_type,c_manufacturer,c_price,c_status,c_img_url) values(?,?,?,?,?,?,?)";
                Class.forName("com.mysql.jdbc.Driver");

                ps = connection.prepareStatement(sql);
                ps.setString(1, cname);
                ps.setString(2, cdescription);
                ps.setString(3, ctype);
                ps.setString(4, cmanufacturer);
                ps.setString(5, cprice);
                ps.setString(6, "0");
                ps.setString(7, RetrivePath);

                ps.executeUpdate();
                out.println("<script type=\"text/javascript\">");
                out.println("location='admin/cars.jsp';");
                out.println("</script>");

            } catch (ClassNotFoundException ex) {
                out.println(ex);
            }
            }
        } catch (SQLException ex) {
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
