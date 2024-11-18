<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Your Shopping Cart</title>
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
      border: 1px solid forestgreen;
      padding: 8px;
      text-align: center;
    }

    th {
      background-color: forestgreen;
      color: white;
    }

    input[type="number"] {
      width: 60px;
      text-align: center;
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
      background-color: forestgreen;
    }

    .total {
      font-size: 1.2em;
      margin-top: 20px;
      color: #333;
    }

    .empty-cart {
      color: #555;
      font-size: 1.1em;
    }

    .add-to-cart {
      margin-top: 20px;
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

    .add-to-cart button {
      background-color: #28a745;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
      font-size: 1em;
    }

    .add-to-cart button:hover {
      background-color: #218838;
    }
  </style>
</head>
<body>
<div class="container">
  <div style="display: flex">
    <a href="javascript:history.back()" class="back-button">Go Back</a>
  </div>
  <h1>Your Shopping Cart</h1>

  <%
    users.models.Cart cart = (users.models.Cart) session.getAttribute("cart");
    if (cart != null && !cart.getItems().isEmpty()) {
  %>
  <table border="1">
    <thead>
    <tr>
      <th>Product</th>
      <th>Quantity</th>
      <th>Price</th>
      <th>Total</th>
      <th>Actions</th> <!-- New column for actions -->
    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${cart.items}">
      <tr>
        <td>${item.product.productName}</td>
        <td>${item.product.productPrice}</td>
        <td>${item.product.productPrice * item.quantity}</td>
        <td>
          <!-- Form to update quantity -->
          <form action="/updateCartItem" method="POST">
            <input type="hidden" name="productId" value="${item.product.productId}" />
            <input type="number" name="productQuantity" value="${item.quantity}" min="1" />
            <input type="submit" value="Update" />
          </form>
        </td>
        <td>
          <!-- Form to remove the item -->
          <form action="/removeFromCart" method="POST">
            <input type="hidden" name="productId" value="${item.product.productId}" />
            <input type="submit" value="Remove" />
          </form>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

  <h3>Total: $<%= cart.getTotalPrice() %></h3>

  <%
  } else {
  %>
  <p class="empty-cart">Your cart is empty!</p>
  <%
    }
  %>


</div>
</body>
</html>
