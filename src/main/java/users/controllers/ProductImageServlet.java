package users.controllers;

import admin.dao.ProductDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import users.models.Product;

import java.io.IOException;

@WebServlet(name = "ProductImageServlet", value = "/product-image")
public class ProductImageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        Product product = ProductDAO.getProductById(productId);

        if (product != null && product.getImageUrl() != null) {
            response.setContentType("image/jpeg"); // or "image/png" based on your image type
            response.getOutputStream().write(product.getImageUrl());
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND); // No image found
        }
    }
}