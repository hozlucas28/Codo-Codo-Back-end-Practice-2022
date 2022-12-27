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
@WebServlet("/employees/add") // Ruta de acceso --> http://localhost:8080/supermarket/employees/add
public class Add extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String telephone = req.getParameter("telephone");
		String workstation = req.getParameter("workstation");
		Float salary = Float.parseFloat(req.getParameter("salary"));
		String startDate = req.getParameter("startDate");

		try {
			var employeeDAOImpl = new EmployeeDAOImpl();
			var employee = new Employee(firstName, lastName, telephone, workstation, salary, startDate, null, true);
			employeeDAOImpl.add(employee);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		req.setAttribute("showToast", "true");
		req.setAttribute("toastColor", "bg-success");
		req.setAttribute("toastHeader", "Notificación");
		req.setAttribute("toastMessage", "Se ha creado el empleado '" + firstName + " " + lastName + "' con éxito.");
		getServletContext().getRequestDispatcher("/employees/all").forward(req, resp);
	}
}
