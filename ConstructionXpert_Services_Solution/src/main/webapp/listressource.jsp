<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Ressources</title>
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
    <h1 class="mt-5">Liste des Ressources</h1>
    <a href="ResourceServlet?action=new&taskId=${taskId}" class="btn btn-gerer  mb-3">Créer une Nouvelle Ressource</a>
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
                        <a href="ResourceServlet?action=edit&id=${resource.id}&taskId=${taskId}" class="btn btn-modifier">Modifier</a>
                        <a href="ResourceServlet?action=delete&id=${resource.id}&taskId=${taskId}" class="btn btn-supprimer" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette ressource?');">Supprimer</a>
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
