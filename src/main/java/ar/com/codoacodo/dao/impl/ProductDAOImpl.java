package ar.com.codoacodo.dao.impl;

import ar.com.codoacodo.dao.IProductDAO;
import ar.com.codoacodo.db.ConnectionManager;
import ar.com.codoacodo.domain.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements IProductDAO {

	public void add(Product product) throws SQLException {
		var connection = ConnectionManager.initConnection();

		String query = "INSERT INTO Products(name, brand, price, stock, entryDate, expireDate)	VALUES (?, ?, ?, ?, ?, ?);";
		PreparedStatement statement = connection.prepareStatement(query);

		statement.setString(1, product.getName());
		statement.setString(2, product.getBrand());
		statement.setFloat(3, product.getPrice());
		statement.setInt(4, product.getStock());
		statement.setString(5, product.getEntryDate());
		statement.setString(6, product.getExpireDate());
		statement.execute();
	}

	public boolean delete(int ID) throws SQLException {
		var connection = ConnectionManager.initConnection();
		Statement statement = connection.createStatement();

		String query = "SELECT * FROM Products WHERE ID = " + ID + ";";
		ResultSet resultSet = statement.executeQuery(query);

		if (resultSet.next()) {
			query = "DELETE FROM Products WHERE ID = " + ID + ";";
			statement.executeUpdate(query);
			return true;
		} else {
			return false;
		}
	}

	public void deleteAll() throws SQLException {
		var connection = ConnectionManager.initConnection();
		Statement statement = connection.createStatement();

		String query = "TRUNCATE TABLE Products;";
		statement.execute(query);
	}

	public void update(Product product) throws SQLException {
		var connection = ConnectionManager.initConnection();

		String query =
			"UPDATE Products SET name = ?, brand = ?, price = ?, stock = ?, entryDate = ?, expireDate = ?  WHERE ID = ?;";
		PreparedStatement statement = connection.prepareStatement(query);

		statement.setString(1, product.getName());
		statement.setString(2, product.getBrand());
		statement.setFloat(3, product.getPrice());
		statement.setInt(4, product.getStock());
		statement.setString(5, product.getEntryDate());
		statement.setString(6, product.getExpireDate());
		statement.setInt(7, product.getID());
		statement.execute();
	}

	public Product getByID(int ID) throws SQLException {
		var connection = ConnectionManager.initConnection();
		Statement statement = connection.createStatement();

		String query = "SELECT * FROM Products WHERE ID = " + ID + ";";
		ResultSet resultSet = statement.executeQuery(query);

		Product product = null;
		if (resultSet.next()) {
			String name = resultSet.getString("name");
			String brand = resultSet.getString("brand");
			float price = resultSet.getFloat("price");
			int stock = resultSet.getInt("stock");
			String entryDate = resultSet.getString("entryDate");
			String expireDate = resultSet.getString("expireDate");

			product = new Product(ID, name, brand, price, stock, entryDate, expireDate);
		}
		return product;
	}

	public List<Product> getAllByBrand(String brandToSearch) throws SQLException {
		var connection = ConnectionManager.initConnection();
		Statement statement = connection.createStatement();

		String query = "SELECT * FROM Products WHERE brand = '" + brandToSearch + "';";
		ResultSet resultSet = statement.executeQuery(query);

		List<Product> products = new ArrayList<>();
		while (resultSet.next()) {
			int ID = resultSet.getInt("ID");
			String name = resultSet.getString("name");
			String brand = resultSet.getString("brand");
			float price = resultSet.getFloat("price");
			int stock = resultSet.getInt("stock");
			String entryDate = resultSet.getString("entryDate");
			String expireDate = resultSet.getString("expireDate");

			var product = new Product(ID, name, brand, price, stock, entryDate, expireDate);
			products.add(product);
		}
		return products;
	}

	public List<Product> getAll() throws SQLException {
		var connection = ConnectionManager.initConnection();
		Statement statement = connection.createStatement();

		String query = "SELECT * FROM Products;";
		ResultSet resultSet = statement.executeQuery(query);

		List<Product> products = new ArrayList<>();
		while (resultSet.next()) {
			int ID = resultSet.getInt("ID");
			String name = resultSet.getString("name");
			String brand = resultSet.getString("brand");
			float price = resultSet.getFloat("price");
			int stock = resultSet.getInt("stock");
			String entryDate = resultSet.getString("entryDate");
			String expireDate = resultSet.getString("expireDate");

			var product = new Product(ID, name, brand, price, stock, entryDate, expireDate);
			products.add(product);
		}
		return products;
	}
}
