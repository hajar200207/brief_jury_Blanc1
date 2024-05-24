<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Statistiques des projets et des tâches</title>
    <!-- Inclure Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <h1>Statistiques des projets et des tâches</h1>
    <canvas id="projectsChart" width="400" height="200"></canvas>
    <canvas id="tasksChart" width="400" height="200"></canvas>

    <script>
        // Récupérer les données des projets et des tâches depuis votre servlet ou votre contrôleur Java
        var projectsData = [
            { name: "Projet 1", completedTasks: 5, inProgressTasks: 3, todoTasks: 2 },
            { name: "Projet 2", completedTasks: 8, inProgressTasks: 2, todoTasks: 1 },
        ];

        // Préparer les données pour le graphique des projets
        var projectsLabels = projectsData.map(project => project.name);
        var projectsCompletedTasks = projectsData.map(project => project.completedTasks);
        var projectsInProgressTasks = projectsData.map(project => project.inProgressTasks);
        var projectsTodoTasks = projectsData.map(project => project.todoTasks);

        // Créer le graphique des projets
        var projectsChartCtx = document.getElementById('projectsChart').getContext('2d');
        var projectsChart = new Chart(projectsChartCtx, {
            type: 'bar',
            data: {
                labels: projectsLabels,
                datasets: [
                    {
                        label: 'Tâches terminées',
                        data: projectsCompletedTasks,
                        backgroundColor: 'green'
                    },
                    {
                        label: 'Tâches en cours',
                        data: projectsInProgressTasks,
                        backgroundColor: 'yellow'
                    },
                    {
                        label: 'Tâches à faire',
                        data: projectsTodoTasks,
                        backgroundColor: 'red'
                    }
                ]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });

        // Ajouter d'autres graphiques pour les tâches si nécessaire
    </script>
</body>
</html>
