<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Projets</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
        <h1 class="mt-5">Liste des Projets</h1>
        <a href="ProjectServlet?action=new" class="btn btn-gerer mb-3 ">Créer un Nouveau Projet</a>
        <div class="row">
            <c:forEach var="project" items="${projectList}">
                <div class="col-md-4 mb-4">
                    <div class="card card-custom">
                        <div class="card-body">
                            <h5 class="card-title">${project.name}</h5>
                            <h6 class="card-subtitle mb-2 text-muted">ID: ${project.id}</h6>
                            <p class="card-text">
                                <strong>Description:</strong> ${project.description}<br>
                                <strong>Date de Début:</strong> ${project.startDate}<br>
                                <strong>Date de Fin:</strong> ${project.endDate}<br>
                                <strong>Budget:</strong> ${project.budget}
                            </p>
                            <div class="d-flex flex-column">
                                <a href="ProjectServlet?action=edit&id=${project.id}" class="btn btn-modifier mb-2">Modifier</a>
                                <a href="ProjectServlet?action=delete&id=${project.id}" class="btn btn-supprimer mb-2">Supprimer</a>
                                <a href="TaskServlet?action=list&projectId=${project.id}" class="btn btn-gerer">Gérer les Tâches</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
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