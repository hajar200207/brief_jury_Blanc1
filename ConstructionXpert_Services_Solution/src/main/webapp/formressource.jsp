<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Formulaire Ressource</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1 class="mt-5">${resource.id == null ? 'Créer une Nouvelle Ressource' : 'Modifier Ressource'}</h1>
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
        <a href="ResourceServlet?action=list&taskId=${taskId}" class="btn btn-secondary">Annuler</a>
    </form>
</div>
</body>
</html>
