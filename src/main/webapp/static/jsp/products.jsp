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
      height: 250px;
      object-fit: cover;
    }
    .product h3 {
      margin: 10px 0;
    }
    button{
      background-color: forestgreen;
      border: none;
      color: white;
      padding: 0.5rem 1rem;
      border-radius: 5px;
    }
    }
  </style>
</head>
<body>
<h1>Welcome to TrendHive</h1>
<div>
  <c:if test="${not empty sessionScope.username}">
    Welcome, ${sessionScope.username}! <a href="/logout">Logout</a>
  </c:if>
  <c:if test="${empty sessionScope.username}">
    <a href="/login">Login</a> | <a href="/register">Register</a>
  </c:if>
</div>


<c:forEach var="product" items="${products}">
  
  <div class="product">
    <img src="product-image?productId=${product.productId}" alt="${product.productName}" />
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