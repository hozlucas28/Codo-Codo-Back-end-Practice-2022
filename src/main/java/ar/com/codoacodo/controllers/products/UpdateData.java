package ar.com.codoacodo.controllers.products;

import ar.com.codoacodo.dao.impl.ProductDAOImpl;
import ar.com.codoacodo.domain.Product;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/products/update") // Ruta de acceso --> http://localhost:8080/supermarket/products/update
public class UpdateData extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int ID = Integer.parseInt(req.getParameter("ID"));

			var productDAOImpl = new ProductDAOImpl();
			Product product = productDAOImpl.getByID(ID);
			req.setAttribute("product", product);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getServletContext().getRequestDispatcher("/products/updateData.jsp").forward(req, resp);
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPut(req, resp);
	}

	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		int ID = Integer.parseInt(req.getParameter("ID"));
		String name = req.getParameter("name");
		String brand = req.getParameter("brand");
		Float price = Float.parseFloat(req.getParameter("price"));
		int stock = Integer.parseInt(req.getParameter("stock"));
		String entryDate = req.getParameter("entryDate");

		String expireDate = req.getParameter("expireDate");
		if (expireDate.equalsIgnoreCase("")) {
			expireDate = null;
		}

		try {
			var productDAOImpl = new ProductDAOImpl();
			var product = new Product(ID, name, brand, price, stock, entryDate, expireDate);
			productDAOImpl.update(product);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		req.setAttribute("showToast", "true");
		req.setAttribute("toastColor", "bg-info");
		req.setAttribute("toastHeader", "Notificación");
		req.setAttribute("toastMessage", "Se ha actualizado la información del producto con éxito.");
		getServletContext().getRequestDispatcher("/products/all").forward(req, resp);
	}
}
