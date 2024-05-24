package servlets;

import dao.RessourceDAO;
import model.Ressource;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ResourceServlet")
public class RessourceServlet extends HttpServlet {
    private RessourceDAO resourceDAO;

    @Override
    public void init() throws ServletException {
        resourceDAO = new RessourceDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("create".equals(action)) {
            createResource(request, response);
        } else if ("update".equals(action)) {
            updateResource(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "listressource";
        }

        switch (action) {
            case "listressource":
                listAllResources(request, response);
                break;
            case "list":
                listResources(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteResource(request, response);
                break;
            case "new":
                showNewForm(request, response);
                break;
            default:
                listResources(request, response);
                break;
        }
    }

    private void listResources(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taskIdStr = request.getParameter("taskId");
        if (taskIdStr == null || taskIdStr.isEmpty()) {
            throw new ServletException("Task ID is missing for list resources.");
        }
        int taskId = Integer.parseInt(taskIdStr);
        List<Ressource> resourceList = resourceDAO.getAllResourcesByTask(taskId);
        request.setAttribute("resourceList", resourceList);
        request.setAttribute("taskId", taskId);
        request.getRequestDispatcher("listressource.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taskIdStr = request.getParameter("taskId");
        if (taskIdStr == null || taskIdStr.isEmpty()) {
            throw new ServletException("Task ID is missing for new resource form.");
        }
        int taskId = Integer.parseInt(taskIdStr);
        request.setAttribute("taskId", taskId);
        request.getRequestDispatcher("formressource.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            throw new ServletException("Resource ID is missing for edit resource form.");
        }
        int id = Integer.parseInt(idStr);
        Ressource existingResource = resourceDAO.getResourceById(id);
        request.setAttribute("resource", existingResource);
        request.setAttribute("taskId", existingResource.getTach_id());
        request.getRequestDispatcher("formressource.jsp").forward(request, response);
    }

    private void createResource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String quantityStr = request.getParameter("quantity");
        String taskIdStr = request.getParameter("taskId");
        String fournisseur = request.getParameter("fournisseur"); // New field

        if (taskIdStr == null || taskIdStr.isEmpty()) {
            throw new ServletException("Task ID is required.");
        }

        int taskId = Integer.parseInt(taskIdStr);
        int quantity = Integer.parseInt(quantityStr);

        Ressource newResource = new Ressource();
        newResource.setName(name);
        newResource.setType(type);
        newResource.setQuantity(quantity);
        newResource.setTach_id(taskId);
        newResource.setFournisseur(fournisseur); // Set fournisseur

        resourceDAO.addResource(newResource);
        response.sendRedirect("ResourceServlet?action=list&taskId=" + taskId);
    }

    private void updateResource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String quantityStr = request.getParameter("quantity");
        String taskIdStr = request.getParameter("taskId");
        String fournisseur = request.getParameter("fournisseur"); // New field

        if (idStr == null || taskIdStr == null || idStr.isEmpty() || taskIdStr.isEmpty()) {
            throw new ServletException("ID and Task ID are required.");
        }

        int id = Integer.parseInt(idStr);
        int taskId = Integer.parseInt(taskIdStr);
        int quantity = Integer.parseInt(quantityStr);

        Ressource resource = new Ressource();
        resource.setId(id);
        resource.setName(name);
        resource.setType(type);
        resource.setQuantity(quantity);
        resource.setTach_id(taskId);
        resource.setFournisseur(fournisseur); // Set fournisseur

        resourceDAO.updateResource(resource);
        response.sendRedirect("ResourceServlet?action=list&taskId=" + taskId);
    }

    private void deleteResource(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String idStr = request.getParameter("id");
        String taskIdStr = request.getParameter("taskId");

        if (idStr == null || idStr.isEmpty() || taskIdStr == null || taskIdStr.isEmpty()) {
            throw new ServletException("Resource ID or Task ID is missing for delete resource.");
        }

        int id = Integer.parseInt(idStr);
        int taskId = Integer.parseInt(taskIdStr);
        resourceDAO.deleteResource(id);
        response.sendRedirect("ResourceServlet?action=list&taskId=" + taskId);
    }

    private void listAllResources(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Ressource> resourceList = resourceDAO.getAllResources();
        request.setAttribute("resourceList", resourceList);
        request.getRequestDispatcher("listallressource.jsp").forward(request, response);
    }
}
