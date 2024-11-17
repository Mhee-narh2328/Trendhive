package users.models;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart {
    private List<CartItem> items = new ArrayList<>();

    public List<CartItem> getItems() {
        return items;
    }

    public void addItem(Product product, int quantity) {
        for (CartItem item : items) {
            if (item.getProduct().getProductId() == product.getProductId()) {
                item.setQuantity(item.getQuantity() + quantity);
                return;
            }
        }
        items.add(new CartItem(product, quantity));
    }
    public void removeItem(int productId) {
        // Iterate through the list of cart items and remove the item with the given productId
        items.removeIf(item -> item.getProduct().getProductId() == productId);
    }

    public void updateItemQuantity(int productId, int newQuantity) {
        for (CartItem item : items) {
            if (item.getProduct().getProductId() == productId) {
                item.setQuantity(newQuantity);
                break;
            }
        }
    }


    public BigDecimal getTotalPrice() {
        BigDecimal total = BigDecimal.ZERO;
        for (CartItem item : items) {
            total = total.add(item.getProduct().getProductPrice().multiply(new BigDecimal(item.getQuantity())));
        }
        return total;
    }
}
