<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Your Wishlist</title>
</head>
<body>

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
<p>Your wishlist is empty!</p>
<%
  }
%>

</body>
</html>
