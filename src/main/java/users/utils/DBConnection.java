package users.utils;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/trendhivedb";  // Database URL
    private static final String USERNAME = "root";  // MySQL username
    private static final String PASSWORD = "willowy28@";  // MySQL password

    // Static method to get a connection
    public static Connection getConnection() {
        try {
            // Registering Driver class
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Create and return a connection
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("Database connection failed: " + e.getMessage(), e);
        }
    }

    public static void main(String[] args) {
        // Test the connection
        try (Connection connection = getConnection()) {
            if (connection != null) {
                System.out.println("Connected to database");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
