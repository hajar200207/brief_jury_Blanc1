<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Ressources</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <style>
    .modal-content {
        background-color: grey;
    }
    .btn-primary {
        background-color: gold;
        border-color: gold;
    }
    .btn-primary:hover {
        background-color: black;
        border-color: black;
    }
    .close {
        color: black;
        opacity: 1;
    }
    .close:hover {
        color: #555;
    }
        .board {
            display: flex;
            overflow-x: auto;
            padding: 20px 0;
        }
        .board-column {
            flex: 0 0 300px;
            margin-right: 20px;
        }
        .board-column:last-child {
            margin-right: 0;
        }
        .card-custom {
            border: 2px solid yellow; 
            border-radius: 15px; 
            margin-bottom: 15px;
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
        body {
    
    background-color: grey;
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
    </style>
</head>
<body>
<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center">
  <img src="img/hajar 2.png" style="width:100%"> <a href="index.html"></a>
  <a href="index.html" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-home w3-xxlarge"></i>
    <p>home</p>
  </a>
  <a href="http://localhost:8089/construction/ProjectServlet?action=list"" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-user w3-xxlarge"></i>
    <p>Liste des projets</p>
  </a>
  <a href="http://localhost:8089/construction/ResourceServlet" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-eye w3-xxlarge"></i>
    <p>liste des all ressources </p>
  </a>
  <a href="#contact" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-envelope w3-xxlarge"></i>
    <p>liste des ressources d'un tache </p>
  </a>
 
</nav>
<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
  <div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
    <a href="index.html" class="w3-bar-item w3-button" style="width:25% !important">home</a>
    <a href="http://localhost:8089/construction/ProjectServlet?action=list" class="w3-bar-item w3-button" style="width:25% !important">Liste des Projets</a>
    <a href="http://localhost:8089/construction/ProjectServlet?action=list" class="w3-bar-item w3-button" style="width:25% !important">liste des Taches</a>
    <a href="#contact" class="w3-bar-item w3-button" style="width:25% !important">liste des ressources d'un tache </a>
  </div>
</div>
<div class="w3-padding-large" id="main">
  <!-- Header/Home -->
  <header class="w3-container w3-padding-32 w3-center w3-black" id="home">
    <h1  class="w3-jumbo"><span class="w3-hide-small">welcome ConstructionXpert</span>  Services Solution hajar</h1>
     <div id="contact">
    <a href="#" class="btn btn-gerer mb-3" data-toggle="modal" data-target="#resourceModal">Créer une Nouvelle Ressource</a>
    </div>
  </header>
<body>
<div class="container">
    <h1 class="mt-5">Liste des Ressources</h1>
    <div class="row">
        <c:forEach var="resource" items="${resourceList}">
            <div class="col-md-4 mb-4">
                <div class="card card-custom">
                    <div class="card-body">
                        <h5 class="card-title">${resource.name}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">ID: ${resource.id}</h6>
                        <p class="card-text">
                            <strong>Type:</strong> ${resource.type}<br>
                            <strong>Quantité:</strong> ${resource.quantity}<br>
                            <strong>Fournisseur:</strong> ${resource.fournisseur}
                        </p>
                        <div  class="d-flex flex-column">
                        <button class="btn btn-warning btn-modifier" 
        data-toggle="modal" 
        data-target="#editResourceModal" 
        onclick="openUpdateResourceModal(${resource.id}, '${resource.name}', '${resource.type}', ${resource.quantity}, '${resource.fournisseur}')">Modifier</button>
                        
                        <a href="ResourceServlet?action=delete&id=${resource.id}&taskId=${taskId}" class="btn btn-supprimer" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette ressource?');">Supprimer</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    
</div>
<!-- Resource Modal -->
<div class="modal fade" id="resourceModal" tabindex="-1" aria-labelledby="resourceModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="resourceModalLabel">${resource.id == null ? 'Créer une Nouvelle Ressource' : 'Modifier Ressource'}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="ResourceServlet" method="post">
                    <input type="hidden" name="id" value="${resource.id}">
                    <input type="hidden" name="taskId" value="${taskId}">
                    <div class="form-group">
                        <label for="name">Nom</label>
                        <input type="text" class="form-control" id="name" name="name" value="${resource.name}" required>
                    </div>
                    <div class="form-group">
                        <label for="type">Type</label>
                        <input type="text" class="form-control" id="type" name="type" value="${resource.type}">
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantité</label>
                        <input type="number" class="form-control" id="quantity" name="quantity" value="${resource.quantity}" required>
                    </div>
                    <div class="form-group">
                        <label for="fournisseur">Fournisseur</label>
                        <input type="text" class="form-control" id="fournisseur" name="fournisseur" value="${resource.fournisseur}">
                    </div>
                    <button type="submit" class="btn btn-primary" name="action" value="${resource.id == null ? 'create' : 'update'}">
                        ${resource.id == null ? 'Créer' : 'Mettre à Jour'}
                    </button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Resource Modal -->
<<!-- Modal for editing resources -->
<div class="modal fade" id="editResourceModal" tabindex="-1" role="dialog" aria-labelledby="editResourceModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editResourceModalLabel">Modifier la Ressource</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="updateResourceForm" method="post" action="ResourceServlet">
                    <input type="hidden" id="updateResourceId" name="id">
                    <input type="hidden" id="updateResourceAction" name="action" value="update">
                    <input type="hidden" id="updateResourceTaskId" name="taskId" value="${taskId}">
                    <div class="form-group">
                        <label for="updateResourceName">Nom</label>
                        <input type="text" class="form-control" id="updateResourceName" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="updateResourceType">Type</label>
                        <input type="text" class="form-control" id="updateResourceType" name="type">
                    </div>
                    <div class="form-group">
                        <label for="updateResourceQuantity">Quantité</label>
                        <input type="number" class="form-control" id="updateResourceQuantity" name="quantity" required>
                    </div>
                    <div class="form-group">
                        <label for="updateResourceFournisseur">Fournisseur</label>
                        <input type="text" class="form-control" id="updateResourceFournisseur" name="fournisseur">
                    </div>
                    <button type="submit" class="btn btn-primary">Mettre à Jour</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
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
    function openUpdateResourceModal(id, name, type, quantity, fournisseur) {
        // Set the form action URL with the resource ID
        document.getElementById('updateResourceId').value = id;
        document.getElementById('updateResourceName').value = name;
        document.getElementById('updateResourceType').value = type;
        document.getElementById('updateResourceQuantity').value = quantity;
        document.getElementById('updateResourceFournisseur').value = fournisseur;

        // Show the modal
        $('#editResourceModal').modal('show');
    }
    
</script>
</body>
</html>
