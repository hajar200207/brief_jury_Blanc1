<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Formulaire de Tâche</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="mt-5">${task != null ? 'Modifier la Tâche' : 'Créer une Nouvelle Tâche'}</h1>
    <form action="TaskServlet" method="post">
        <input type="hidden" name="action" value="${task != null ? 'update' : 'create'}">
        <input type="hidden" name="id" value="${task != null ? task.id : ''}">
        <input type="hidden" name="projectId" value="${projectId}">

        <div class="form-group">
            <label for="description">Description</label>
            <input type="text" class="form-control" id="description" name="description" value="${task != null ? task.description : ''}">
        </div>
        <div class="form-group">
            <label for="startDate">Date de Début</label>
            <input type="date" class="form-control" id="startDate" name="startDate" value="${task != null ? task.startDate : ''}">
        </div>
        <div class="form-group">
            <label for="endDate">Date de Fin</label>
            <input type="date" class="form-control" id="endDate" name="endDate" value="${task != null ? task.endDate : ''}">
        </div>
        <div class="form-group">
    <label for="status">Statut</label>
    <select class="form-control" id="status" name="status">
        <option value="Terminé" ${task != null && task.status == 'Terminé' ? 'selected' : ''}>Terminé</option>
        <option value="À faire" ${task != null && task.status == 'À faire' ? 'selected' : ''}>À faire</option>
        <option value="En cours" ${task != null && task.status == 'En cours' ? 'selected' : ''}>En cours</option>
    </select>
</div>
        <button type="submit" class="btn btn-primary">${task != null ? 'Mettre à Jour' : 'Créer'}</button>
    </form>
</div>
</body>
</html>
