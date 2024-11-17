package admin.controller;

import admin.dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import users.models.Product;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(name = "CreateProductServlet", value = "/admin/create-product")
public class CreateProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/static/jsp/create-product.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("productName");
        String description = request.getParameter("productDescription");
        BigDecimal price = new BigDecimal(request.getParameter("productPrice"));
        int quantity = Integer.parseInt(request.getParameter("productQuantity"));
        String imageUrl = request.getParameter("imageUrl");

        Product product = new Product(name, description, price, quantity, imageUrl);
        ProductDAO.addProduct(product);
        response.sendRedirect("/admin/products");
    }
}
