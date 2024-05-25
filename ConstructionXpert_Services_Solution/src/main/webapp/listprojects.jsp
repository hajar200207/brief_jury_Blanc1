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
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
         .modal-content {
        background-color: gold;
    }
    .btn-primary {
        background-color: black;
        border-color: black;
    }
    .btn-primary:hover {
        background-color: #333;
        border-color: #333;
    }
    .close {
        color: grey;
        opacity: 1;
    }
    .close:hover {
        color: #555;
    }
        body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
.w3-row-padding img {margin-bottom: 12px}

.w3-sidebar {width: 120px;background: #222;}

#main {margin-left: 120px}
/* Remove margins from "page content" on small screens */
@media only screen and (max-width: 600px) {#main {margin-left: 0}}
 th,
    td {
        background-color: white;
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
        .btn-yellow {
            background-color: yellow;
            border-color: yellow;
            color: black;
        }
        .btn-yellow:hover {
            background-color: gold;
            border-color: gold;
        }
        body, h1, h2, h3, h4, h5, h6 {
            font-family: "Montserrat", sans-serif;
        }
        .w3-row-padding img {
            margin-bottom: 12px;
        }
        .w3-sidebar {
            width: 120px;
            background: #222;
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
            background-color: gold;
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
        

    </style>
</head>
<body class="w3-black">
<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center">

  <img src="img/hajar 2.png" style="width:100%"> <a href="index.html"></a>
  <a href="index.html" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-home w3-xxlarge"></i>
    <p>home</p>
  </a>
  <a href="#about" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-user w3-xxlarge"></i>
    <p>Liste des Projets</p>
  </a>
  <a href="#tache" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-eye w3-xxlarge"></i>
    <p>les taches</p>
  </a>
  <a href="#ressource" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-envelope w3-xxlarge"></i>
    <p>les ressources</p>
  </a>
</nav>
<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
  <div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
    <a href="index.html" class="w3-bar-item w3-button" style="width:25% !important">home</a>
    <a href="#about" class="w3-bar-item w3-button" style="width:25% !important">Liste des Projets</a>
    <a href="#photos" class="w3-bar-item w3-button" style="width:25% !important">PHOTOS</a>
    <a href="#contact" class="w3-bar-item w3-button" style="width:25% !important">CONTACT</a>
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
<div class="w3-content w3-justify w3-text-grey w3-padding-64" id="about">
<div class="container">
        <h1 class="mt-5">Liste des projets avec tâches et ressources</h1>
        <c:forEach var="project" items="${projects}">
            <div class="mt-4">
                <h2>${project.name}</h2>
                <h3>Tâches :</h3>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Description</th>
                            <th>Date de début</th>
                            <th>Date de fin</th>
                            <th>Statut</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty project.taches}">
                                <tr>
                                    <td colspan="4">Aucune tâche disponible</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="task" items="${project.taches}">
                                    <tr>
                                        <td>${task.description}</td>
                                        <td>${task.startDate}</td>
                                        <td>${task.endDate}</td>
                                        <td>${task.status}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>

                <h3>Ressources :</h3>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Nom</th>
                            <th>Type</th>
                            <th>Quantité</th>
                            <th>Fournisseur</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty project.taches}">
                                <tr>
                                    <td colspan="4">Aucune ressource disponible</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="task" items="${project.taches}">
                                    <c:choose>
                                        <c:when test="${empty task.resources}">
                                            <tr>
                                                <td colspan="4">Aucune ressource disponible pour cette tâche</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="resource" items="${task.resources}">
                                                <tr>
                                                    <td>${resource.name}</td>
                                                    <td>${resource.type}</td>
                                                    <td>${resource.quantity}</td>
                                                    <td>${resource.fournisseur}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </c:forEach>
    </div>

  </div>
  
  
  <!-- Portfolio Section -->
  <div class="w3-padding-64 w3-content" id="tache">
    <div class="container">
            <h2>Tâches</h2>
            <c:forEach var="project" items="${projects}">
                <h3>${project.name}</h3>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Description</th>
                            <th>Date de début</th>
                            <th>Date de fin</th>
                            <th>Statut</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty project.taches}">
                                <tr>
                                    <td colspan="4">Aucune tâche disponible</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="task" items="${project.taches}">
                                    <tr>
                                        <td>${task.description}</td>
                                        <td>${task.startDate}</td>
                                        <td>${task.endDate}</td>
                                        <td>${task.status}</td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </c:forEach>
        </div>
    </div>
  


  <!-- Contact Section -->
  <div class="w3-padding-64 w3-content " id="ressource">
    <div class="container">
        <h2>Ressources</h2>
        <c:forEach var="project" items="${projects}">
            <h3>${project.name}</h3>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Type</th>
                        <th>Quantité</th>
                        <th>Fournisseur</th>
                    </tr>
                </thead>
                <tbody>
                     <c:choose>
                            <c:when test="${empty project.taches}">
                                <tr>
                                    <td colspan="4">Aucune ressource disponible</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="task" items="${project.taches}">
                                    <c:choose>
                                        <c:when test="${empty task.resources}">
                                            <tr>
                                                <td colspan="4">Aucune ressource disponible pour cette tâche</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="resource" items="${task.resources}">
                                                <tr>
                                                    <td>${resource.name}</td>
                                                    <td>${resource.type}</td>
                                                    <td>${resource.quantity}</td>
                                                    <td>${resource.fournisseur}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                </tbody>
            </table>
        </c:forEach>
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