package users.models;

import java.math.BigDecimal;

public class Product {
    private int productId;
    private String productName;
    private String productDescription;
    private BigDecimal productPrice;
    private byte[] imageUrl;
    private int productQuantity;

    //Default constructor
    public Product() {
    }

    // Parameterized Constructor


    public Product(int productId, String productName, String productDescription, BigDecimal productPrice, byte[] imageUrl, int productQuantity) {
        this.productId = productId;
        this.productName = productName;
        this.productDescription = productDescription;
        this.productPrice = productPrice;
        this.imageUrl = imageUrl;
        this.productQuantity = productQuantity;
    }

    // Constructor without ID for adding new product
    public Product(String productName, String productDescription, BigDecimal productPrice, int productQuantity, byte[] imageUrl) {
        this.productName = productName;
        this.productDescription = productDescription;
        this.productPrice = productPrice;
        this.productQuantity = productQuantity;
        this.imageUrl = imageUrl;
    }



    //Getters and setters


    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public BigDecimal getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(BigDecimal productPrice) {
        this.productPrice = productPrice;
    }

    public byte[] getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(byte[] imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }
}
