package ar.com.codoacodo.controllers.products;

import ar.com.codoacodo.dao.impl.ProductDAOImpl;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/products/deleteAll") // Ruta de acceso --> http://localhost:8080/supermarket/products/deleteAll
public class DeleteAll extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doDelete(req, resp);
	}

	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		try {
			var productDAOImpl = new ProductDAOImpl();
			productDAOImpl.deleteAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		req.setAttribute("showToast", "true");
		req.setAttribute("toastColor", "bg-danger");
		req.setAttribute("toastHeader", "Notificación");
		req.setAttribute("toastMessage", "Se ha eliminado la tabla de productos con éxito.");
		getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
	}
}
