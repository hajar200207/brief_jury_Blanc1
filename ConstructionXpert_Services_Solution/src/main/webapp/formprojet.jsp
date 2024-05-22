<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Formulaire de Projet</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="mt-5">${project == null ? 'Créer un Nouveau Projet' : 'Modifier le Projet'}</h1>
    <form action="ProjectServlet" method="post">
        <input type="hidden" name="id" value="${project.id}">
        <div class="form-group">
            <label for="name">Nom</label>
            <input type="text" class="form-control" id="name" name="name" value="${project.name}" required>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea class="form-control" id="description" name="description" rows="3" required>${project.description}</textarea>
        </div>
        <div class="form-group">
            <label for="startDate">Date de Début</label>
            <input type="date" class="form-control" id="startDate" name="startDate" value="${project.startDate}" required>
        </div>
        <div class="form-group">
            <label for="endDate">Date de Fin</label>
            <input type="date" class="form-control" id="endDate" name="endDate" value="${project.endDate}" required>
        </div>
        <div class="form-group">
            <label for="budget">Budget</label>
            <input type="number" class="form-control" id="budget" name="budget" value="${project.budget}" required>
        </div>
        <button type="submit" class="btn btn-primary" name="action" value="${project == null ? 'create' : 'update'}">
            ${project == null ? 'Créer' : 'Mettre à jour'}
        </button>
    </form>
</div>
</body>
</html>
