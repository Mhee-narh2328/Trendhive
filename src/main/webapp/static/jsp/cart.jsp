<%--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <title>Your Shopping Cart</title>--%>
<%--</head>--%>
<%--<body>--%>

<%--<h1>Your Shopping Cart</h1>--%>

<%--<%--%>
<%--  users.models.Cart cart = (users.models.Cart) session.getAttribute("cart");--%>
<%--  if (cart != null && !cart.getItems().isEmpty()) {--%>
<%--%>--%>
<%--<table border="1">--%>
<%--  <thead>--%>
<%--  <tr>--%>
<%--    <th>Product</th>--%>
<%--    <th>Quantity</th>--%>
<%--    <th>Price</th>--%>
<%--    <th>Total</th>--%>
<%--  </tr>--%>
<%--  </thead>--%>
<%--  <tbody>--%>
<%--  <c:forEach var="item" items="${cart.items}">--%>
<%--    <tr>--%>
<%--      <td>${item.product.productName}</td>--%>
<%--      <td>${item.quantity}</td>--%>
<%--      <td>${item.product.productPrice}</td>--%>
<%--      <td>${item.product.productPrice * item.quantity}</td>--%>
<%--    </tr>--%>
<%--  </c:forEach>--%>
<%--  </tbody>--%>
<%--</table>--%>

<%--<h3>Total: $<%= cart.getTotalPrice() %></h3>--%>

<%--<%--%>
<%--} else {--%>
<%--%>--%>
<%--<p>Your cart is empty!</p>--%>
<%--<%--%>
<%--  }--%>
<%--%>--%>

<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Your Shopping Cart</title>
</head>
<body>

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
<p>Your cart is empty!</p>
<%
  }
%>

</body>
</html>
