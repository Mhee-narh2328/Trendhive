package users.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import users.models.Product;
import users.models.Wishlist;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "addToWishlist", value = "/addToWishlist")
public class AddToWishlistServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String productIdStr = request.getParameter("productId");
        if (productIdStr != null) {
            int productId = Integer.parseInt(productIdStr);

            // Fetch the product from the database (similar to Add to Cart)
            Product product = fetchProductFromDatabase(productId);

            if (product != null) {
                Wishlist wishlist = (Wishlist) session.getAttribute("wishlist");
                if (wishlist == null) {
                    wishlist = new Wishlist();
                    session.setAttribute("wishlist", wishlist);
                }

                wishlist.addProduct(product);
                response.sendRedirect("/static/jsp/wishlist.jsp");
            } else {
                request.setAttribute("errorMessage", "Product not found.");
                request.getRequestDispatcher("/static/jsp/register-fail.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Invalid product ID.");
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
