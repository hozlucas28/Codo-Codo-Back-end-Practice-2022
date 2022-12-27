package ar.com.codoacodo.dao;

import ar.com.codoacodo.domain.Employee;
import java.sql.SQLException;
import java.util.List;

public interface IEmployeeDAO {
	public void add(Employee employee) throws SQLException; // Añade un nuevo empleado.

	public boolean delete(int ID) throws SQLException; // Elimina un empleado.

	public void deleteAll() throws SQLException; // Elimina todos los empleados.

	public void update(Employee employee) throws SQLException; // Actualiza los datos de un empleado.

	public Employee getByID(int ID) throws SQLException; // Devuelve el empleado que coindice con la ID.

	public List<Employee> getAllByLastName(String lastName) throws SQLException; // Devuelve todos los empleados que coindicen con el apellido.

	public List<Employee> getAll() throws SQLException; // Devuelve todos los empleados.
}
