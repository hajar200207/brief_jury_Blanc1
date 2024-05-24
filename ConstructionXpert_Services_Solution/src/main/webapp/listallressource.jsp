<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Resource List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
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
