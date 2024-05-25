<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Tâches</title>
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
    </style>
</head>
<body>
<div class="container">
    <h1 class="mt-5">Liste des Tâches</h1>
    <a href="#" class="btn btn-gerer mb-3" data-toggle="modal" data-target="#taskModal">Créer une Nouvelle Tâche</a>
   
    <div class="board">
        <div class="board-column" id="a-faire" ondrop="drop(event)" ondragover="allowDrop(event)">
            <h2>À faire</h2>
            <c:forEach var="task" items="${taskList}">
                <c:if test="${task.status eq 'a faire'}">
                    <div class="card card-custom" draggable="true" ondragstart="drag(event)" id="task_${task.id}">
                        <div class="card-body">
                            <h5 class="card-title">${task.description}</h5>
                            <h6 class="card-subtitle mb-2 text-muted">ID: ${task.id}</h6>
                            <p class="card-text">
                                <strong>Date de Début:</strong> ${task.startDate}<br>
                                <strong>Date de Fin:</strong> ${task.endDate}<br>
                                <strong>Statut:</strong> ${task.status}
                            </p>
                             <div class="d-flex flex-column">
                                <button class="btn btn-warning btn-modifier" 
                                        data-toggle="modal" 
                                        data-target="#editProjectModal" 
                                        onclick="openUpdateModal(${task.id}, '${task.description}', '${task.startDate}', '${task.endDate}', '${task.status}')">Modifier</button>

                                <a href="TaskServlet?action=delete&id=${task.id}&projectId=${projectId}" class="btn btn-supprimer">Supprimer</a>
                                <a href="ResourceServlet?action=list&taskId=${task.id}" class="btn btn-gerer">Gérer les Ressources</a>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
        <div class="board-column" id="en-cours" ondrop="drop(event)" ondragover="allowDrop(event)">
            <h2>En cours</h2>
            <c:forEach var="task" items="${taskList}">
                <c:if test="${task.status eq 'En cours'}">
                    <div class="card card-custom" draggable="true" ondragstart="drag(event)" id="task_${task.id}">
                        <div class="card-body">
                            <h5 class="card-title">${task.description}</h5>
                            <h6 class="card-subtitle mb-2 text-muted">ID: ${task.id}</h6>
                            <p class="card-text">
                                <strong>Date de Début:</strong> ${task.startDate}<br>
                                <strong>Date de Fin:</strong> ${task.endDate}<br>
                                <strong>Statut:</strong> ${task.status}
                            </p>
                            <div class="d-flex flex-column">
                                <button class="btn btn-warning btn-modifier" 
                                        data-toggle="modal" 
                                        data-target="#editProjectModal" 
                                        onclick="openUpdateModal(${task.id}, '${task.description}', '${task.startDate}', '${task.endDate}', '${task.status}')">Modifier</button>

                                <a href="TaskServlet?action=delete&id=${task.id}&projectId=${projectId}" class="btn btn-supprimer">Supprimer</a>
                                <a href="ResourceServlet?action=list&taskId=${task.id}" class="btn btn-gerer">Gérer les Ressources</a>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
        <div class="board-column" id="termine" ondrop="drop(event)" ondragover="allowDrop(event)">
            <h2>Terminé</h2>
            <c:forEach var="task" items="${taskList}">
                <c:if test="${task.status eq 'Termine'}">
                    <div class="card card-custom" draggable="true" ondragstart="drag(event)" id="task_${task.id}">
                        <div class="card-body">
                            <h5 class="card-title">${task.description}</h5>
                            <h6 class="card-subtitle mb-2 text-muted">ID: ${task.id}</h6>
                            <p class="card-text">
                                <strong>Date de Début:</strong> ${task.startDate}<br>
                                <strong>Date de Fin:</strong> ${task.endDate}<br>
                                <strong>Statut:</strong> ${task.status}
                            </p>
                             <div class="d-flex flex-column">
                                <button class="btn btn-warning btn-modifier" 
                                        data-toggle="modal" 
                                        data-target="#editProjectModal" 
                                        onclick="openUpdateModal(${task.id}, '${task.description}', '${task.startDate}', '${task.endDate}', '${task.status}')">Modifier</button>

                                <a href="TaskServlet?action=delete&id=${task.id}&projectId=${projectId}" class="btn btn-supprimer">Supprimer</a>
                                <a href="ResourceServlet?action=list&taskId=${task.id}" class="btn btn-gerer">Gérer les Ressources</a>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>

