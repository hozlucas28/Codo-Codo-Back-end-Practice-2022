package ar.com.codoacodo.controllers.employees;

import ar.com.codoacodo.dao.impl.EmployeeDAOImpl;
import ar.com.codoacodo.domain.Employee;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/employees/searchByLastName") // Ruta de acceso --> http://localhost:8080/supermarket/employees/searchByLastName
public class SearchByLastName extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var employeeDAOImpl = new EmployeeDAOImpl();
		List<Employee> employees = new ArrayList<>();

		String lastName = req.getParameter("lastName");

		try {
			employees = (!lastName.equalsIgnoreCase("")) ? employeeDAOImpl.getAllByLastName(lastName) : employeeDAOImpl.getAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		req.setAttribute("searchValue", lastName);
		req.setAttribute("employees", employees);
		getServletContext().getRequestDispatcher("/employees/showAll.jsp").forward(req, resp);
	}
}
