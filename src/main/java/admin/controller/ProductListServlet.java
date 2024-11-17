package admin.controller;

import admin.dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import users.models.Product;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductListServlet", value = "/admin/products")
public class ProductListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");
        String role = (String) request.getSession().getAttribute("role");

        if (username == null || role == null || !role.equals("ADMIN")) {
            response.sendRedirect("/login"); // Or redirect to a forbidden page
            return; // Stop further processing
        }
        // Fetch the list of products from the database
        List<Product> products = ProductDAO.getAllProducts();

        // Set the products attribute so that the JSP can access it
        request.setAttribute("products", products);

        // Forward the request to the JSP page to display the products
        request.getRequestDispatcher("/static/jsp/list-products.jsp").forward(request, response);
    }
}
