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
@WebServlet("/employees/update") // Ruta de acceso --> http://localhost:8080/supermarket/employees/update
public class UpdateData extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int ID = Integer.parseInt(req.getParameter("ID"));

			var employeeDAOImpl = new EmployeeDAOImpl();
			Employee employee = employeeDAOImpl.getByID(ID);
			req.setAttribute("employee", employee);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getServletContext().getRequestDispatcher("/employees/updateData.jsp").forward(req, resp);
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPut(req, resp);
	}

	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		int ID = Integer.parseInt(req.getParameter("ID"));
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String telephone = req.getParameter("telephone");
		String workstation = req.getParameter("workstation");
		Float salary = Float.parseFloat(req.getParameter("salary"));
		String startDate = req.getParameter("startDate");

		String endDate = req.getParameter("endDate");
		if (endDate.equalsIgnoreCase("")) {
			endDate = null;
		}

		Boolean isActive = false;
		if (endDate == null) {
			isActive = true;
		}

		try {
			var employeeDAOImpl = new EmployeeDAOImpl();
			var employee = new Employee(ID, firstName, lastName, telephone, workstation, salary, startDate, endDate, isActive);
			employeeDAOImpl.update(employee);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		req.setAttribute("showToast", "true");
		req.setAttribute("toastColor", "bg-info");
		req.setAttribute("toastHeader", "Notificación");
		req.setAttribute("toastMessage", "Se han actualizado los datos del empleado con éxito.");
		getServletContext().getRequestDispatcher("/employees/all").forward(req, resp);
	}
}
