package model;

public class Ressource {
    private int id;
    private String name;
    private String type;
    private int quantity;
    private int tach_id;
    private String fournisseur;

    // Getters and Setters for all fields, including the new ones
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

	/**
	 * @return the tach_id
	 */
	public int getTach_id() {
		return tach_id;
	}

	/**
	 * @param tach_id the tach_id to set
	 */
	public void setTach_id(int tach_id) {
		this.tach_id = tach_id;
	}

	/**
	 * @return the fournisseur
	 */
	public String getFournisseur() {
		return fournisseur;
	}

	/**
	 * @param fournisseur the fournisseur to set
	 */
	public void setFournisseur(String fournisseur) {
		this.fournisseur = fournisseur;
	}


}