<div class="modal fade" id="taskModal" tabindex="-1" aria-labelledby="taskModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="taskModalLabel">${task != null ? 'Modifier la Tâche' : 'Créer une Nouvelle Tâche'}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="TaskServlet" method="post">
                    <input type="hidden" name="action" value="${task != null ? 'update' : 'create'}">
                    <input type="hidden" name="id" value="${task != null ? task.id : ''}">
                    <input type="hidden" name="projectId" value="${projectId}">

                    <div class="form-group">
                        <label for="description">Description</label>
                        <input type="text" class="form-control" id="description" name="description" value="${task != null ? task.description : ''}">
                    </div>
                    <div class="form-group">
                        <label for="startDate">Date de Début</label>
                        <input type="date" class="form-control" id="startDate" name="startDate" value="${task != null ? task.startDate : ''}">
                    </div>
                    <div class="form-group">
                        <label for="endDate">Date de Fin</label>
                        <input type="date" class="form-control" id="endDate" name="endDate" value="${task != null ? task.endDate : ''}">
                    </div>
                    <div class="form-group">
                        <label for="status">Statut</label>
                        <select class="form-control" id="status" name="status">
                            <option value="Termine" ${task != null && task.status == 'Terminé' ? 'selected' : ''}>Terminé</option>
                            <option value="a faire" ${task != null && task.status == 'À faire' ? 'selected' : ''}>À faire</option>
                            <option value="En cours" ${task != null && task.status == 'En cours' ? 'selected' : ''}>En cours</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">${task != null ? 'Mettre à Jour' : 'Créer'}</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal for editing projects -->
<div class="modal fade" id="editProjectModal" tabindex="-1" role="dialog" aria-labelledby="editProjectModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editProjectModalLabel">Modifier la Tâche</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="updateTaskForm" method="post" action="TaskServlet">
                    <input type="hidden" id="updateTaskId" name="id">
                    <input type="hidden" id="updateTaskAction" name="action" value="update">
                    <input type="hidden" id="updateTaskProjectId" name="projectId" value="${projectId}">
                    <div class="form-group">
                        <label for="updateTaskDescription">Description</label>
                        <input type="text" class="form-control" id="updateTaskDescription" name="description" required>
                    </div>
                    <div class="form-group">
                        <label for="updateTaskStartDate">Date de Début</label>
                        <input type="date" class="form-control" id="updateTaskStartDate" name="startDate" required>
                    </div>
                    <div class="form-group">
                        <label for="updateTaskEndDate">Date de Fin</label>
                        <input type="date" class="form-control" id="updateTaskEndDate" name="endDate" required>
                    </div>
                    <div class="form-group">
                        <label for="updateTaskStatus">Statut</label>
                        <select class="form-control" id="updateTaskStatus" name="status" required>
                            <option value="Termine">Terminé</option>
                            <option value="a faire">À faire</option>
                            <option value="En cours">En cours</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Mettre à Jour</button>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
function allowDrop(event) {
    event.preventDefault();
}

function drag(event) {
    event.dataTransfer.setData("text", event.target.id);
}

function drop(event) {
    event.preventDefault();
    var data = event.dataTransfer.getData("text");
    var targetColumnId = event.target.closest('.board-column').id;
    var taskId = data.split('_')[1];
    
    // Change status based on the target column
    switch (targetColumnId) {
        case 'a-faire':
            document.getElementById(data).querySelector('.card-text strong:nth-child(3)').textContent = 'Statut: a faire';
            break;
        case 'en-cours':
            document.getElementById(data).querySelector('.card-text strong:nth-child(3)').textContent = 'Statut: En cours';
            break;
        case 'termine':
            document.getElementById(data).querySelector('.card-text strong:nth-child(3)').textContent = 'Statut: Termine';
            break;
        default:
            break;
    }
    
    event.target.appendChild(document.getElementById(data));
    
}

document.addEventListener('DOMContentLoaded', function() {
    const cards = document.querySelectorAll('.card-custom');
    cards.forEach(card => {
        card.addEventListener('click', function() {
            card.classList.toggle('card-expanded');
        });
    });
});
function openUpdateModal(taskId, description, startDate, endDate, status) {
    // Set the form action URL with the task ID
    document.getElementById('updateTaskForm').action = "TaskServlet?action=update&id=" + taskId;

    // Set the form fields with the current task data
    document.getElementById('updateTaskId').value = taskId;
    document.getElementById('updateTaskDescription').value = description;
    document.getElementById('updateTaskStartDate').value = startDate;
    document.getElementById('updateTaskEndDate').value = endDate;
    document.getElementById('updateTaskStatus').value = status;

    // Show the modal
    $('#editProjectModal').modal('show');
}
</script>
</body>
</html>
