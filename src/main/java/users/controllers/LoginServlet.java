package users.controllers;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import users.utils.DBConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("username") != null) {
            response.sendRedirect("/");
        } else {
            request.getRequestDispatcher("/static/jsp/login.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Get the user's role from the database
                String role = rs.getString("role");

                // Store the user details and role in the session
                request.getSession().setAttribute("username", username);
                request.getSession().setAttribute("role", role);

                // Redirect to the home page or appropriate page based on role
                if (role.equals("ADMIN")) {
                    response.sendRedirect("/admin/products");  // Admin dashboard
                } else {
                    response.sendRedirect("/product");  // Regular user home page
                }
            } else {
                request.setAttribute("error", "Invalid username or password");
                request.getRequestDispatcher("/static/jsp/login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}