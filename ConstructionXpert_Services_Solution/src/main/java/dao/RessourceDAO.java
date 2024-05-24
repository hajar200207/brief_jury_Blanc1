package dao;

import connection.DatabaseConnection;
import model.Ressource;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RessourceDAO {
    private Connection connection;

    public RessourceDAO() {
        this.connection = DatabaseConnection.getConnection();
        if (this.connection == null) {
            throw new RuntimeException("Failed to connect to the database");
        }
    }

    public void addResource(Ressource resource) {
        try {
            String query = "INSERT INTO ressources (name, type, quantity, tache_id, fournisseur) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, resource.getName());
            preparedStatement.setString(2, resource.getType());
            preparedStatement.setInt(3, resource.getQuantity());
            preparedStatement.setInt(4, resource.getTach_id());
            preparedStatement.setString(5, resource.getFournisseur());  // Set fournisseur
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateResource(Ressource resource) {
        try {
            String query = "UPDATE ressources SET name = ?, type = ?, quantity = ?, tache_id = ?, fournisseur = ? WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, resource.getName());
            preparedStatement.setString(2, resource.getType());
            preparedStatement.setInt(3, resource.getQuantity());
            preparedStatement.setInt(4, resource.getTach_id());
            preparedStatement.setString(5, resource.getFournisseur());  // Update fournisseur
            preparedStatement.setInt(6, resource.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteResource(int id) {
        try {
            String query = "DELETE FROM ressources WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Ressource getResourceById(int id) {
        Ressource resource = null;
        try {
            String query = "SELECT * FROM ressources WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                resource = new Ressource();
                resource.setId(resultSet.getInt("id"));
                resource.setName(resultSet.getString("name"));
                resource.setType(resultSet.getString("type"));
                resource.setQuantity(resultSet.getInt("quantity"));
                resource.setTach_id(resultSet.getInt("tache_id"));
                resource.setFournisseur(resultSet.getString("fournisseur"));  // Retrieve fournisseur
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resource;
    }
    
    public List<Ressource> getAllResourcesByTask(int taskId) {
        List<Ressource> resources = new ArrayList<>();
        try {
            String query = "SELECT * FROM ressources WHERE tache_id = ?";
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
                resource.setFournisseur(resultSet.getString("fournisseur"));  // Retrieve fournisseur
                resources.add(resource);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resources;
    }

    public List<Ressource> getAllResources() {
        List<Ressource> resources = new ArrayList<>();
        try {
            String query = "SELECT * FROM ressources";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Ressource resource = new Ressource();
                resource.setId(resultSet.getInt("id"));
                resource.setName(resultSet.getString("name"));
                resource.setType(resultSet.getString("type"));
                resource.setQuantity(resultSet.getInt("quantity"));
                resource.setTach_id(resultSet.getInt("tache_id"));
                resource.setFournisseur(resultSet.getString("fournisseur"));  // Retrieve fournisseur
                resources.add(resource);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resources;
    }
}
