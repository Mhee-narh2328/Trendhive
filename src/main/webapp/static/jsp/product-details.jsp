<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <title>Product Details</title>
  <link rel="stylesheet" type="text/css" href="css/styles.css">
  <style>
  body {
  font-family: Arial, sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f5f5f5;
  margin: 0;
  }

  .card {
  background: #fff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  max-width: 400px;
  width: 100%;
  text-align: center;
  }

  .card h1 {
  color: #333;
  font-size: 24px;
  }

  .card img {
  margin: 10px 0;
  border-radius: 4px;
  }

  .card p {
  color: #555;
  margin: 10px 0;
  }

  .card strong {
  color: forestgreen;
  }

  .card form {
  display: inline-block;
  margin: 5px;
  }

  button, input[type="submit"] {
  background-color: forestgreen;
  color: #fff;
  border: none;
  padding: 10px 15px;
  border-radius: 5px;
  cursor: pointer;
  }

  button:hover, input[type="submit"]:hover {
  background-color: #0f3e0f;
  }

  input[type="number"] {
  width: 50px;
  text-align: center;
  margin-left: 10px;
  }

  .back-button {
  background-color: forestgreen;
  color: #fff;
  padding: 10px 15px;
  border-radius: 5px;
  text-decoration: none;
  display: inline-block;
  margin-bottom: 20px;
    align-items: flex-start;
  }

  .back-button:hover {
  background-color: #0f3e0f;
  }

  .description-title {
  font-weight: bold;
  color: #333;
  margin-top: 20px;
  }
  </style>
</head>
<body>
<div class="card">
  <div style="display: flex">
    <a href="javascript:history.back()" class="back-button">Go Back</a>
  </div>
  <h1>${product.productName}</h1>
  <img src="product-image?productId=${product.productId}" alt="${product.productName}" width="100px" />
  <p>${product.productDescription}</p>
  <p><strong>$${product.productPrice}</strong></p>
  <form action="addToCart" method="post">
    <input type="hidden" name="productId" value="${product.productId}" />
    <label for="quantity">Quantity:</label>
    <input type="number" name="productQuantity"  id="quantity" value="1" min="1" max="${product.productQuantity}" />
    <button type="submit">Add to Cart</button>
  </form>
  <form action="addToWishlist" method="POST">
    <input type="hidden" name="productId" value="${product.productId}" />
    <input type="submit" value="Add to Wishlist" />
  </form>
</div>
</body>
</html>

