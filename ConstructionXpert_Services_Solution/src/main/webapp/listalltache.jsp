<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste de Toutes les Tâches</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="mt-5">Liste de Toutes les Tâches</h1>
    <div class="row">
        <c:forEach var="task" items="${taskList}">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">${task.description}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">ID: ${task.id}</h6>
                        <p class="card-text">
                            <strong>Start Date:</strong> ${task.startDate}<br>
                            <strong>End Date:</strong> ${task.endDate}<br>
                            <strong>Status:</strong> ${task.status}<br>
                            <strong>Project ID:</strong> ${task.projet_Id}
                        </p>
                        <a href="TaskServlet?action=edit&id=${task.id}&projectId=${task.projet_Id}" class="btn btn-warning">Modifier</a>
                        <a href="TaskServlet?action=delete&id=${task.id}&projectId=${task.projet_Id}" class="btn btn-danger" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette tâche?');">Supprimer</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
