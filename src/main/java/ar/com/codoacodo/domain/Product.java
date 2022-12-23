package ar.com.codoacodo.domain;

public class Product {

	/* ------------------------------ Constructores ----------------------------- */

	public Product(int id, String name, String brand, float price, int stock, String entryDate, String expireDate) {
		this.id = id;
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

	private int id;
	private String name;
	private String brand;
	private float price;
	private int stock;
	private String entryDate;
	private String expireDate;

	/* --------------------------------- Métodos -------------------------------- */

	public void setId(int id) {
		this.id = id;
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

	public int getId() {
		return id;
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
			"Product [id=" +
			id +
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
