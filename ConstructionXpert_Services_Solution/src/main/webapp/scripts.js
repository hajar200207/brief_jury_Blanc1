document.addEventListener('DOMContentLoaded', () => {
    loadProjectsSummary();
    loadKeyStats();
    loadProjectCalendar();
    loadNotifications();
});

function loadProjectsSummary() {
    const projectsSummaryContent = document.getElementById('projects-summary-content');
    // Simulate fetching data
    projectsSummaryContent.innerHTML = '<p>5 Projets en cours</p>';
}

function loadKeyStats() {
    const keyStatsContent = document.getElementById('key-stats-content');
    // Simulate fetching data
    keyStatsContent.innerHTML = `
        <p>Tâches en Retard: 2</p>
        <p>Projets Complétés: 10</p>
    `;
}

function loadProjectCalendar() {
    const projectCalendarContent = document.getElementById('project-calendar-content');
    // Simulate fetching data
    projectCalendarContent.innerHTML = '<p>Calendrier sera ici</p>';
}

function loadNotifications() {
    const notificationsContent = document.getElementById('notifications-content');
    // Simulate fetching data
    notificationsContent.innerHTML = '<p>Aucune nouvelle notification</p>';
}
document.addEventListener('DOMContentLoaded', () => {
    loadProjects();
    document.getElementById('search').addEventListener('input', loadProjects);
    document.getElementById('filter-status').addEventListener('change', loadProjects);
});

function loadProjects() {
    const projectsList = document.getElementById('projects-list');
    const searchQuery = document.getElementById('search').value.toLowerCase();
    const statusFilter = document.getElementById('filter-status').value;

    // Simulate fetching data
    const projects = [
        { name: 'Projet A', status: 'en-cours', startDate: '2023-01-01', endDate: '2023-12-31' },
        { name: 'Projet B', status: 'completé', startDate: '2022-01-01', endDate: '2022-12-31' },
    ];

    // Filter and search
    const filteredProjects = projects.filter(project => {
        return (
            (statusFilter === '' || project.status === statusFilter) &&
            (searchQuery === '' || project.name.toLowerCase().includes(searchQuery))
        );
    });

    // Render projects
    projectsList.innerHTML = filteredProjects.map(project => `
        <div class="list-group-item">
            <h5>${project.name}</h5>
            <p>Status: ${project.status}</p>
            <p>Date de Début: ${project.startDate}</p>
            <p>Date de Fin: ${project.endDate}</p>
        </div>
    `).join('');
}

function addProject() {
    alert('Ajouter un projet (fonctionnalité à implémenter)');
}
document.addEventListener('DOMContentLoaded', () => {
    loadProjectInfo();
    loadTasks();
    loadResources();
    loadTimeline();
});

function loadProjectInfo() {
    const projectInfoContent = document.getElementById('project-info-content');
    // Simulate fetching data
    projectInfoContent.innerHTML = `
        <p>Nom: Projet A</p>
        <p>Description: Description détaillée du projet A.</p>
        <p>Statut: En cours</p>
        <p>Date de Début: 2023-01-01</p>
        <p>Date de Fin: 2023-12-31</p>
    `;
}

function loadTasks() {
    const tasksContent = document.getElementById('tasks-content');
    // Simulate fetching data
    tasksContent.innerHTML = `
        <ul>
            <li>Tâche 1: En cours</li>
            <li>Tâche 2: Complétée</li>
        </ul>
    `;
}

function loadResources() {
    const resourcesContent = document.getElementById('resources-content');
    // Simulate fetching data
    resourcesContent.innerHTML = `
        <ul>
            <li>Ressource 1: Affective</li>
            <li>Ressource 2: Disponible</li>
        </ul>
    `;
}

function loadTimeline() {
    const timelineContent = document.getElementById('timeline-content');
    // Simulate fetching data
    timelineContent.innerHTML = `
        <ul>
            <li>2023-01-01: Début du projet</li>
            <li>2023-02-01: Premier jalon atteint</li>
        </ul>
    `;
}

function addTask() {
    alert('Ajouter une tâche (fonctionnalité à implémenter)');
}

function addResource() {
    alert('Ajouter une ressource (fonctionnalité à implémenter)');
}

function editProject() {
    alert('Éditer le projet (fonctionnalité à implémenter)');
}

