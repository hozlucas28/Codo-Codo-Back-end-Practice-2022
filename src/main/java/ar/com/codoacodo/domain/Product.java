package ar.com.codoacodo.domain;

public class Product {

	/* ------------------------------ Constructores ----------------------------- */

	public Product(int ID, String name, String brand, float price, int stock, String entryDate, String expireDate) {
		this.ID = ID;
		this.name = name;
		this.brand = brand;
		this.price = price;
		this.stock = stock;
		this.entryDate = entryDate;
		this.expireDate = expireDate;
	}

	public Product(String name, String brand, float price, int stock, String entryDate, String expireDate) {
		this.name = name;
		this.brand = brand;
		this.price = price;
		this.stock = stock;
		this.entryDate = entryDate;
		this.expireDate = expireDate;
	}

	/* -------------------------------- Atributos ------------------------------- */

	private int ID;
	private String name;
	private String brand;
	private float price;
	private int stock;
	private String entryDate;
	private String expireDate;

	/* --------------------------------- Métodos -------------------------------- */

	public void setId(int ID) {
		this.ID = ID;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}

	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}

	public int getID() {
		return ID;
	}

	public String getName() {
		return name;
	}

	public String getBrand() {
		return brand;
	}

	public float getPrice() {
		return price;
	}

	public int getStock() {
		return stock;
	}

	public String getEntryDate() {
		return entryDate;
	}

	public String getExpireDate() {
		return expireDate;
	}

	public String toString() {
		return (
			"Product [ID=" +
			ID +
			", name=" +
			name +
			", brand=" +
			brand +
			", price=" +
			price +
			", stock=" +
			stock +
			", entryDate=" +
			entryDate +
			", expireDate=" +
			expireDate +
			"]"
		);
	}
}
