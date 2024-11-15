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
import java.util.List;

@WebServlet(name = "admin", value = "/admin")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "view"; // Default action
        }
        switch (action) {
            case "add":
                request.getRequestDispatcher("/static/jsp/add-new-product.jsp").forward(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            default:
                listProducts(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                addProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
                break;
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = ProductDAO.getAllProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/static/jsp/list-products.jsp").forward(request, response);
    }


    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Product product = new Product(
                request.getParameter("productName"),
                request.getParameter("productDescription"),
                new BigDecimal(request.getParameter("productPrice")),
                Integer.parseInt(request.getParameter("productQuantity")),
                request.getParameter("imageUrl")
        );
        ProductDAO.addProduct(product);
        response.sendRedirect("/admin");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        Product existingProduct = ProductDAO.getProductById(productId);
        request.setAttribute("product", existingProduct);
        request.getRequestDispatcher("/static/jsp/edit-product.jsp").forward(request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Product product = new Product(
                request.getParameter("productName"),
                request.getParameter("productDescription"),
                new BigDecimal(request.getParameter("productPrice")),
                Integer.parseInt(request.getParameter("productQuantity")),
                request.getParameter("imageUrl")

        );
        ProductDAO.updateProduct(product);
        response.sendRedirect("/admin");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProductDAO.deleteProduct(id);
        response.sendRedirect("/admin");
    }
}
