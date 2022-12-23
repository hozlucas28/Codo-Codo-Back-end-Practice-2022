package ar.com.codoacodo.controllers.employees;

import ar.com.codoacodo.dao.impl.EmployeeDAOImpl;
import ar.com.codoacodo.domain.Employee;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/employees/add") // Ruta de acceso --> http://localhost:8080/webapp/employees/add
public class Add extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String telephone = req.getParameter("telephone");
		String workstation = req.getParameter("workstation");
		Float salary = Float.parseFloat(req.getParameter("salary"));
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		Boolean isActive = Boolean.parseBoolean(req.getParameter("isActive"));

		try {
			EmployeeDAOImpl employeeDAOImpl = new EmployeeDAOImpl();
			var employee = new Employee(firstName, lastName, telephone, workstation, salary, startDate, endDate, isActive);
			employeeDAOImpl.add(employee);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		getServletContext().getRequestDispatcher("/employees/all").forward(req, resp);
	}
}
