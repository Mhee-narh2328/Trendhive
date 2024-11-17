package users.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import users.models.Wishlist;

import java.io.IOException;

@WebServlet(name = "removeFromWishlist", value = "/removeFromWishlist")
public class RemoveFromWishlistServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String productIdStr = request.getParameter("productId");

        if (productIdStr != null) {
            int productId = Integer.parseInt(productIdStr);

            Wishlist wishlist = (Wishlist) session.getAttribute("wishlist");
            if (wishlist != null) {
                wishlist.removeProduct(productId);
                response.sendRedirect("/static/jsp/wishlist.jsp");
            } else {
                request.setAttribute("errorMessage", "Wishlist is empty.");
                request.getRequestDispatcher("/static/jsp/wishlist.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Invalid product ID.");
            request.getRequestDispatcher("/static/jsp/wishlist.jsp").forward(request, response);
        }
    }
}
