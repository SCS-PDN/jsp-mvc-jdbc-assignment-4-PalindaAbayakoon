<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Available Courses</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f2f5; margin: 0; padding: 0; }
        nav { background: #4a90d9; color: white; padding: 14px 30px; display: flex; justify-content: space-between; align-items: center; }
        nav h1 { margin: 0; font-size: 20px; }
        nav a { color: white; text-decoration: none; margin-left: 20px; font-size: 14px; }
        nav a:hover { text-decoration: underline; }
        .container { max-width: 900px; margin: 30px auto; padding: 0 20px; }
        h2 { color: #333; }
        table { width: 100%; border-collapse: collapse; background: white; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 6px rgba(0,0,0,0.08); }
        th { background: #4a90d9; color: white; padding: 12px 16px; text-align: left; }
        td { padding: 12px 16px; border-bottom: 1px solid #eee; }
        tr:last-child td { border-bottom: none; }
        tr:hover td { background: #f8f9fa; }
        .btn { padding: 7px 16px; background: #28a745; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 13px; }
        .btn:hover { background: #218838; }
        .alert { padding: 10px 16px; border-radius: 4px; margin-bottom: 16px; font-size: 14px; }
        .alert-error { background: #ffe0e0; color: #c00; border: 1px solid #f5c6c6; }
        .welcome { color: #555; margin-bottom: 20px; }
    </style>
</head>
<body>

<nav>
    <h1>🎓 University Course Registration</h1>
    <div>
        <span>Welcome, ${sessionScope.studentName}</span>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</nav>

<div class="container">
    <h2>Available Courses</h2>

    <c:if test="${not empty error}">
        <div class="alert alert-error">${error}</div>
    </c:if>

    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Course Name</th>
                <th>Instructor</th>
                <th>Credits</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="course" items="${courses}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${course.name}</td>
                <td>${course.instructor}</td>
                <td>${course.credits}</td>
                <td>
                    <form action="${pageContext.request.contextPath}/register/${course.courseId}" method="post">
                        <button type="submit" class="btn">Register</button>
                    </form>
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
