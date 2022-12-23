package ar.com.codoacodo.dao;

import ar.com.codoacodo.domain.Employee;
import java.sql.SQLException;
import java.util.List;

public interface IEmployeeDAO {
	public void add(Employee employee) throws SQLException; // Añade un nuevo empleado.

	public void delete(int id) throws SQLException; // Elimina un empleado.

	public void update(Employee employee) throws SQLException; // Actualiza los datos de un empleado.

	public Employee getByID(int id) throws SQLException; // Devuelve el empleado que coindice con la ID.

	public List<Employee> getAll() throws SQLException; // Devuelve un listado con todos los empleados.
}
