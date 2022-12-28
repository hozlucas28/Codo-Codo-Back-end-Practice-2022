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
@WebServlet("/employees/delete") // Ruta de acceso --> http://localhost:8080/supermarket/employees/delete
public class Delete extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doDelete(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doDelete(req, resp);
	}

	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		boolean isEmpty = false;
		String path = "/index.jsp";
		List<Employee> employees = new ArrayList<>();

		try {
			String str_ID = req.getParameter("ID");

			if (!str_ID.equalsIgnoreCase("")) {
				int ID = Integer.parseInt(str_ID);

				var employeeDAOImpl = new EmployeeDAOImpl();
				boolean deleted = employeeDAOImpl.delete(ID);

				if (deleted) {
					employees = employeeDAOImpl.getAll();
					isEmpty = employees.isEmpty();

					if (!isEmpty) {
						req.setAttribute("showToast", "true");
						req.setAttribute("toastColor", "bg-danger");
						req.setAttribute("toastHeader", "Notificación");
						req.setAttribute("toastMessage", "Se ha eliminado el empleado con éxito.");
						path = "/employees/all";
					} else {
						req.setAttribute("showToast", "true");
						req.setAttribute("toastColor", "text-danger");
						req.setAttribute("toastHeader", "Notificación");
						req.setAttribute(
							"toastMessage",
							"Se ha eliminado el empleado con éxito. Al no haber más empleados has sido redirigido a la página de inicio."
						);
						req.setAttribute("toastCustomIcon", "info");
						path = "/index.jsp";
					}
				} else {
					req.setAttribute("showToast", "true");
					req.setAttribute("toastColor", "text-warning");
					req.setAttribute("toastHeader", "¡Error!");
					req.setAttribute("toastMessage", "El ID ingresado no existe, ingrese uno válido.");
					req.setAttribute("toastCustomIcon", "danger");
					path = "/employees/delete.jsp";
				}
			} else {
				req.setAttribute("showToast", "true");
				req.setAttribute("toastColor", "text-warning");
				req.setAttribute("toastHeader", "¡Error!");
				req.setAttribute("toastMessage", "El ID ingresado no existe, ingrese uno válido.");
				req.setAttribute("toastCustomIcon", "danger");
				path = "/employees/delete.jsp";
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getServletContext().getRequestDispatcher(path).forward(req, resp);
		}
	}
}
