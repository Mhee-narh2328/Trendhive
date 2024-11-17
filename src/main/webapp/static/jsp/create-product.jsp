<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/admin/create-product" method="post" enctype="multipart/form-data">
  <label for="productName">Product Name:</label>
  <input type="text" name="productName" id="productName" required><br>

  <label for="productDescription">Description:</label>
  <textarea name="productDescription" id="productDescription" required></textarea><br>

  <label for="productPrice">Price:</label>
  <input type="number" name="productPrice" id="productPrice" step="0.01" required><br>

  <label for="productQuantity">Quantity:</label>
  <input type="number" name="productQuantity" id="productQuantity" required><br>

  <label for="imageUrl">Image URL:</label>
  <input type="file" name="imageUrl" id="imageUrl" required />

  <button type="submit">Add Product</button>
</form>


</body>
</html>
