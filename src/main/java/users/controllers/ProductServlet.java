package users.controllers;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import users.models.Product;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "product", value = "/product")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Product> products = new ArrayList<>();

        try {
            // Load the database driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trendhivedb", "root", "willowy28@");

            // Execute SQL query
            String sql = "SELECT * FROM Products";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            // Populate product list
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("productId"));
                product.setProductName(rs.getString("productName"));
                product.setProductDescription(rs.getString("productDescription"));
                product.setProductPrice(rs.getBigDecimal("productPrice"));
                product.setImageUrl(rs.getBytes("imageUrl"));
                product.setProductQuantity(rs.getInt("productQuantity"));
                products.add(product);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Pass the product list to JSP
        request.setAttribute("products", products);
        request.getRequestDispatcher("/static/jsp/products.jsp").forward(request, response);
    }
}



