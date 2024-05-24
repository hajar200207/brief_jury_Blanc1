package dao;

import connection.DatabaseConnection;
import model.Ressource;
import model.Tache;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TacheDAO {
    private Connection connection;

    public TacheDAO() {
        this.connection = DatabaseConnection.getConnection();
        if (this.connection == null) {
            throw new RuntimeException("Failed to connect to the database");
        }
    }

    public void addTask(Tache task) {
        try {
            String query = "INSERT INTO taches (description, start_date, end_date, status, projet_id) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, task.getDescription());
            preparedStatement.setDate(2, new java.sql.Date(task.getStartDate().getTime()));
            preparedStatement.setDate(3, new java.sql.Date(task.getEndDate().getTime()));
            preparedStatement.setString(4, task.getStatus());
            preparedStatement.setInt(5, task.getProjet_Id());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateTask(Tache task) {
        try {
            String query = "UPDATE taches SET description = ?, start_date = ?, end_date = ?, status = ? WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, task.getDescription());
            preparedStatement.setDate(2, new java.sql.Date(task.getStartDate().getTime()));
            preparedStatement.setDate(3, new java.sql.Date(task.getEndDate().getTime()));
            preparedStatement.setString(4, task.getStatus());
            preparedStatement.setInt(5, task.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteTask(int id) {
        try {
            String query = "DELETE FROM taches WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Tache getTaskById(int id) {
    	Tache task = null;
        try {
            String query = "SELECT * FROM taches WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                task = new Tache();
                task.setId(resultSet.getInt("id"));
                task.setDescription(resultSet.getString("description"));
                task.setStartDate(resultSet.getDate("start_date"));
                task.setEndDate(resultSet.getDate("end_date"));
                task.setStatus(resultSet.getString("status"));
                task.setProjet_Id(resultSet.getInt("projet_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return task;
    }

    public List<Tache> getAllTasksByProject(int projectId) {
        List<Tache> tasks = new ArrayList<>();
        try {
            String query = "SELECT * FROM taches WHERE projet_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, projectId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            	Tache task = new Tache();
                task.setId(resultSet.getInt("id"));
                task.setDescription(resultSet.getString("description"));
                task.setStartDate(resultSet.getDate("start_date"));
                task.setEndDate(resultSet.getDate("end_date"));
                task.setStatus(resultSet.getString("status"));
                task.setProjet_Id(resultSet.getInt("projet_id"));
                tasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }
    public List<Tache> getAllTasks() {
        List<Tache> tasks = new ArrayList<>();
        try {
            String query = "SELECT * FROM taches";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                Tache task = new Tache();
                task.setId(resultSet.getInt("id"));
                task.setDescription(resultSet.getString("description"));
                task.setStartDate(resultSet.getDate("start_date"));
                task.setEndDate(resultSet.getDate("end_date"));
                task.setStatus(resultSet.getString("status"));
                task.setProjet_Id(resultSet.getInt("projet_id"));
                tasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }
    public List<Ressource> getResourcesByTaskId(int taskId) {
        List<Ressource> resources = new ArrayList<>();
        try {
            String query = "SELECT * FROM  ressources WHERE tache_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, taskId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Ressource resource = new Ressource();
                resource.setId(resultSet.getInt("id"));
                resource.setName(resultSet.getString("name"));
                resource.setType(resultSet.getString("type"));
                resource.setQuantity(resultSet.getInt("quantity"));
                resource.setTach_id(resultSet.getInt("tache_id"));
                resource.setType(resultSet.getString("fournisseur"));
                resources.add(resource);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resources;
    }
    public List<Tache> getTasksByProjectId(int projectId) {
        List<Tache> tasks = new ArrayList<>();
        try {
            String query = "SELECT * FROM taches WHERE projet_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, projectId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Tache task = new Tache();
                task.setId(resultSet.getInt("id"));
                task.setDescription(resultSet.getString("description"));
                task.setStartDate(resultSet.getDate("start_date"));
                task.setEndDate(resultSet.getDate("end_date"));
                task.setStatus(resultSet.getString("status"));
                task.setProjet_Id(resultSet.getInt("projet_id"));
                task.setResources(getResourcesByTaskId(task.getId()));
                tasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }
}
