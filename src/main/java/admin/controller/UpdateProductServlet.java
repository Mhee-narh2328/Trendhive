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

@WebServlet(name = "UpdateProductServlet", value = "/admin/update-product")
public class UpdateProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        Product product = ProductDAO.getProductById(productId);
        request.setAttribute("product", product);
        request.getRequestDispatcher("/static/jsp/update-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String name = request.getParameter("productName");
        String description = request.getParameter("productDescription");
        BigDecimal price = new BigDecimal(request.getParameter("productPrice"));
        int quantity = Integer.parseInt(request.getParameter("productQuantity"));
        String imageUrl = request.getParameter("imageUrl");


        Product updatedProduct = new Product(productId, name, description, price, imageUrl,  quantity);
        ProductDAO.updateProduct(updatedProduct);
        response.sendRedirect("/admin/products");
    }
}
