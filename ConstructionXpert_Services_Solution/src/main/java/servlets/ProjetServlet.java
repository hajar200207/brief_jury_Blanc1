package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjetDAO;
import model.Projet;

@WebServlet("/ProjectServlet")
public class ProjetServlet extends HttpServlet {
    private ProjetDAO projetDAO;

    @Override
    public void init() throws ServletException {
        try {
            projetDAO = new ProjetDAO();
        } catch (RuntimeException e) {
            throw new ServletException("Cannot initialize ProjectDAO", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("create")) {
            createProject(request, response);
        } else if (action.equals("update")) {
            updateProject(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                listProjects(request, response);
                break;
            case "listProjects":
                listallProjectstahce(request, response);
                break;
            case "listAllProjects":
                listAllProjects(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteProject(request, response);
                break;
            case "new":
                showNewForm(request, response);
                break;
            default:
                listProjects(request, response);
                break;
        }
    }

    private void listProjects(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Projet> projectList = projetDAO.getAllProjects();
        request.setAttribute("projectList", projectList);
        request.getRequestDispatcher("listprojet.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("formprojet.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Projet existingProject = projetDAO.getProjectById(id);
        request.setAttribute("project", existingProject);
        request.getRequestDispatcher("formprojet.jsp").forward(request, response);
    }

    private void createProject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        double budget = Double.parseDouble(request.getParameter("budget"));

        Date startDate = null;
        Date endDate = null;
        try {
            startDate = new SimpleDateFormat("yyyy-MM-dd").parse(startDateStr);
            endDate = new SimpleDateFormat("yyyy-MM-dd").parse(endDateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Projet newProject = new Projet(name, description, startDate, endDate, budget);
        projetDAO.addProject(newProject);
        response.sendRedirect("ProjectServlet?action=list");
    }

    private void updateProject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        double budget = Double.parseDouble(request.getParameter("budget"));

        Date startDate = null;
        Date endDate = null;
        try {
            startDate = new SimpleDateFormat("yyyy-MM-dd").parse(startDateStr);
            endDate = new SimpleDateFormat("yyyy-MM-dd").parse(endDateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Projet projet = new Projet(name, description, startDate, endDate, budget);
        projet.setId(id);
        projetDAO.updateProject(projet);
        response.sendRedirect("ProjectServlet?action=list");
    }

    private void deleteProject(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        projetDAO.deleteProjet(id);
        response.sendRedirect("ProjectServlet?action=list");
    }
    private void listAllProjects(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Projet> projectList = projetDAO.getAllProjects();
        request.setAttribute("projectList", projectList);
        request.getRequestDispatcher("listallprojets.jsp").forward(request, response);  // Assuming you have a JSP page specifically for listing all projects
    }
    private void listallProjectstahce(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Projet> projects = projetDAO.getAllProjectstache();
        request.setAttribute("projects", projects);
        request.getRequestDispatcher("listprojects.jsp").forward(request, response);
    }
}
