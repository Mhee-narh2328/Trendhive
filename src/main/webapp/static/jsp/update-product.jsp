<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 11/16/2024
  Time: 12:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/admin/update-product" method="post">
    <input type="hidden" name="productId" value="${product.productId}">

    <label for="productName">Product Name:</label>
    <input type="text" name="productName" id="productName" value="${product.productName}" required><br>

    <label for="productDescription">Description:</label>
    <textarea name="productDescription" id="productDescription" required>${product.productDescription}</textarea><br>

    <label for="productPrice">Price:</label>
    <input type="number" name="productPrice" step="0.01" id="productPrice" value="${product.productPrice}" required><br>

    <label for="productQuantity">Quantity:</label>
    <input type="number" name="productQuantity" id="productQuantity" value="${product.productQuantity}" required><br>

    <label for="imageUrl">Image URL:</label>
    <input type="text" name="imageUrl" id="imageUrl" value="${product.imageUrl}" required><br>

    <button type="submit">Update Product</button>
</form>


</body>
</html>
