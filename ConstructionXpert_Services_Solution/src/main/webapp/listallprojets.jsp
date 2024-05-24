<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Project List</title>
</head>
<body>
<h2>All Projects</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Budget</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="project" items="${projectList}">
        <tr>
            <td>${project.id}</td>
            <td>${project.name}</td>
            <td>${project.description}</td>
            <td>${project.startDate}</td>
            <td>${project.endDate}</td>
            <td>${project.budget}</td>
            <td>
                <a href="ProjectServlet?action=edit&id=${project.id}">Edit</a>
                <a href="ProjectServlet?action=delete&id=${project.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="ProjectServlet?action=new">Add New Project</a>
</body>
</html>
