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
@WebServlet(name = "updateABookingServlet", urlPatterns = {"/updateABookingServlet"})
public class updateABookingServlet extends HttpServlet {

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
            out.println("<title>Servlet updateABookingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateABookingServlet at " + request.getContextPath() + "</h1>");
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

            String id = request.getParameter("id");
            String pick_up_location = request.getParameter("pick_up_location");
            String pick_up_date = request.getParameter("pick_up_date");
            String return_date = request.getParameter("return_date");
            String duration = request.getParameter("duration");
            String car_manufacturer = request.getParameter("car_manufacturer");
            String car_type = request.getParameter("car_type");
            String prev_car_manufacturer = request.getParameter("prev_car_manufacturer");
            String prev_car_type = request.getParameter("prev_car_type");
            String prev_car_id = request.getParameter("prev_car_id");
            String prev_car_price = request.getParameter("prev_car_price");

            if (car_type.equals("notselected") || car_manufacturer.equals("notselected")) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Please select the car type !!');");
                out.println("location='user/index.jsp'");
                out.println("</script>");
            } else {

                Statement statementSelect = null;
                ResultSet resultSetSelect = null;
                String dbPriceSelect = "";
                String dbCIdSelect = "";

                DB_Connection obj_DB_Connection = new DB_Connection();
                Connection connection = obj_DB_Connection.get_connection();
                PreparedStatement psInsert = null;
                PreparedStatement psUpdate = null;

                statementSelect = connection.createStatement();

                if (car_manufacturer.equals(prev_car_manufacturer) && car_type.equals(prev_car_type)) {

                    Integer totalPrice = Integer.parseInt(prev_car_price) * Integer.parseInt(duration);
                    String sqlUpdate = "UPDATE bookings SET b_pick_up_location= '" + pick_up_location + "',b_pick_up_date= '" + pick_up_date + "',b_return_date= '" + return_date + "',b_duration_days= '" + duration + "',b_price= " + totalPrice + " WHERE b_id = '" + id + "' ";

                    try {
                        psInsert = connection.prepareStatement(sqlUpdate);
                    } catch (SQLException ex) {
                        Logger.getLogger(addABookingServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    psInsert.executeUpdate();

                    out.println("<script type=\"text/javascript\">");
                    out.println("location='user/bookings.jsp'");
                    out.println("</script>");

                } else {

                    String sqlSelect = "SELECT * FROM cars WHERE c_manufacturer='" + car_manufacturer + "' && c_type='" + car_type + "' && c_status= 0 ";
                    Class.forName("com.mysql.jdbc.Driver");

                    resultSetSelect = statementSelect.executeQuery(sqlSelect);
                    if (resultSetSelect.next()) {
                        dbPriceSelect = resultSetSelect.getString(6);
                        dbCIdSelect = resultSetSelect.getString(1);

                        Integer totalPrice = Integer.parseInt(dbPriceSelect) * Integer.parseInt(duration);

                        String sqlUpdate = "UPDATE bookings SET b_pick_up_location= '" + pick_up_location + "',b_pick_up_date= '" + pick_up_date + "',b_return_date= '" + return_date + "',b_duration_days= '" + duration + "',b_car_id= '" + dbCIdSelect + "',b_car_manufacturer= '" + car_manufacturer + "',b_car_type= '" + car_type + "',b_price= " + totalPrice + " WHERE b_id = '" + id + "' ";

                        try {
                            psInsert = connection.prepareStatement(sqlUpdate);
                        } catch (SQLException ex) {
                            Logger.getLogger(addABookingServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }

                        psInsert.executeUpdate();

                        String sqlUpdate2 = "UPDATE cars SET c_status = 0  WHERE c_id = '" + prev_car_id + "' ";
                        psUpdate = connection.prepareStatement(sqlUpdate2);
                        psUpdate.executeUpdate();

                        String sqlUpdate3 = "UPDATE cars SET c_status = 1  WHERE c_id = '" + dbCIdSelect + "' ";
                        psUpdate = connection.prepareStatement(sqlUpdate3);
                        psUpdate.executeUpdate();

                        out.println("<script type=\"text/javascript\">");
                        out.println("location='user/bookings.jsp'");
                        out.println("</script>");

                    } else {
                        Integer totalPrice = Integer.parseInt(prev_car_price) * Integer.parseInt(duration);
                        String sqlUpdate = "UPDATE bookings SET b_pick_up_location= '" + pick_up_location + "',b_pick_up_date= '" + pick_up_date + "',b_return_date= '" + return_date + "',b_duration_days= '" + duration + "',b_price= " + totalPrice + " WHERE b_id = '" + id + "' ";

                        try {
                            psInsert = connection.prepareStatement(sqlUpdate);
                        } catch (SQLException ex) {
                            Logger.getLogger(addABookingServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }

                        psInsert.executeUpdate();
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Could not found a vehicle, try different category !!');");
                        out.println("location='user/bookings.jsp'");
                        out.println("</script>");
                    }
                }
            }

        } catch (ClassNotFoundException ex) {
            out.println(ex);

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
