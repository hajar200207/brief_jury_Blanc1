<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Tâches</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <style>
      
        .card-custom {
            border: 2px solid yellow; 
            border-radius: 15px; 
            transition: transform 0.3s ease-in-out;
        }
        .card-custom:hover {
            cursor: pointer; 
        }
        .card-expanded {
            transform: scale(1.05); 
            z-index: 1000; 
            position: relative;
        }
        .btn-modifier {
            background-color: gold;
            border-color: gold;
            color: black;
        }
        .btn-supprimer {
            background-color: black;
            border-color: black;
            color: white;
        }
        .btn-gerer {
            background-color: grey;
            border-color: grey;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mt-5">Liste des Tâches</h1>
   <a href="#" class="btn btn-gerer mb-3" data-toggle="modal" data-target="#taskModal">Créer une Nouvelle Tâche</a>
   
    <div class="row">
        <c:forEach var="task" items="${taskList}">
            <div class="col-md-4 mb-4">
                <div class="card card-custom">
                    <div class="card-body">
                        <h5 class="card-title">${task.description}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">ID: ${task.id}</h6>
                        <p class="card-text">
                            <strong>Date de Début:</strong> ${task.startDate}<br>
                            <strong>Date de Fin:</strong> ${task.endDate}<br>
                            <strong>Statut:</strong> ${task.status}
                        </p>
                        <div  class="d-flex flex-column">
                        <a href="TaskServlet?action=edit&id=${task.id}&projectId=${projectId}" class="btn btn-modifier">Modifier</a>
                        <a href="TaskServlet?action=delete&id=${task.id}&projectId=${projectId}" class="btn btn-supprimer">Supprimer</a>
                        <a href="ResourceServlet?action=list&taskId=${task.id}" class="btn btn-gerer">Gérer les Ressources</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<div class="modal fade" id="taskModal" tabindex="-1" aria-labelledby="taskModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="taskModalLabel">${task != null ? 'Modifier la Tâche' : 'Créer une Nouvelle Tâche'}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
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
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const cards = document.querySelectorAll('.card-custom');
        cards.forEach(card => {
            card.addEventListener('click', function() {
                card.classList.toggle('card-expanded');
            });
        });
    });
</script>
</body>
</html>

