package users.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import users.models.Cart;

import java.io.IOException;

@WebServlet(name = "updateCartItem", value = "/updateCartItem")
public class UpdateCartItemServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String productIdStr = request.getParameter("productId");
        String quantityStr = request.getParameter("productQuantity");

        if (productIdStr != null && quantityStr != null) {
            int productId = Integer.parseInt(productIdStr);
            int quantity = Integer.parseInt(quantityStr);

            Cart cart = (Cart) session.getAttribute("cart");
            if (cart != null) {
                cart.updateItemQuantity(productId, quantity);
                response.sendRedirect("/static/jsp/cart.jsp");
            } else {
                request.setAttribute("errorMessage", "Cart is empty.");
                request.getRequestDispatcher("/static/jsp/cart.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Invalid input.");
            request.getRequestDispatcher("/static/jsp/cart.jsp").forward(request, response);
        }
    }
}
