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
    <a href="TaskServlet?action=new&projectId=${projectId}" class="btn btn-gerer mb-3">Créer une Nouvelle Tâche</a>
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

