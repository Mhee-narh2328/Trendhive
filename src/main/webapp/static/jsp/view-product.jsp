<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>View Products</title>
</head>
<body>
<h2>Products List</h2>

<c:if test="${not empty error}">
    <div style="color: red;">${error}</div>
</c:if>

<table border="1">
    <thead>
    <tr>
        <th>Product Name</th>
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
                <a href="/admin/products?action=edit&id=${product.productId}">Edit</a> |
                <a href="/admin/products?action=delete&id=${product.productId}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
