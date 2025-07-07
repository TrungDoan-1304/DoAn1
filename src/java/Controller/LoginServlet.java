/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import Util.BDconnect;
import jakarta.servlet.http.HttpSession;
/**
 *
 * @author PC
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/banquanao"; // sửa tên database của bạn
        String username = "root"; // sửa user nếu khác
        String password = "";     // sửa password nếu có
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException(e);
        }
        return DriverManager.getConnection(url, username, password);
    }

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
            out.println("<title>Servlet NguoiDung</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NguoiDung at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
       String userName = request.getParameter("username").trim();
       String passWord = request.getParameter("password").trim();
       System.out.println("username: " + userName + ", password: " + passWord);
       try (Connection conn = getConnection()){
           String sql = "SELECT * FROM user Where username =? AND password =?";
           PreparedStatement stmt = conn.prepareStatement(sql);
           stmt.setString(1, userName);
           stmt.setString(2, passWord);
           ResultSet rs = stmt.executeQuery();
           if (rs.next()){
               String Role = rs.getString("role");
               System.out.println("Vai trò: " + Role);
               HttpSession  session = request.getSession();
               session.setAttribute("userName", rs.getString("username"));
               session.setAttribute("Role", Role);
               if("admin".equalsIgnoreCase(Role)){
                   response.sendRedirect("admin.jsp");
               }
               else if ("user".equalsIgnoreCase(Role)){
                   
                    response.sendRedirect("user.jsp");
                    }  
               else {
                   request.setAttribute("thongbao", "Tài khoản không hợp lệ!");
                   response.sendRedirect("login.jsp");
               }
               }   
           else {
               
               request.setAttribute("thongbao", "Sai tên đăng nhập hoặc mật khẩu!");
               request.getRequestDispatcher("login.jsp").forward(request, response);
           }
       }catch( SQLException e){
           throw new ServletException("Lỗi kết nối CSDL",e);
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
