<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Login - University Course Registration</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f2f5; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .card { background: white; padding: 40px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); width: 360px; }
        h2 { text-align: center; color: #333; margin-bottom: 24px; }
        label { display: block; margin-bottom: 4px; color: #555; font-size: 14px; }
        input { width: 100%; padding: 10px; margin-bottom: 16px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; font-size: 14px; }
        button { width: 100%; padding: 12px; background: #4a90d9; color: white; border: none; border-radius: 4px; font-size: 16px; cursor: pointer; }
        button:hover { background: #357abd; }
        .alert { padding: 10px; border-radius: 4px; margin-bottom: 16px; font-size: 14px; }
        .alert-error { background: #ffe0e0; color: #c00; border: 1px solid #f5c6c6; }
        .alert-success { background: #e0ffe0; color: #060; border: 1px solid #c6f5c6; }
        .hint { text-align: center; margin-top: 16px; font-size: 12px; color: #888; }
    </style>
</head>
<body>
<div class="card">
    <h2>🎓 University Login</h2>

    <c:if test="${not empty error}">
        <div class="alert alert-error">${error}</div>
    </c:if>
    <c:if test="${not empty message}">
        <div class="alert alert-success">${message}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required/>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required/>

        <button type="submit">Login</button>
    </form>

    <p class="hint">Demo: alice@university.edu / alice123 &nbsp;|&nbsp; bob@university.edu / bob123</p>
</div>
</body>
</html>
