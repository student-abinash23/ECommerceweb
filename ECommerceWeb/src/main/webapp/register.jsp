<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Registration</title>
    <style>
        body { font-family: sans-serif; background-color: #f7f7f7; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .register-box { background-color: white; padding: 40px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); width: 350px; text-align: center; }
        h2 { color: #333; margin-bottom: 20px; }
        input { width: 100%; padding: 12px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box; }
        input[type="submit"] { background-color: #28a745; color: white; border: none; padding: 12px; font-size: 16px; border-radius: 5px; cursor: pointer; width: 100%; transition: background-color 0.2s; }
        input[type="submit"]:hover { background-color: #218838; }
        .login-link { margin-top: 20px; }
    </style>
</head>
<body>
    <div class="register-box">
        <h2>Create a New Account</h2>
        <form action="${pageContext.request.contextPath}/user/register" method="post">
            <input type="text" id="name" name="name" placeholder="Full Name" required>
            <input type="email" id="email" name="email" placeholder="Email Address" required>
            <input type="password" id="password" name="password" placeholder="Password" required>
            <input type="tel" id="phone" name="phone" placeholder="Phone Number (Optional)">
            <input type="submit" value="Register">
        </form>
        <p class="login-link">Already have an account? <a href="${pageContext.request.contextPath}/login.jsp">Login here</a></p>
    </div>
</body>
</html>