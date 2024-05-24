
package dao;



import connection.DatabaseConnection;
import model.Projet;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjetDAO {
    private Connection connection;
    private TacheDAO tacheDAO;

    public ProjetDAO() {
    	 this.tacheDAO = new TacheDAO();
        this.connection = DatabaseConnection.getConnection();
        if (this.connection == null) {
            throw new RuntimeException("Failed to connect to the database");
        }
    }

    public void addProject(Projet project) {
        try {
            String query = "INSERT INTO projets (name, description, start_date, end_date, budget) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, project.getName());
            preparedStatement.setString(2, project.getDescription());
            preparedStatement.setDate(3, new java.sql.Date(project.getStartDate().getTime()));
            preparedStatement.setDate(4, new java.sql.Date(project.getEndDate().getTime()));
            preparedStatement.setDouble(5, project.getBudget());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Projet> getAllProjects() {
        List<Projet> projets = new ArrayList<>();
        try {
            String query = "SELECT * FROM projets";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                Projet projet = new Projet();
                projet.setId(resultSet.getInt("id"));
                projet.setName(resultSet.getString("name"));
                projet.setDescription(resultSet.getString("description"));
                projet.setStartDate(resultSet.getDate("start_date"));
                projet.setEndDate(resultSet.getDate("end_date"));
                projet.setBudget(resultSet.getDouble("budget"));
                projets.add(projet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projets;
    }

    public List<Projet> getAllProjectstache() {
        List<Projet> projects = new ArrayList<>();
        try {
            String query = "SELECT * FROM projets";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                Projet project = new Projet();
                project.setId(resultSet.getInt("id"));
                project.setName(resultSet.getString("name"));
                project.setDescription(resultSet.getString("description"));
                project.setTaches(tacheDAO.getTasksByProjectId(project.getId()));
                projects.add(project);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projects;
    }
    public Projet getProjectById(int id) {
        Projet projet = new Projet();
        try {
            String query = "SELECT * FROM projets WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                projet.setId(resultSet.getInt("id"));
                projet.setName(resultSet.getString("name"));
                projet.setDescription(resultSet.getString("description"));
                projet.setStartDate(resultSet.getDate("start_date"));
                projet.setEndDate(resultSet.getDate("end_date"));
                projet.setBudget(resultSet.getDouble("budget"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projet;
    }

    public void updateProject(Projet projet) {
        try {
            String query = "UPDATE projets SET name = ?, description = ?, start_date = ?, end_date = ?, budget = ? WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, projet.getName());
            preparedStatement.setString(2, projet.getDescription());
            preparedStatement.setDate(3, new java.sql.Date(projet.getStartDate().getTime()));
            preparedStatement.setDate(4, new java.sql.Date(projet.getEndDate().getTime()));
            preparedStatement.setDouble(5, projet.getBudget());
            preparedStatement.setInt(6, projet.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProjet(int id) {
        try {

            String deleteTasksQuery = "DELETE FROM taches WHERE projet_id = ?";
            PreparedStatement deleteTasksStmt = connection.prepareStatement(deleteTasksQuery);
            deleteTasksStmt.setInt(1, id);
            deleteTasksStmt.executeUpdate();

            String query = "DELETE FROM projets WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
