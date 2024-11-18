<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Your Wishlist</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f5f5f5;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
    }

    .container {
      background: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      max-width: 800px;
      width: 100%;
      text-align: center;
    }

    h1 {
      color: #333;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px 0;
    }

    th, td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: center;
    }

    th {
      background-color: #28a745;
      color: white;
    }

    input[type="submit"] {
      background-color: forestgreen;
      color: white;
      border: none;
      padding: 8px 12px;
      border-radius: 5px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #228b22; /* Darker forest green */
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

    .empty-wishlist {
      color: #555;
      font-size: 1.1em;
    }
  </style>
</head>
<body>
<div class="container">
  <div style="display: flex">
    <a href="javascript:history.back()" class="back-button">Go Back</a>
  </div>
  <h1>Your Wishlist</h1>

  <%
    users.models.Wishlist wishlist = (users.models.Wishlist) session.getAttribute("wishlist");
    if (wishlist != null && !wishlist.getProducts().isEmpty()) {
  %>
  <table border="1">
    <thead>
    <tr>
      <th>Product</th>
      <th>Price</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${wishlist.products}">
      <tr>
        <td>${product.productName}</td>
        <td>${product.productPrice}</td>
        <td>
          <!-- Remove product from wishlist -->
          <form action="/removeFromWishlist" method="POST">
            <input type="hidden" name="productId" value="${product.productId}" />
            <input type="submit" value="Remove" />
          </form>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

  <%
  } else {
  %>
  <p class="empty-wishlist">Your wishlist is empty!</p>
  <%
    }
  %>
</div>
</body>
</html>
