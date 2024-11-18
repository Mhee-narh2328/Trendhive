<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <link rel="stylesheet" href="/css/style.css">--%>
<%--    <title>HOMEPAGE</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>This is the Homepage</h1>--%>
<%--<c:if test="${not empty sessionScope.username}">--%>
<%--    Welcome, ${sessionScope.username}! <a href="/logout">Logout</a>--%>
<%--</c:if>--%>
<%--<c:if test="${empty sessionScope.username}">--%>
<%--    <a href="/login">Login</a> | <a href="/register">Register</a>--%>
<%--</c:if>--%>

<%--</body>--%>
<%--</html>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/css/style.css">
    <title>Homepage</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            text-align: center;
            padding: 20px;
        }

        h1 {
            font-size: 3rem;
            color: #333;
            margin-bottom: 20px;
        }

        .container {
            background-color: white;
            padding: 40px 50px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }

        .container a {
            text-decoration: none;
            color: #fff;
            background-color: forestgreen;
            padding: 10px 20px;
            border-radius: 5px;
            margin: 10px;
            display: inline-block;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .container a:hover {
            background-color: #228b22;
        }

        .login-register {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }

        .logout-link {
            display: inline-block;
            background-color: #ff4b5c;
            padding: 10px 20px;
            color: white;
            font-weight: bold;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .logout-link:hover {
            background-color: #ff1e36;
        }

        .footer {
            position: absolute;
            bottom: 10px;
            width: 100%;
            text-align: center;
            font-size: 12px;
            color: #777;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>This is the Homepage</h1>

    <c:if test="${not empty sessionScope.username}">
        <p>Welcome, ${sessionScope.username}!</p>
        <a href="/logout" class="logout-link">Logout</a>
    </c:if>

    <c:if test="${empty sessionScope.username}">
        <div class="login-register">
            <a href="/login">Login</a>
            <a href="/register">Register</a>
        </div>
    </c:if>
</div>

<div class="footer">
    &copy; 2024 My Website. All rights reserved.
</div>

</body>
</html>
