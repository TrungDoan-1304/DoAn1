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
 /*
 * @author PC
 */
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/AddToCartServlet"})
public class AddToCartServlet extends HttpServlet {

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
            out.println("<title>Servlet AddToCartServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartServlet at " + request.getContextPath() + "</h1>");
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
    response.setContentType("text/html;charset=UTF-8");
    HttpSession session = request.getSession();
    String username = (String) session.getAttribute("username");

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    try {
        // Lấy và kiểm tra thông số productId
        String productIdParam = request.getParameter("productID");
        int productID = 0;
        if (productIdParam != null && !productIdParam.trim().isEmpty()) {
            productID = Integer.parseInt(productIdParam);
        } else {
            throw new IllegalArgumentException("Thiếu productID");
        }

        // Lấy và kiểm tra thông số quantity
        String quantityParam = request.getParameter("quantity");
        int quantity = 1; // Giá trị mặc định nếu thiếu
        if (quantityParam != null && !quantityParam.trim().isEmpty()) {
            quantity = Integer.parseInt(quantityParam);
        }

        String productName = request.getParameter("productName");
        String priceParam = request.getParameter("price");
        double price = (priceParam != null && !priceParam.trim().isEmpty())
                ? Double.parseDouble(priceParam) : 0.0;

        String size = request.getParameter("size");
        if (size == null) size = "S";

            CartItem item = new CartItem();
            item.setProductID(productID);
            item.setProductName(productName);
            item.setPrice(price);
            item.setQuantity(quantity);
            item.setSize(size);
            item.setUsername(username);

            CartDAO cartDAO = new CartDAO(); 
            String cartID = cartDAO.getOrCreateCartIdByUsername(username);
            cartDAO.addToCart( cartID , productID, productName, size, quantity, price,username);

            response.sendRedirect("CartServlet");
        } catch (Exception e) {
            e.printStackTrace();
                e.printStackTrace();
                request.setAttribute("error", "Không thể thêm sản phẩm vào giỏ hàng. Vui lòng thử lại.");
                request.getRequestDispatcher("product_detail.jsp").forward(request, response);
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
