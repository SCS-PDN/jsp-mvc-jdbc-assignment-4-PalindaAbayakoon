<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>All Courses – UniRegister</title>
    <meta name="description" content="Browse all university courses." />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" />
</head>
<body>

<nav class="navbar">
    <div class="nav-brand">🎓 UniRegister</div>
    <div class="nav-links">
        <span class="nav-user">👤 ${sessionScope.fullName}</span>
        <a href="${pageContext.request.contextPath}/dashboard" class="nav-link">Dashboard</a>
        <c:if test="${sessionScope.role == 'admin'}">
            <a href="${pageContext.request.contextPath}/courses/add" class="nav-link">+ Add Course</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/logout" class="nav-link nav-logout">Logout</a>
    </div>
</nav>

<main class="container">

    <c:if test="${not empty success}">
        <div class="alert alert-success">${success}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-error">${error}</div>
    </c:if>

    <div class="page-header">
        <h1>Course Catalogue</h1>
        <p>Browse all courses offered this semester.</p>
    </div>

    <div class="table-wrapper">
        <table class="data-table" id="courseCatalogueTable">
            <thead>
                <tr>
                    <th>Code</th>
                    <th>Course Name</th>
                    <th>Instructor</th>
                    <th>Credits</th>
                    <th>Capacity</th>
                    <th>Enrolled</th>
                    <th>Available</th>
                    <c:if test="${sessionScope.role == 'admin'}">
                        <th>Actions</th>
                    </c:if>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="course" items="${courses}">
                <tr>
                    <td><span class="badge">${course.courseCode}</span></td>
                    <td>${course.courseName}</td>
                    <td>${course.instructor}</td>
                    <td>${course.credits}</td>
                    <td>${course.capacity}</td>
                    <td>${course.enrolled}</td>
                    <td>
                        <span class="seats ${course.availableSeats <= 5 ? 'seats-low' : ''}">
                            ${course.availableSeats}
                        </span>
                    </td>
                    <c:if test="${sessionScope.role == 'admin'}">
                        <td class="action-cell">
                            <a href="${pageContext.request.contextPath}/courses/edit/${course.id}"
                               class="btn btn-secondary btn-sm">Edit</a>
                            <form action="${pageContext.request.contextPath}/courses/delete"
                                  method="post" style="display:inline;"
                                  onsubmit="return confirm('Delete course ${course.courseCode}?');">
                                <input type="hidden" name="id" value="${course.id}" />
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </c:if>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</main>
</body>
</html>
