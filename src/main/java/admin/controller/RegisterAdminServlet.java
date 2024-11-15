package admin.controller;

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
import java.sql.SQLException;

@WebServlet(name = "adminRegister", value = "/adminRegister")
public class RegisterAdminServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/static/jsp/admin-registration.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        try (Connection conn= DBConnection.getConnection()) {
            String sql = "INSERT INTO admin (username, password, email) VALUES ( ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, email);

            int result = stmt.executeUpdate();
            PrintWriter out = response.getWriter();
            if (result > 0) {
                out.println("Login Successful");
            } else {
                out.println("Something went wrong");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
