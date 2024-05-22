<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Projets</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="mt-5">Liste des Projets</h1>
    <a href="ProjectServlet?action=new" class="btn btn-primary mb-3">Créer un Nouveau Projet</a>
    <div class="row">
        <c:forEach var="project" items="${projectList}">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">${project.name}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">ID: ${project.id}</h6>
                        <p class="card-text">
                            <strong>Description:</strong> ${project.description}<br>
                            <strong>Date de Début:</strong> ${project.startDate}<br>
                            <strong>Date de Fin:</strong> ${project.endDate}<br>
                            <strong>Budget:</strong> ${project.budget}
                        </p>
                        <div>
                        <a href="ProjectServlet?action=edit&id=${project.id}" class="btn btn-warning">Modifier</a>
                        <a href="ProjectServlet?action=delete&id=${project.id}" class="btn btn-danger">Supprimer</a>
                        <a href="TaskServlet?action=list&projectId=${project.id}" class="btn btn-info">Gérer les Tâches</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>