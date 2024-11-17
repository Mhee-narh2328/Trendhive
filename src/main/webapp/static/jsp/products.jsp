<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <title>Product Page</title>
  <style>
    .product {
      border: 1px solid #ccc;
      padding: 10px;
      margin: 10px;
      width: 200px;
      display: inline-block;
      text-align: center;
    }
    .product img {
      width: 100%;
      height: auto;
    }
    .product h3 {
      margin: 10px 0;
    }
  </style>
</head>
<body>
<h1>Welcome to Our E-commerce Website</h1>

<c:forEach var="product" items="${products}">
  <div class="product">
    <img src="${product.imageUrl}" alt="${product.productName}">
    <h3>${product.productName}</h3>
    <p>${product.productDescription}</p>
    <p><strong>$${product.productPrice}</strong></p>
    <form action="${pageContext.request.contextPath}/productDetails" method="get">
      <input type="hidden" name="productId" value="${product.productId}">
      <button type="submit">View Details</button>
    </form>
  </div>
</c:forEach>
</body>
</html>