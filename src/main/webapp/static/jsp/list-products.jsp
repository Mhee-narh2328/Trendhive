<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>Product Table</title>
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
        width: 80%;
        text-align: center;
      }

      h1 {
        color: forestgreen;
        font-size: 24px;
      }

      table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
      }

      th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: center;
      }

      th {
        background-color: forestgreen;
        color: white;
      }

      td {
        background-color: #f9f9f9;
      }

      tr:nth-child(even) {
        background-color: #f2f2f2;
      }

      td a, td button {
        text-decoration: none;
        color: white;
        padding: 8px 15px;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
        border: none;
      }

      td a {
        background-color: forestgreen;
      }

      td a:hover {
        background-color: #228b22;
      }

      td button {
        background-color: forestgreen;
        border: none;
        cursor: pointer;
        margin-left: 5px;
      }

      td button:hover {
        background-color: #228b22;
      }

      .create-product-link {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 20px;
        background-color: forestgreen;
        color: white;
        text-decoration: none;
        border-radius: 5px;
      }

      .create-product-link:hover {
        background-color: #228b22;
      }

      .auth-links {
        margin-bottom: 20px;
      }
    </style>
  </head>
  <body>
  <div class="container">
    <!-- Check if the user is logged in -->
    <c:if test="${not empty sessionScope.username}">
      <p>Welcome, Admin ${sessionScope.username}! <a href="/logout">Logout</a></p>
    </c:if>

    <c:if test="${empty sessionScope.username}">
      <p class="auth-links"><a href="/login">Login</a> | <a href="/register">Register</a></p>
    </c:if>
    <table border="1">
      <thead>
      <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="product" items="${products}">
        <tr>

          <td>${product.productName}</td>
          <td>${product.productDescription}</td>
          <td>${product.productPrice}</td>
          <td>${product.productQuantity}</td>
          <td style="display: flex; gap: 10px">
            <a href="/admin/update-product?productId=${product.productId}">Edit</a>
            <a href="/admin/delete-product?productId=${product.productId}" onclick="return confirm('Are you sure?')"  style="display:inline;">Delete</a>
          </td>
        </tr>
      </c:forEach>
      </tbody>
      <%--    <a href="/admin/products?action=add">Add New Product</a>--%>

      <a href="/admin/create-product" class="create-product-link">Create New Product</a>
    </table>
  </div>

  </body>
</html>
