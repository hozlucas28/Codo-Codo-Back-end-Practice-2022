package ar.com.codoacodo.controllers.products;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/products/update") // Ruta de acceso --> http://localhost:8080/webapp/products/update
public class UpdateData extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {}

	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {}
}
