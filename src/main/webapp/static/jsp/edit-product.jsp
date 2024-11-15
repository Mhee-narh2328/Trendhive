<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <title>Edit Product</title>
</head>
<body>
<h2>Edit Product</h2>

<form action="/admin" method="post">
  <input type="hidden" name="action" value="update">
  <input type="hidden" name="productId" value="${product.id}">
  <label>Product Name:</label> <input type="text" name="productName" value="${product.name}" required><br>
  <label>Product Description:</label> <textarea name="productDescription" required>${product.description}</textarea><br>
  <label>Product Price:</label> <input type="number" name="productPrice" step="0.01" value="${product.price}" required><br>
  <label>Product Quantity:</label> <input type="number" name="productQuantity" value="${product.quantity}" required><br>
  <label>Image URL:</label> <input type="text" name="imageUrl" value="${product.imageUrl}" required><br>
  <button type="submit">Update Product</button>
</form>
</body>
</html>
