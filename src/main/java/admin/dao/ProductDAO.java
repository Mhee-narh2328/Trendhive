package admin.dao;

import users.models.Product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/trendhivedb";
    private static final String USER = "root";
    private static final String PASSWORD = "willowy28@";

    public static List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sql = "SELECT * FROM Products";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("productId"));
                product.setProductName(rs.getString("productName"));
                product.setProductDescription(rs.getString("productDescription"));
                product.setProductPrice(rs.getBigDecimal("productPrice"));
                product.setProductQuantity(rs.getInt("productQuantity"));
                product.setImageUrl(rs.getString("imageUrl"));
                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public static void addProduct(Product product) {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sql = "INSERT INTO Products (productName, productDescription, productPrice, productQuantity, imageUrl) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, product.getProductName());
            stmt.setString(2, product.getProductDescription());
            stmt.setBigDecimal(3, product.getProductPrice());
            stmt.setInt(4, product.getProductQuantity());
            stmt.setString(5, product.getImageUrl());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Product getProductById(int id) {
        Product product = null;
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sql = "SELECT * FROM Products WHERE productId = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                product = new Product();
                product.setProductId(rs.getInt("productId"));
                product.setProductName(rs.getString("productName"));
                product.setProductDescription(rs.getString("productDescription"));
                product.setProductPrice(rs.getBigDecimal("productPrice"));
                product.setProductQuantity(rs.getInt("productQuantity"));
                product.setImageUrl(rs.getString("imageUrl"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    public static void updateProduct(Product product) {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sql = "UPDATE Products SET productName = ?, productDescription = ?, productPrice = ?, productQuantity = ?, imageUrl = ? WHERE productId = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, product.getProductName());
            stmt.setString(2, product.getProductDescription());
            stmt.setBigDecimal(3, product.getProductPrice());
            stmt.setInt(4, product.getProductQuantity());
            stmt.setString(5, product.getImageUrl());
            stmt.setInt(6, product.getProductId());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteProduct(int id) {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sql = "DELETE FROM Products WHERE productId = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}