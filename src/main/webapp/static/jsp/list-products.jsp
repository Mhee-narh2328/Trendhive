<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Admin - List Products</title>
</head>
<body>
<h1>Products List</h1>

<!-- If there are any error messages, show them -->
<c:if test="${not empty error}">
    <div style="color: red;">${error}</div>
</c:if>

<!-- Table displaying all products -->
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
    <!-- Iterate through all products -->
    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.productName}</td>
            <td>${product.productDescription}</td>
            <td>${product.productPrice}</td>
            <td>${product.productQuantity}</td>
            <td>
                <!-- Edit link -->
                <a href="/admin?action=edit&productId=${product.id}">Edit</a> |
                <!-- Delete link -->
                <a href="/admin?action=delete&productId=${product.id}" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<br>
<a href="/admin?action=add">Add New Product</a>
</body>
</html>
