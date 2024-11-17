package users.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import users.models.Product;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "productDetails", value = "/productDetails")
public class ProductDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productIdParam = request.getParameter("productId");
        Product product = null;

        String username = (String) request.getSession().getAttribute("username");
        String role = (String) request.getSession().getAttribute("role");

        if (username == null || role == null || !role.equals("USER")) {
            response.sendRedirect("/login"); // Or redirect to a forbidden page
            return; // Stop further processing
        }

        try {
            // Validate and parse productId
            if (productIdParam == null || productIdParam.isEmpty()) {
                throw new IllegalArgumentException("Product ID is missing.");
            }

            int productId = Integer.parseInt(productIdParam);

            // Establish database connection
            try (Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/trendhivedb", "root", "willowy28@")) {

                String sql = "SELECT * FROM Products WHERE productId = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, productId);
                    try (ResultSet rs = stmt.executeQuery()) {
                        if (rs.next()) {
                            product = new Product();
                            product.setProductId(rs.getInt("productId"));
                            product.setProductName(rs.getString("productName"));
                            product.setProductDescription(rs.getString("productDescription"));
                            product.setProductPrice(rs.getBigDecimal("productPrice"));
                            product.setImageUrl(rs.getBytes("imageUrl"));
                            product.setProductQuantity(rs.getInt("productQuantity"));
                        }
                    }
                }
            }

            // Check if product was found
            if (product == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found.");
                return;
            }

            // Forward product to JSP
            request.setAttribute("product", product);
            request.getRequestDispatcher("/static/jsp/product-details.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Product ID format.");
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred.");
        }
    }
}
