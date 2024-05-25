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
        <a href="ProjectServlet?action=new" class="btn btn-gerer mb-3">Créer un Nouveau Projet</a>
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
                                 <button class="btn btn-warning btn-modifier" 
                data-toggle="modal" 
                data-target="#editProjectModal" 
                data-id="${project.id}"
                onclick="openUpdateModal(${project.id}, '${project.name}', '${project.description}', '${project.startDate}', '${project.endDate}', '${project.budget}')">Modifier</button>
                                <a href="ProjectServlet?action=delete&id=${project.id}" class="btn btn-supprimer mb-2">Supprimer</a>
                                <a href="TaskServlet?action=list&projectId=${project.id}" class="btn btn-gerer">Gérer les Tâches</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Modal -->
   <!-- Modal -->
<div class="modal fade" id="editProjectModal" tabindex="-1" role="dialog" aria-labelledby="editProjectModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editProjectModalLabel">Modifier le Projet</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="updateProjectForm" method="post" action="ProjectServlet">
                    <input type="hidden" id="updateProjectId" name="id">
                    <div class="form-group">
                        <label for="updateProjectName">Nom</label>
                        <input type="text" class="form-control" id="updateProjectName" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="updateProjectDescription">Description</label>
                        <textarea class="form-control" id="updateProjectDescription" name="description" rows="3" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="updateProjectStartDate">Date de Début</label>
                        <input type="date" class="form-control" id="updateProjectStartDate" name="startDate" required>
                    </div>
                    <div class="form-group">
                        <label for="updateProjectEndDate">Date de Fin</label>
                        <input type="date" class="form-control" id="updateProjectEndDate" name="endDate" required>
                    </div>
                    <div class="form-group">
                        <label for="updateProjectBudget">Budget</label>
                        <input type="number" class="form-control" id="updateProjectBudget" name="budget" required>
                    </div>
                    <button type="submit" class="btn btn-primary" name="action" value="update">Mettre à jour</button>
                </form>
            </div>
        </div>
    </div>
</div>
   
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
    function openUpdateModal(projectId, projectName, projectDescription, projectStartDate, projectEndDate, projectBudget) {
        // Set the form action URL with the project ID
        document.getElementById('updateProjectForm').action = "ProjectServlet?action=update&id=" + projectId;

        // Set the form fields with the current project data
        document.getElementById('updateProjectId').value = projectId;
        document.getElementById('updateProjectName').value = projectName;
        document.getElementById('updateProjectDescription').value = projectDescription;
        document.getElementById('updateProjectStartDate').value = projectStartDate;
        document.getElementById('updateProjectEndDate').value = projectEndDate;
        document.getElementById('updateProjectBudget').value = projectBudget;

        // Show the modal
        $('#editProjectModal').modal('show');
    }

    $(document).ready(function() {
        $('#editProjectModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var projectId = button.data('id'); // Extract info from data-* attributes

            // Use AJAX to load the form
            $.get('ProjectServlet?action=edit&id=' + projectId, function(data) {
                var project = JSON.parse(data); // Assuming the data is returned as JSON
                openUpdateModal(project.id, project.name, project.description, project.startDate, project.endDate, project.budget);
            });
        });
    });
    </script>
</body>
</html>
