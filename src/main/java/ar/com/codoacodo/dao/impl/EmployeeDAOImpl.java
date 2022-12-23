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

	public void delete(int id) throws SQLException {
		var connection = ConnectionManager.initConnection();
		Statement statement = connection.createStatement();

		String query = "DELETE FROM Employees WHERE id = " + id;
		statement.executeUpdate(query);
	}

	public void update(Employee employee) throws SQLException {
		var connection = ConnectionManager.initConnection();

		String query =
			"UPDATE Employees SET firstName = ?, lastName = ?, telephone = ?, workstation = ?, salary = ?, startDate = ?, endDate = ?, isActive = ?  WHERE id = ?";
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

	public Employee getByID(int id) throws SQLException {
		var connection = ConnectionManager.initConnection();
		Statement statement = connection.createStatement();

		String query = "SELECT * FROM Employees WHERE id = " + id;
		ResultSet resultSet = statement.executeQuery(query);

		String firstName = resultSet.getString("firstName");
		String lastName = resultSet.getString("lastName");
		String telephone = resultSet.getString("telephone");
		String workstation = resultSet.getString("workstation");
		float salary = resultSet.getFloat("salary");
		String startDate = resultSet.getString("startDate");
		String endDate = resultSet.getString("endDate");
		boolean isActive = resultSet.getBoolean("isActive");

		return new Employee(firstName, lastName, telephone, workstation, salary, startDate, endDate, isActive);
	}

	public List<Employee> getAll() throws SQLException {
		var connection = ConnectionManager.initConnection();
		Statement statement = connection.createStatement();

		String query = "SELECT * FROM Employees";
		ResultSet resultSet = statement.executeQuery(query);

		List<Employee> employees = new ArrayList<>();
		while (resultSet.next()) {
			int id = resultSet.getInt("id");
			String firstName = resultSet.getString("firstName");
			String lastName = resultSet.getString("lastName");
			String telephone = resultSet.getString("telephone");
			String workstation = resultSet.getString("workstation");
			float salary = resultSet.getFloat("salary");
			String startDate = resultSet.getString("startDate");
			String endDate = resultSet.getString("endDate");
			boolean isActive = resultSet.getBoolean("isActive");

			var employee = new Employee(id, firstName, lastName, telephone, workstation, salary, startDate, endDate, isActive);
			employees.add(employee);
		}
		return employees;
	}
}
