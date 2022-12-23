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
@WebServlet("/employees/all") // Ruta de acceso --> http://localhost:8080/webapp/employees/all
public class ShowAll extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var employeeDAOImpl = new EmployeeDAOImpl();
		List<Employee> employees = new ArrayList<>();

		try {
			employees = employeeDAOImpl.getAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		req.setAttribute("employees", employees);
		getServletContext().getRequestDispatcher("/Employees/showAll.jsp").forward(req, resp);
	}
}