function deleteProject() {
    if (confirm('Êtes-vous sûr de vouloir supprimer ce projet?')) {
        alert('Projet supprimé (fonctionnalité à implémenter)');
    }
}
document.addEventListener('DOMContentLoaded', () => {
    loadTasks();
    document.getElementById('search').addEventListener('input', loadTasks);
    document.getElementById('filter-status').addEventListener('change', loadTasks);
    document.getElementById('filter-priority').addEventListener('change', loadTasks);
});

function loadTasks() {
    const tasksList = document.getElementById('tasks-list');
    const searchQuery = document.getElementById('search').value.toLowerCase();
    const statusFilter = document.getElementById('filter-status').value;
    const priorityFilter = document.getElementById('filter-priority').value;

    // Simulate fetching data
    const tasks = [
        { name: 'Tâche A', status: 'en-cours', priority: 'haute', dueDate: '2023-06-01' },
        { name: 'Tâche B', status: 'completé', priority: 'moyenne', dueDate: '2023-05-01' },
    ];

    // Filter and search
    const filteredTasks = tasks.filter(task => {
        return (
            (statusFilter === '' || task.status === statusFilter) &&
            (priorityFilter === '' || task.priority === priorityFilter) &&
            (searchQuery === '' || task.name.toLowerCase().includes(searchQuery))
        );
    });

    // Render tasks
    tasksList.innerHTML = filteredTasks.map(task => `
        <div class="list-group-item">
            <h5>${task.name}</h5>
            <p>Statut: ${task.status}</p>
            <p>Priorité: ${task.priority}</p>
            <p>Date d'Échéance: ${task.dueDate}</p>
        </div>
    `).join('');
}

function addTask() {
    alert('Ajouter une tâche (fonctionnalité à implémenter)');
}
document.addEventListener('DOMContentLoaded', () => {
    loadTaskInfo();
    loadResources();
    loadComments();
});

function loadTaskInfo() {
    const taskInfoContent = document.getElementById('task-info-content');
    // Simulate fetching data
    taskInfoContent.innerHTML = `
        <p>Nom: Tâche A</p>
        <p>Description: Description détaillée de la tâche A.</p>
        <p>Statut: En cours</p>
        <p>Priorité: Haute</p>
        <p>Date d'Échéance: 2023-06-01</p>
    `;
}

function loadResources() {
    const resourcesContent = document.getElementById('resources-content');
    // Simulate fetching data
    resourcesContent.innerHTML = `
        <ul>
            <li>Ressource 1: Affective</li>
            <li>Ressource 2: Disponible</li>
        </ul>
    `;
}

function loadComments() {
    const commentsContent = document.getElementById('comments-content');
    // Simulate fetching data
    commentsContent.innerHTML = `
        <ul>
            <li>Commentaire 1: Note sur la tâche.</li>
            <li>Commentaire 2: Autre note sur la tâche.</li>
        </ul>
    `;
}

function addComment() {
    alert('Ajouter un commentaire (fonctionnalité à implémenter)');
}

function editTask() {
    alert('Éditer la tâche (fonctionnalité à implémenter)');
}

function deleteTask() {
    if (confirm('Êtes-vous sûr de vouloir supprimer cette tâche?')) {
        alert('Tâche supprimée (fonctionnalité à implémenter)');
    }
}
document.addEventListener('DOMContentLoaded', () => {
    loadResources();
    document.getElementById('search').addEventListener('input', loadResources);
    document.getElementById('filter-role').addEventListener('change', loadResources);
    document.getElementById('filter-project').addEventListener('change', loadResources);
});

function loadResources() {
    const resourcesList = document.getElementById('resources-list');
    const searchQuery = document.getElementById('search').value.toLowerCase();
    const roleFilter = document.getElementById('filter-role').value;
    const projectFilter = document.getElementById('filter-project').value;

    // Simulate fetching data
    const resources = [
        { name: 'Jean Dupont', role: 'manager', project: 'Projet A' },
        { name: 'Marie Curie', role: 'worker', project: 'Projet B' },
    ];

    // Filter and search
    const filteredResources = resources.filter(resource => {
        return (
            (roleFilter === '' || resource.role === roleFilter) &&
            (projectFilter === '' || resource.project === projectFilter) &&
            (searchQuery === '' || resource.name.toLowerCase().includes(searchQuery))
        );
    });

    // Render resources
    resourcesList.innerHTML = filteredResources.map(resource => `
        <div class="list-group-item">
            <h5>${resource.name}</h5>
            <p>Rôle: ${resource.role}</p>
            <p>Projet Assigné: ${resource.project}</p>
        </div>
    `).join('');
}

