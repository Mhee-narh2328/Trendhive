<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <title>Add Product</title>
</head>
<body>
<h2>Add Product</h2>

<form action="/admin" method="post">
  <input type="hidden" name="action" value="create">
  <label>Product Name:</label> <input type="text" name="productName" required><br>
  <label>Description:</label> <textarea name="productDescription" required></textarea><br>
  <label>Price:</label> <input type="number" name="productPrice" step="0.01" required><br>
  <label>Quantity:</label> <input type="number" name="productQuantity" required><br>
  <label>Image URL:</label> <input type="text" name="imageUrl" required><br>
  <button type="submit">Add Product</button>
</form>

</body>
</html>
