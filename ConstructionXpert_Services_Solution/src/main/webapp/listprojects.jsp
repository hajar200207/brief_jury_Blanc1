<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des projets</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
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

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>


