package users.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import users.models.Cart;
import users.models.Product;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.*;

@WebServlet(name = "addToCart", value = "/addToCart")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String productIdStr = request.getParameter("productId");
        String quantityStr = request.getParameter("productQuantity");

        if (productIdStr != null && quantityStr != null) {
            int productId = Integer.parseInt(productIdStr);
            int quantity = Integer.parseInt(quantityStr);

            // Simulate fetching product from the database
            Product product = fetchProductFromDatabase(productId);

            if (product != null) {
                Cart cart = (Cart) session.getAttribute("cart");
                if (cart == null) {
                    cart = new Cart();
                    session.setAttribute("cart", cart);
                }

                cart.addItem(product, quantity);
                response.sendRedirect("/static/jsp/cart.jsp");
            } else {
                request.setAttribute("errorMessage", "Product not found.");
                request.getRequestDispatcher("/static/jsp/register-fail.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Invalid input.");
            request.getRequestDispatcher("/static/jsp/register-fail.jsp").forward(request, response);
        }
    }

    private Product fetchProductFromDatabase(int productId) {
        Product product = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trendhivedb", "root", "willowy28@");

            String sql = "SELECT * FROM Products WHERE productId = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                product = new Product();
                product.setProductId(rs.getInt("productId"));
                product.setProductName(rs.getString("productName"));
                product.setProductDescription(rs.getString("productDescription"));
                product.setProductPrice(rs.getBigDecimal("productPrice"));
                product.setImageUrl(rs.getString("imageUrl"));
                product.setProductQuantity(rs.getInt("productQuantity"));
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return product;
    }
}
