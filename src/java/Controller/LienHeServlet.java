/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.EmailUtil;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 *
 * @author PC
 */
@WebServlet(name = "LienHeServlet", urlPatterns = {"/LienHeServlet"})
public class LienHeServlet extends HttpServlet {
    private static final String ADMIN_EMAIL = "trunglay2k4@gmail.com";
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
            out.println("<title>Servlet LienHeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LienHeServlet at " + request.getContextPath() + "</h1>");
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

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // Email sẽ gửi đến admin
        String adminEmail = "trunglay2k4@gmail.com";

        // Nội dung gửi email
        String fullMessage = "Họ tên: " + name + "\n"
                           + "Email liên hệ: " + email + "\n"
                           + "Chủ đề: " + subject + "\n\n"
                           + "Nội dung:\n" + message;

        try {
            // Gửi email
            EmailUtil.sendEmail(adminEmail, "Liên hệ từ người dùng: " + subject, fullMessage);

            // Gửi lại thông báo về trang contact.jsp
            request.setAttribute("success", "🟢 Gửi liên hệ thành công! Chúng tôi sẽ phản hồi sớm.");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "🔴 Gửi liên hệ thất bại. Vui lòng thử lại sau.");
        }

        // Quay lại trang contact.jsp
        request.getRequestDispatcher("contact.jsp").forward(request, response);
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
