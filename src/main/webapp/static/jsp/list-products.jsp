<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>Title</title>
  </head>
  <body>
  <!-- Check if the user is logged in -->
  <c:if test="${not empty sessionScope.username}">
    <p>Welcome, ${sessionScope.username}! <a href="/logout">Logout</a></p>
  </c:if>

  <c:if test="${empty sessionScope.username}">
    <p><a href="/login">Login</a> | <a href="/register">Register</a></p>
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
        <td>
          <a href="/admin/update-product?productId=${product.productId}">Edit</a>
          <a href="/admin/delete-product?productId=${product.productId}" onclick="return confirm('Are you sure?')">Delete</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
<%--    <a href="/admin/products?action=add">Add New Product</a>--%>

    <a href="/admin/create-product">Create New Product</a>
  </table>

  </body>
</html>
