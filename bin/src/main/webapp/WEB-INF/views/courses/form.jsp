<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${empty course.id ? 'Add Course' : 'Edit Course'} – UniRegister</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" />
</head>
<body>

<nav class="navbar">
    <div class="nav-brand">🎓 UniRegister</div>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/dashboard"  class="nav-link">Dashboard</a>
        <a href="${pageContext.request.contextPath}/courses"    class="nav-link">All Courses</a>
        <a href="${pageContext.request.contextPath}/logout"     class="nav-link nav-logout">Logout</a>
    </div>
</nav>

<main class="container">
    <div class="form-card">

        <h1 class="form-title">
            <c:choose>
                <c:when test="${empty course.id or course.id == 0}">➕ Add New Course</c:when>
                <c:otherwise>✏️ Edit Course</c:otherwise>
            </c:choose>
        </h1>

        <c:set var="formAction"
               value="${empty course.id or course.id == 0
                        ? pageContext.request.contextPath.concat('/courses/add')
                        : pageContext.request.contextPath.concat('/courses/edit')}" />

        <form id="courseForm" action="${formAction}" method="post" novalidate>
            <c:if test="${not empty course.id and course.id != 0}">
                <input type="hidden" name="id" value="${course.id}" />
            </c:if>

            <div class="form-row">
                <div class="form-group">
                    <label for="courseCode">Course Code *</label>
                    <input id="courseCode" type="text" name="courseCode" class="form-control"
                           value="${course.courseCode}" placeholder="e.g. CS101" required />
                </div>
                <div class="form-group">
                    <label for="credits">Credits *</label>
                    <input id="credits" type="number" name="credits" class="form-control"
                           value="${empty course.credits ? 3 : course.credits}"
                           min="1" max="6" required />
                </div>
            </div>

            <div class="form-group">
                <label for="courseName">Course Name *</label>
                <input id="courseName" type="text" name="courseName" class="form-control"
                       value="${course.courseName}" placeholder="e.g. Introduction to Computer Science"
                       required />
            </div>

            <div class="form-group">
                <label for="instructor">Instructor *</label>
                <input id="instructor" type="text" name="instructor" class="form-control"
                       value="${course.instructor}" placeholder="e.g. Dr. Jane Smith" required />
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control"
                          rows="3" placeholder="Brief course description...">${course.description}</textarea>
            </div>

            <div class="form-group">
                <label for="capacity">Seat Capacity *</label>
                <input id="capacity" type="number" name="capacity" class="form-control"
                       value="${empty course.capacity ? 30 : course.capacity}"
                       min="1" required />
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary" id="saveBtn">
                    <c:choose>
                        <c:when test="${empty course.id or course.id == 0}">Add Course</c:when>
                        <c:otherwise>Save Changes</c:otherwise>
                    </c:choose>
                </button>
                <a href="${pageContext.request.contextPath}/courses" class="btn btn-secondary">Cancel</a>
            </div>
        </form>

    </div>
</main>
</body>
</html>
