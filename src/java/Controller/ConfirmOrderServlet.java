/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Model.CartItem;
import java.util.List;
import DAO.OrderDAO;
import DAO.UserDAO;
import Model.Order;
import Model.User;
import java.time.LocalDate;
import java.util.Date;
/**
 *
 * @author PC
 */
@WebServlet(name = "ConfirmOrderServlet", urlPatterns = {"/ConfirmOrderServlet"})
public class ConfirmOrderServlet extends HttpServlet {

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
            out.println("<title>Servlet ConfirmOrderServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmOrderServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Lấy user từ DB
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByusername(username);
        if (user == null) {
            request.setAttribute("errorMessage", "Không tìm thấy người dùng.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        // Lấy giỏ hàng từ DB
        CartDAO cartDAO = new CartDAO();
        List<CartItem> cartItems = cartDAO.getCartItems(username);

        if (cartItems == null || cartItems.isEmpty()) {
            request.setAttribute("errorMessage", "Giỏ hàng trống.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        // Lấy thông tin đơn hàng từ form
        String note = request.getParameter("note");
        String paymentMethod = request.getParameter("paymentMethod");
            String status;
            switch (paymentMethod) {
                      case "COD":
                     status = "Chưa thanh toán";
                      break;
                     case "BANK":
                     case "MOMO":
                      status = "Đang giao hàng";
                    break;
                    default:
              status = "Không xác định";
                    }
            
        double totalAmount = 0;
        for (CartItem item : cartItems) {
            totalAmount += item.getQuantity() * item.getPrice();
        }

        // Tạo đơn hàng
        Order order = new Order();
        order.setUsername(username);
        order.setHoTen(user.getHoTen());
        order.setSDT(user.getSDT());
        order.setDiaChi(user.getDiaChi());
        order.setNote(note);
        order.setPaymentMethod(paymentMethod);
        order.setNgayDatHang(java.sql.Date.valueOf(java.time.LocalDate.now()));
        order.setTotalAmount(totalAmount);
        order.setStatus(status);

        // Lưu đơn hàng vào DB
        OrderDAO orderDAO = new OrderDAO();
        boolean success = orderDAO.saveOrder(order, cartItems);

        if (success) {
            // Xóa giỏ hàng sau khi lưu đơn hàng
            cartDAO.clearCart(username);

            // Điều hướng theo phương thức thanh toán
            switch (paymentMethod) {
                case "COD":
                    response.sendRedirect("success.jsp");
                    break;
                case "BANK":
                    response.sendRedirect("bank_payment.jsp");
                    break;
                case "MOMO":
                    response.sendRedirect("momo_payment.jsp");
                    break;
                default:
                    response.sendRedirect("order.jsp");
            }
        } else {
            request.setAttribute("errorMessage", "Không thể lưu đơn hàng.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