function addResource() {
    alert('Ajouter une ressource (fonctionnalité à implémenter)');
}
document.addEventListener('DOMContentLoaded', () => {
    loadResourceInfo();
    loadAssignedProjects();
    loadTaskHistory();
});

function loadResourceInfo() {
    const resourceInfoContent = document.getElementById('resource-info-content');
    // Simulate fetching data
    resourceInfoContent.innerHTML = `
        <p>Nom: Jean Dupont</p>
        <p>Contact: jeandupont@example.com</p>
        <p>Rôle: Manager</p>
    `;
}

function loadAssignedProjects() {
    const projectsContent = document.getElementById('projects-content');
    // Simulate fetching data
    projectsContent.innerHTML = `
        <ul>
            <li>Projet A</li>
            <li>Projet B</li>
        </ul>
    `;
}

function loadTaskHistory() {
    const taskHistoryContent = document.getElementById('task-history-content');
    // Simulate fetching data
    taskHistoryContent.innerHTML = `
        <ul>
            <li>Tâche 1: Complétée</li>
            <li>Tâche 2: En cours</li>
        </ul>
    `;
}

function editResource() {
    alert('Éditer la ressource (fonctionnalité à implémenter)');
}

function deleteResource() {
    if (confirm('Êtes-vous sûr de vouloir supprimer cette ressource?')) {
        alert('Ressource supprimée (fonctionnalité à implémenter)');
    }
}
document.addEventListener('DOMContentLoaded', () => {
    loadUsers();
    document.getElementById('search').addEventListener('input', loadUsers);
    document.getElementById('filter-role').addEventListener('change', loadUsers);
});

function loadUsers() {
    const usersList = document.getElementById('users-list');
    const searchQuery = document.getElementById('search').value.toLowerCase();
    const roleFilter = document.getElementById('filter-role').value;

    // Simulate fetching data
    const users = [
        { name: 'Alice Martin', email: 'alice@example.com', role: 'admin' },
        { name: 'Bob Dupont', email: 'bob@example.com', role: 'user' },
    ];

    // Filter and search
    const filteredUsers = users.filter(user => {
        return (
            (roleFilter === '' || user.role === roleFilter) &&
            (searchQuery === '' || user.name.toLowerCase().includes(searchQuery))
        );
    });

    // Render users
    usersList.innerHTML = filteredUsers.map(user => `
        <div class="list-group-item">
            <h5>${user.name}</h5>
            <p>Email: ${user.email}</p>
            <p>Rôle: ${user.role}</p>
        </div>
    `).join('');
}

function addUser() {
    alert('Ajouter un utilisateur (fonctionnalité à implémenter)');
}
document.addEventListener('DOMContentLoaded', () => {
    loadUserInfo();
    loadAssignedProjects();
    loadCurrentTasks();
});

function loadUserInfo() {
    const userInfoContent = document.getElementById('user-info-content');
    // Simulate fetching data
    userInfoContent.innerHTML = `
        <p>Nom: Alice Martin</p>
        <p>Email: alice@example.com</p>
        <p>Rôle: Admin</p>
    `;
}

function loadAssignedProjects() {
    const projectsContent = document.getElementById('projects-content');
    // Simulate fetching data
    projectsContent.innerHTML = `
        <ul>
            <li>Projet A</li>
            <li>Projet B</li>
        </ul>
    `;
}

function loadCurrentTasks() {
    const currentTasksContent = document.getElementById('current-tasks-content');
    // Simulate fetching data
    currentTasksContent.innerHTML = `
        <ul>
            <li>Tâche 1: En cours</li>
            <li>Tâche 2: À faire</li>
        </ul>
    `;
}

function editUser() {
    alert('Éditer le profil (fonctionnalité à implémenter)');
}

function deleteUser() {
    if (confirm('Êtes-vous sûr de vouloir supprimer ce profil utilisateur?')) {
        alert('Profil utilisateur supprimé (fonctionnalité à implémenter)');
    }
}
