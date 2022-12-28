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
@WebServlet("/products/add") // Ruta de acceso --> http://localhost:8080/supermarket/products/add
public class Add extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String name = req.getParameter("name");
		String brand = req.getParameter("brand");
		Float price = Float.parseFloat(req.getParameter("price"));
		int stock = Integer.parseInt(req.getParameter("stock"));
		String entryDate = req.getParameter("entryDate");
		String expireDate = req.getParameter("expireDate");

		try {
			var productDAOImpl = new ProductDAOImpl();
			var product = new Product(name, brand, price, stock, entryDate, expireDate);
			productDAOImpl.add(product);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		req.setAttribute("showToast", "true");
		req.setAttribute("toastColor", "bg-success");
		req.setAttribute("toastHeader", "Notificación");
		req.setAttribute("toastMessage", "Se ha creado el producto '" + name + " de " + brand + "' con éxito.");
		getServletContext().getRequestDispatcher("/products/all").forward(req, resp);
	}
}
