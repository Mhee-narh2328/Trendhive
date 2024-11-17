package users.models;

import java.util.ArrayList;
import java.util.List;

public class Wishlist {
    private List<Product> products;

    public Wishlist() {
        this.products = new ArrayList<>();
    }

    public List<Product> getProducts() {
        return products;
    }

    // Add a product to the wishlist
    public void addProduct(Product product) {
        // Prevent adding duplicate products
        if (!products.contains(product)) {
            products.add(product);
        }
    }

    // Remove a product from the wishlist
    public void removeProduct(int productId) {
        products.removeIf(product -> product.getProductId() == productId);
    }
}

