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
     body {
    background-color: grey;
}
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
               body, h1, h2, h3, h4, h5, h6 {
            font-family: "Montserrat", sans-serif;
        }
        .w3-row-padding img {
            margin-bottom: 12px;
        }
        .w3-sidebar {
            width: 120px;
            background: gold;
        }
        #main {
            margin-left: 120px;
        }
        @media only screen and (max-width: 600px) {
            #main {
                margin-left: 0;
            }
        }
        .section-content {
            display: none;
        }
        th,
        td {
            background-color: white;
        }
    .modal-content {
    background-color: black;
    color: white;
}

.modal-body .form-group label {
    color: white;
}

.modal-body .form-control {
    background-color: black;
    color: white;
    border-color: #4d4d4d; /* Adjust border color as needed */
}

.modal-body .btn-primary {
    background-color: #007bff; /* Bootstrap primary color */
    border-color: #007bff; /* Bootstrap primary color */
}

.modal-body .btn-primary:hover {
    background-color: #0056b3; /* Darker shade of primary color */
    border-color: #0056b3; /* Darker shade of primary color */
}
    .btn-gerer {
            background-color: grey;
            border-color: grey;
            color: white;
        }
         h2 {
    color: gold;
}
h3 {
color:grey;
}
h1{
color : white;
}
  .btn-yellow {
            background-color: gold;
            border-color: gold;
            color: black;
        }
   .btn-yellow:hover {
            background-color: yellow;
            border-color: yellow;
        }
        body, h1, h2, h3, h4, h5, h6 {
            font-family: "Montserrat", sans-serif;
        }
        .w3-row-padding img {
            margin-bottom: 12px;
        }
         #main {
            margin-left: 120px;
        }
        @media only screen and (max-width: 600px) {
            #main {
                margin-left: 0;
            }
        }
        .section-content {
            display: none;
        }
    </style>
</head>
<body >
<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center">

  <img src="img/hajar 2.png" style="width:100%"> <a href="index.html"></a>
  <a href="index.html" class="w3-bar-item w3-button w3-padding-large w3-grey">
    <i class="fa fa-home w3-xxlarge"></i>
    <p>home</p>
  </a>
  <a href="http://localhost:8089/construction/ProjectServlet" class="w3-bar-item w3-button w3-padding-large w3-hover-grey">
    <i class="fa fa-user w3-xxlarge"></i>
    <p>Projets avec les tahces et les ressources </p>
  </a>
  <a href="#tache" class="w3-bar-item w3-button w3-padding-large w3-hover-grey">
    <i class="fa fa-eye w3-xxlarge"></i>
    <p>AJOUTER PROJET</p>
  </a>
  <a href="#ressource" class="w3-bar-item w3-button w3-padding-large w3-hover-grey">
    <i class="fa fa-envelope w3-xxlarge"></i>
    <p>les projets</p>
  </a>
</nav>
<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
  <div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
    <a href="index.html" class="w3-bar-item w3-button" style="width:25% !important">home</a>
    <a href="http://localhost:8089/construction/ProjectServlet" class="w3-bar-item w3-button" style="width:25% !important">Projets avec les tahces et les ressources</a>
    <a href="#photos" class="w3-bar-item w3-button" style="width:25% !important">Ajouter Projet</a>
    <a href="#contact" class="w3-bar-item w3-button" style="width:25% !important">les projets</a>
  </div>
</div>

<!-- Page Content -->
<div class="w3-padding-large" id="main">
  <!-- Header/Home -->
  <header class="w3-container w3-padding-32 w3-center w3-black" id="home">
    <h1  class="w3-jumbo"><span class="w3-hide-small">welcome ConstructionXpert</span>  Services Solution hajar</h1>
   <div class="container mt-5">
      <button class="btn btn-yellow mb-3" data-toggle="modal" data-target="#projectModal">Créer un Nouveau Projet</button>
    </div>
  </header>
   <div class="w3-padding-64 w3-content" id="tache">
   
    <div class="container">
    <div class="w3-padding-64 w3-content" id="ressource">
        <h2 class="mt-5">Liste des Projets</h2>
        <div class="row" >
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
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                </form>
            </div>
        </div>
    </div>
</div>
      <div class="modal fade" id="projectModal" tabindex="-1" aria-labelledby="projectModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="projectModalLabel">Créer un Nouveau Projet</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
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
        <button type="submit" class="btn btn-gerer" name="action" value="${project == null ? 'create' : 'update'}">
            ${project == null ? 'Créer' : 'Mettre à jour'}
        </button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  
  
  
  
    <div class="modal fade" id="projectModal" tabindex="-1" aria-labelledby="projectModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="projectModalLabel">Créer un Nouveau Projet</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
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
        <button type="submit" class="btn btn-gerer" name="action" value="${project == null ? 'create' : 'update'}">
            ${project == null ? 'Créer' : 'Mettre à jour'}
        </button>
          </form>
        </div>
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
