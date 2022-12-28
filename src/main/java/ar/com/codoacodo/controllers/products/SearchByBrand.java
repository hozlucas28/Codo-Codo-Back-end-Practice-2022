package ar.com.codoacodo.controllers.products;

import ar.com.codoacodo.dao.impl.ProductDAOImpl;
import ar.com.codoacodo.domain.Product;
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
@WebServlet("/products/searchByBrand") // Ruta de acceso --> http://localhost:8080/supermarket/products/searchByBrand
public class SearchByBrand extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var productDAOImpl = new ProductDAOImpl();
		List<Product> products = new ArrayList<>();

		String brand = req.getParameter("brand");

		try {
			products = (!brand.equalsIgnoreCase("")) ? productDAOImpl.getAllByBrand(brand) : productDAOImpl.getAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		req.setAttribute("searchValue", brand);
		req.setAttribute("products", products);
		getServletContext().getRequestDispatcher("/products/showAll.jsp").forward(req, resp);
	}
}
