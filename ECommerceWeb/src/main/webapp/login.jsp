<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Login</title>
    <style>
        body { font-family: sans-serif; background-color: #f7f7f7; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .login-box { background-color: white; padding: 40px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); width: 350px; text-align: center; }
        h2 { color: #333; margin-bottom: 20px; }
        input[type="email"], input[type="password"] { width: 100%; padding: 12px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box; }
        input[type="submit"] { background-color: #007bff; color: white; border: none; padding: 12px; font-size: 16px; border-radius: 5px; cursor: pointer; width: 100%; transition: background-color 0.2s; }
        input[type="submit"]:hover { background-color: #0056b3; }
        .error { color: #dc3545; background-color: #f8d7da; border: 1px solid #f5c6cb; padding: 10px; border-radius: 5px; margin-bottom: 15px; }
        .success { color: #155724; background-color: #d4edda; border: 1px solid #c3e6cb; padding: 10px; border-radius: 5px; margin-bottom: 15px; }
        .register-link { margin-top: 20px; }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>User Login</h2>
        
        <c:if test="${not empty errorMessage}">
            <p class="error">${errorMessage}</p>
        </c:if>
        <c:if test="${not empty param.registrationSuccess}">
            <p class="success">Registration successful! Please log in.</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/user/login" method="post">
            <input type="email" id="email" name="email" placeholder="Email" required>
            <input type="password" id="password" name="password" placeholder="Password" required>
            <input type="submit" value="Login">
        </form>
        
        <p class="register-link">New user? <a href="${pageContext.request.contextPath}/register.jsp">Register here</a></p>
    </div>
</body>
</html>