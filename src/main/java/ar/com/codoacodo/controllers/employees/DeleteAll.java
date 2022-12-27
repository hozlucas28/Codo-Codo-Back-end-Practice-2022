package ar.com.codoacodo.controllers.employees;

import ar.com.codoacodo.dao.impl.EmployeeDAOImpl;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/employees/deleteAll") // Ruta de acceso --> http://localhost:8080/supermarket/employees/deleteAll
public class DeleteAll extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doDelete(req, resp);
	}

	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		try {
			var employeeDAOImpl = new EmployeeDAOImpl();
			employeeDAOImpl.deleteAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		req.setAttribute("showToast", "true");
		req.setAttribute("toastColor", "bg-danger");
		req.setAttribute("toastHeader", "Notificación");
		req.setAttribute("toastMessage", "Se ha eliminado la tabla de empleados con éxito.");
		getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
	}
}
