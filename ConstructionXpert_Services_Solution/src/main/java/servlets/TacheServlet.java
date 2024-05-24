package servlets;

import dao.TacheDAO;
import model.Tache;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/TaskServlet")
public class TacheServlet extends HttpServlet {
    private TacheDAO taskDAO;

    @Override
    public void init() throws ServletException {
        taskDAO = new TacheDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("create".equals(action)) {
            createTask(request, response);
        } else if ("update".equals(action)) {
            updateTask(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                listTasks(request, response);
                break;
            case "listall":
                listAllTasks(request, response);
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteTask(request, response);
                break;
            case "new":
                showNewForm(request, response);
                break;
            default:
                listTasks(request, response);
                break;
        }
    }

    private void listTasks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectIdStr = request.getParameter("projectId");
        if (projectIdStr == null || projectIdStr.isEmpty()) {
            throw new ServletException("Project ID is missing for list tasks.");
        }
        int projectId = Integer.parseInt(projectIdStr);
        List<Tache> taskList = taskDAO.getAllTasksByProject(projectId);
        request.setAttribute("taskList", taskList);
        request.setAttribute("projectId", projectId);
        request.getRequestDispatcher("listtache.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectIdStr = request.getParameter("projectId");
        if (projectIdStr == null || projectIdStr.isEmpty()) {
            throw new ServletException("Project ID is missing for new task form.");
        }
        int projectId = Integer.parseInt(projectIdStr);
        request.setAttribute("projectId", projectId);
        request.getRequestDispatcher("formtache.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            throw new ServletException("Task ID is missing for edit task form.");
        }
        int id = Integer.parseInt(idStr);
        Tache existingTask = taskDAO.getTaskById(id);
        request.setAttribute("task", existingTask);
        request.setAttribute("projectId", existingTask.getProjet_Id());
        request.getRequestDispatcher("formtache.jsp").forward(request, response);
    }

    private void createTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        String status = request.getParameter("status");
        String projectIdStr = request.getParameter("projectId");


        int projectId = Integer.parseInt(projectIdStr);
        Date startDate = null;
        Date endDate = null;
        try {
            if (startDateStr != null && !startDateStr.isEmpty()) {
                startDate = new SimpleDateFormat("yyyy-MM-dd").parse(startDateStr);
            }
            if (endDateStr != null && !endDateStr.isEmpty()) {
                endDate = new SimpleDateFormat("yyyy-MM-dd").parse(endDateStr);
            }
        } catch (ParseException e) {
            throw new ServletException("Invalid date format.", e);
        }

        Tache newTask = new Tache(description, startDate, endDate, status, projectId);
        taskDAO.addTask(newTask);
        response.sendRedirect("TaskServlet?action=list&projectId=" + projectId);
    }

    private void updateTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String description = request.getParameter("description");
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        String status = request.getParameter("status");
        String projectIdStr = request.getParameter("projectId");


        if (idStr == null || projectIdStr == null || idStr.isEmpty() || projectIdStr.isEmpty()) {
            throw new ServletException("ID and Project ID are required.");
        }

        int id = Integer.parseInt(idStr);
        int projectId = Integer.parseInt(projectIdStr);
        Date startDate = null;
        Date endDate = null;
        try {
            if (startDateStr != null && !startDateStr.isEmpty()) {
                startDate = new SimpleDateFormat("yyyy-MM-dd").parse(startDateStr);
            }
            if (endDateStr != null && !endDateStr.isEmpty()) {
                endDate = new SimpleDateFormat("yyyy-MM-dd").parse(endDateStr);
            }
        } catch (ParseException e) {
            throw new ServletException("Invalid date format.", e);
        }

        Tache task = new Tache(description, startDate, endDate, status, projectId);
        task.setId(id);
        taskDAO.updateTask(task);
        response.sendRedirect("TaskServlet?action=list&projectId=" + projectId);
    }

    private void deleteTask(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String idStr = request.getParameter("id");
        String projectIdStr = request.getParameter("projectId");

        if (idStr == null || idStr.isEmpty() || projectIdStr == null || projectIdStr.isEmpty()) {
            throw new ServletException("Task ID or Project ID is missing for delete task.");
        }

        int id = Integer.parseInt(idStr);
        int projectId = Integer.parseInt(projectIdStr);
        taskDAO.deleteTask(id);
        response.sendRedirect("TaskServlet?action=list&projectId=" + projectId);
    }
    private void listAllTasks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Tache> taskList = taskDAO.getAllTasks();
        request.setAttribute("taskList", taskList);
        request.getRequestDispatcher("listalltache.jsp").forward(request, response);
    }
}
