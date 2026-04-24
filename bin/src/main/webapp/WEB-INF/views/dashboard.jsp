<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard – UniRegister</title>
    <meta name="description" content="View and manage your enrolled courses." />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" />
</head>
<body>

<%-- ===== Navigation bar ===== --%>
<nav class="navbar">
    <div class="nav-brand">🎓 UniRegister</div>
    <div class="nav-links">
        <span class="nav-user">👤 ${sessionScope.fullName}</span>
        <a href="${pageContext.request.contextPath}/courses" class="nav-link">All Courses</a>
        <c:if test="${sessionScope.role == 'admin'}">
            <a href="${pageContext.request.contextPath}/courses/add" class="nav-link">+ Add Course</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/logout" class="nav-link nav-logout">Logout</a>
    </div>
</nav>

<%-- ===== Main Content ===== --%>
<main class="container">

    <%-- Flash Messages --%>
    <c:if test="${not empty success}">
        <div class="alert alert-success">${success}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-error">${error}</div>
    </c:if>

    <%-- Welcome Banner --%>
    <section class="welcome-banner">
        <div>
            <h1>Welcome back, ${sessionScope.fullName}!</h1>
            <p>You are enrolled in <strong>${registrationCount}</strong> course(s) this semester.</p>
        </div>
    </section>

    <%-- ===== My Registered Courses ===== --%>
    <section class="card-section">
        <h2 class="section-title">📚 My Registered Courses</h2>

        <c:choose>
            <c:when test="${empty myRegistrations}">
                <div class="empty-state">
                    <p>You haven't registered for any courses yet. Browse available courses below!</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-wrapper">
                    <table class="data-table" id="myCoursesTable">
                        <thead>
                            <tr>
                                <th>Course Code</th>
                                <th>Course Name</th>
                                <th>Registered On</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="reg" items="${myRegistrations}">
                            <tr>
                                <td><span class="badge">${reg.courseCode}</span></td>
                                <td>${reg.courseName}</td>
                                <td>
                                    <fmt:formatDate value="${reg.registeredAt}" pattern="dd MMM yyyy" />
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/registration/drop" method="post"
                                          onsubmit="return confirm('Drop ${reg.courseName}?');">
                                        <input type="hidden" name="registrationId" value="${reg.id}" />
                                        <input type="hidden" name="courseId"       value="${reg.courseId}" />
                                        <button type="submit" class="btn btn-danger btn-sm">Drop</button>
                                    </form>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </section>

    <%-- ===== Available Courses ===== --%>
    <section class="card-section">
        <h2 class="section-title">🗂️ Available Courses</h2>

        <c:choose>
            <c:when test="${empty availableCourses}">
                <div class="empty-state">
                    <p>No more courses available, or you've registered for all of them!</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-wrapper">
                    <table class="data-table" id="availableCoursesTable">
                        <thead>
                            <tr>
                                <th>Code</th>
                                <th>Name</th>
                                <th>Instructor</th>
                                <th>Credits</th>
                                <th>Seats Left</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="course" items="${availableCourses}">
                            <tr>
                                <td><span class="badge">${course.courseCode}</span></td>
                                <td>${course.courseName}</td>
                                <td>${course.instructor}</td>
                                <td>${course.credits}</td>
                                <td>
                                    <span class="seats ${course.availableSeats <= 5 ? 'seats-low' : ''}">
                                        ${course.availableSeats}
                                    </span>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/registration/register" method="post">
                                        <input type="hidden" name="courseId" value="${course.id}" />
                                        <button type="submit" class="btn btn-primary btn-sm">Register</button>
                                    </form>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </section>

</main>

</body>
</html>
