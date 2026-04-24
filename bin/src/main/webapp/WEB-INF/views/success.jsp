<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Registration Successful</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f2f5; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .card { background: white; padding: 40px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); width: 420px; text-align: center; }
        .icon { font-size: 60px; margin-bottom: 16px; }
        h2 { color: #28a745; margin-bottom: 8px; }
        p { color: #555; margin: 8px 0; }
        .course-box { background: #f8f9fa; border-radius: 6px; padding: 16px; margin: 20px 0; text-align: left; }
        .course-box p { margin: 6px 0; font-size: 15px; }
        .course-box strong { color: #333; }
        a { display: inline-block; margin-top: 16px; padding: 10px 24px; background: #4a90d9; color: white; text-decoration: none; border-radius: 4px; }
        a:hover { background: #357abd; }
    </style>
</head>
<body>
<div class="card">
    <div class="icon">✅</div>
    <h2>Registration Successful!</h2>
    <p>You have successfully enrolled in:</p>

    <div class="course-box">
        <p><strong>Course:</strong> ${courseName}</p>
        <p><strong>Instructor:</strong> ${instructor}</p>
        <p><strong>Credits:</strong> ${credits}</p>
    </div>

    <p>Good luck with your studies, ${sessionScope.studentName}!</p>

    <a href="${pageContext.request.contextPath}/courses">← Back to Courses</a>
</div>
</body>
</html>
