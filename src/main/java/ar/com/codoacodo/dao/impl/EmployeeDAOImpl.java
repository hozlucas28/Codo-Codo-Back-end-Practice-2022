package ar.com.codoacodo.dao.impl;

import ar.com.codoacodo.dao.IEmployeeDAO;
import ar.com.codoacodo.db.ConnectionManager;
import ar.com.codoacodo.domain.Employee;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAOImpl implements IEmployeeDAO {

	public void add(Employee employee) throws SQLException {
		var connection = ConnectionManager.initConnection();

		String query =
			"INSERT INTO Employees(firstName, lastName, telephone, workstation, salary, startDate, endDate, isActive) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
		PreparedStatement statement = connection.prepareStatement(query);

		statement.setString(1, employee.getFirstName());
		statement.setString(2, employee.getLastName());
		statement.setString(3, employee.getTelephone());
		statement.setString(4, employee.getWorkstation());
		statement.setFloat(5, employee.getSalary());
		statement.setString(6, employee.getStartDate());
		statement.setString(7, employee.getEndDate());
		statement.setBoolean(8, employee.isActive());
		statement.execute();
	}

	public boolean delete(int ID) throws SQLException {
		var connection = ConnectionManager.initConnection();
		Statement statement = connection.createStatement();

		String query = "SELECT * FROM Employees WHERE ID = " + ID + ";";
		ResultSet resultSet = statement.executeQuery(query);

		if (resultSet.next()) {
			query = "DELETE FROM Employees WHERE ID = " + ID + ";";
			statement.executeUpdate(query);
			return true;
		} else {
			return false;
		}
	}

	public void deleteAll() throws SQLException {
		var connection = ConnectionManager.initConnection();
		Statement statement = connection.createStatement();

		String query = "TRUNCATE TABLE Employees;";
		statement.execute(query);
	}

	public void update(Employee employee) throws SQLException {
		var connection = ConnectionManager.initConnection();

		String query =
			"UPDATE Employees SET firstName = ?, lastName = ?, telephone = ?, workstation = ?, salary = ?, startDate = ?, endDate = ?, isActive = ?  WHERE ID = ?;";
		PreparedStatement statement = connection.prepareStatement(query);

		statement.setString(1, employee.getFirstName());
		statement.setString(2, employee.getLastName());
		statement.setString(3, employee.getTelephone());
		statement.setString(4, employee.getWorkstation());
		statement.setFloat(5, employee.getSalary());
		statement.setString(6, employee.getStartDate());
		statement.setString(7, employee.getEndDate());
		statement.setBoolean(8, employee.isActive());
		statement.setInt(9, employee.getID());
		statement.execute();
	}

	public Employee getByID(int ID) throws SQLException {
		var connection = ConnectionManager.initConnection();
		Statement statement = connection.createStatement();

		String query = "SELECT * FROM Employees WHERE ID = " + ID + ";";
		ResultSet resultSet = statement.executeQuery(query);

		Employee employee = null;
		if (resultSet.next()) {
			String firstName = resultSet.getString("firstName");
			String lastName = resultSet.getString("lastName");
			String telephone = resultSet.getString("telephone");
			String workstation = resultSet.getString("workstation");
			float salary = resultSet.getFloat("salary");
			String startDate = resultSet.getString("startDate");
			String endDate = resultSet.getString("endDate");
			boolean isActive = resultSet.getBoolean("isActive");

			employee = new Employee(ID, firstName, lastName, telephone, workstation, salary, startDate, endDate, isActive);
		}
		return employee;
	}

	public List<Employee> getAllByLastName(String lastNameToSearch) throws SQLException {
		var connection = ConnectionManager.initConnection();
		Statement statement = connection.createStatement();

		String query = "SELECT * FROM Employees WHERE lastName = '" + lastNameToSearch + "';";
		ResultSet resultSet = statement.executeQuery(query);

		List<Employee> employees = new ArrayList<>();
		while (resultSet.next()) {
			int ID = resultSet.getInt("ID");
			String firstName = resultSet.getString("firstName");
			String lastName = resultSet.getString("lastName");
			String telephone = resultSet.getString("telephone");
			String workstation = resultSet.getString("workstation");
			float salary = resultSet.getFloat("salary");
			String startDate = resultSet.getString("startDate");
			String endDate = resultSet.getString("endDate");
			boolean isActive = resultSet.getBoolean("isActive");

			var employee = new Employee(ID, firstName, lastName, telephone, workstation, salary, startDate, endDate, isActive);
			employees.add(employee);
		}
		return employees;
	}

	public List<Employee> getAll() throws SQLException {
		var connection = ConnectionManager.initConnection();
		Statement statement = connection.createStatement();

		String query = "SELECT * FROM Employees;";
		ResultSet resultSet = statement.executeQuery(query);

		List<Employee> employees = new ArrayList<>();
		while (resultSet.next()) {
			int ID = resultSet.getInt("ID");
			String firstName = resultSet.getString("firstName");
			String lastName = resultSet.getString("lastName");
			String telephone = resultSet.getString("telephone");
			String workstation = resultSet.getString("workstation");
			float salary = resultSet.getFloat("salary");
			String startDate = resultSet.getString("startDate");
			String endDate = resultSet.getString("endDate");
			boolean isActive = resultSet.getBoolean("isActive");

			var employee = new Employee(ID, firstName, lastName, telephone, workstation, salary, startDate, endDate, isActive);
			employees.add(employee);
		}
		return employees;
	}
}
