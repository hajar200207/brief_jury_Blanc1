package model;

import java.util.Date;
import java.util.List;

public class Tache {
    private int id;
    private String description;
    private Date startDate;
    private Date endDate;
    private String status;
    private int projet_Id;
    private List<Ressource> resources;

    /**
	 * @return the projet_Id
	 */
	public int getProjet_Id() {
		return projet_Id;
	}

	/**
	 * @param projet_Id the projet_Id to set
	 */
	public void setProjet_Id(int projet_Id) {
		this.projet_Id = projet_Id;
	}

	public Tache() {}

    public Tache(String description, Date startDate, Date endDate, String status, int projet_Id) {
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
        this.projet_Id = projet_Id;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

	/**
	 * @return the resources
	 */
	public List<Ressource> getResources() {
		return resources;
	}

	/**
	 * @param resources the resources to set
	 */
	public void setResources(List<Ressource> resources) {
		this.resources = resources;
	}


   
}
