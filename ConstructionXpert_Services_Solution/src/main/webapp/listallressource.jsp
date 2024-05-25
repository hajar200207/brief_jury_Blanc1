<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Resource List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <style>
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
<div class="container">
    <h2 class="mt-5">Liste des Ressources</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Type</th>
                <th>Quantité</th>
                <th>Task ID</th>
                <th>Fournisseur</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="resource" items="${resourceList}">
                <tr>
                    <td>${resource.id}</td>
                    <td>${resource.name}</td>
                    <td>${resource.type}</td>
                    <td>${resource.quantity}</td>
                    <td>${resource.tach_id}</td>
                    <td>${resource.fournisseur}</td>
                    <td>
                        <a href="ResourceServlet?action=edit&id=${resource.id}">Modifier</a>
                        <a href="ResourceServlet?action=delete&id=${resource.id}&taskId=${resource.tach_id}" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette ressource?');">Supprimer</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="ResourceServlet?action=new&taskId=${taskId}" class="btn btn-primary">Ajouter Nouvelle Ressource</a>
</div>
</body>
</html>
