<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f5f5f5;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    .container {
      background: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      width: 60%;
      max-width: 800px;
      text-align: left;
    }

    h1 {
      color: #333;
      text-align: center;
      margin-bottom: 20px;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    label {
      font-size: 16px;
      font-weight: bold;
      margin-bottom: 5px;
    }

    input[type="text"], input[type="number"], textarea, input[type="file"] {
      padding: 10px;
      font-size: 14px;
      border: 1px solid #ddd;
      border-radius: 5px;
      width: 100%;
    }

    textarea {
      resize: vertical;
      height: 100px;
    }

    button[type="submit"] {
      background-color: forestgreen;
      color: white;
      border: none;
      padding: 10px 15px;
      font-size: 16px;
      font-weight: bold;
      border-radius: 5px;
      cursor: pointer;
      align-self: center;
      width: auto;
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

    button[type="submit"]:hover {
      background-color: #228b22;
    }

    .form-footer {
      text-align: center;
    }
  </style>
</head>
<body>
<div class="container">
  <div style="display: flex">
    <a href="javascript:history.back()" class="back-button">Go Back</a>
  </div>
  <h1>Add new Product</h1>
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

</div>

</body>
</html>
