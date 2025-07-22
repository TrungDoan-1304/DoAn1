/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.OrderDAO;
import Model.EmailUtil;
import jakarta.mail.MessagingException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

/**
 *
 * @author PC
 */
@WebServlet(name = "OrderDetailServlet", urlPatterns = {"/OrderDetailServlet"})
public class OrderDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet OrderDetaiServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetaiServlet at " + request.getContextPath() + "</h1>");
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
            throws ServletException, IOException, UnsupportedEncodingException {
        
        request.setCharacterEncoding("UTF-8");
        String orderIdParam = request.getParameter("orderID");
        String newStatus    = request.getParameter("status");
        if (orderIdParam == null || newStatus == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        int orderId = Integer.parseInt(orderIdParam);

        // Cập nhật trạng thái đơn hàng
        OrderDAO.updateStatus(orderId, newStatus);

        // Nếu "Đã giao thành công" thì gửi email
        if ("Đã giao thành công".equals(newStatus)) {
            String email = OrderDAO.getEmailByOrderId(orderId);
            if (email != null && !email.isBlank()) {
                String subject = "Đơn hàng #" + orderId + " đã được giao";
                String body    = "Xin chào,\n\n"
                               + "Đơn hàng #" + orderId
                               + " của bạn đã được giao thành công.\n\n"
                               + "Cảm ơn bạn đã mua sắm tại Shop Quần Áo Nam!";
                try {
                    EmailUtil.sendEmail(email, subject, body);
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
            }
        }

        // Redirect trở lại chi tiết đơn để admin thấy kết quả
        response.sendRedirect("AdminOrderServlet?orderID=" + orderId);
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
