<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <title>Product Details</title>
  <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<h1>${product.productName}</h1>
<img src="${product.imageUrl}" alt="${product.productName}">
<p>${product.productDescription}</p>
<p><strong>$${product.productPrice}</strong></p>
<form action="addToCart" method="post">
  <input type="hidden" name="productId" value="${product.productId}" />
  <label for="quantity">Quantity:</label>
  <input type="number" name="productQuantity"  id="quantity" value="1" min="1" max="${product.productQuantity}" />
  <button type="submit">Add to Cart</button>
</form>


</body>
</html>
