<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste de Toutes les Tâches</title>
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
  <a href="http://localhost:8089/construction/ProjectServlet?action=list" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-user w3-xxlarge"></i>
    <p>Liste des Projets</p>
  </a>
    <a href="http://localhost:8089/construction/TaskServlet?action=listall" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-envelope w3-xxlarge"></i>
    <p>liste des  taches</p>
  </a>
  <a href="#home"" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-eye w3-xxlarge"></i>
    <p>List des taches de projet </p>
  </a>

 
</nav>
<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
  <div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
    <a href="index.html" class="w3-bar-item w3-button" style="width:25% !important">home</a>
    <a href="http://localhost:8089/construction/ProjectServlet?action=list" class="w3-bar-item w3-button" style="width:25% !important">Liste des Projets</a>
     <a href="http://localhost:8089/construction/TaskServlet?action=listall" class="w3-bar-item w3-button" style="width:25% !important">liste des  taches </a>
    <a href="#home" class="w3-bar-item w3-button" style="width:25% !important"> List des taches de projet</a>
   
  </div>
</div>
<div class="w3-padding-large" id="main">
  <!-- Header/Home -->
  <header class="w3-container w3-padding-32 w3-center w3-black" id="home">
    <h1  class="w3-jumbo"><span class="w3-hide-small">welcome ConstructionXpert</span>  Services Solution hajar</h1>
    <div id="contact">
 <a href="#" class="btn btn-yellow mb-3" data-toggle="modal" data-target="#taskModal">Créer une Nouvelle Tâche</a>
 </div>
  </header>
<div class="container">
    <h1 class="mt-5">Liste de Toutes les Tâches</h1>
    <div class="row">
        <c:forEach var="task" items="${taskList}">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">${task.description}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">ID: ${task.id}</h6>
                        <p class="card-text">
                            <strong>Start Date:</strong> ${task.startDate}<br>
                            <strong>End Date:</strong> ${task.endDate}<br>
                            <strong>Status:</strong> ${task.status}<br>
                            <strong>Project ID:</strong> ${task.projet_Id}
                        </p>
                        <a href="TaskServlet?action=edit&id=${task.id}&projectId=${task.projet_Id}" class="btn btn-warning">Modifier</a>
                        <a href="TaskServlet?action=delete&id=${task.id}&projectId=${task.projet_Id}" class="btn btn-danger" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette tâche?');">Supprimer</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
