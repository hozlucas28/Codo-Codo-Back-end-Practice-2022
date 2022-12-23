package ar.com.codoacodo.controllers.employees;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/employees/update") // Ruta de acceso --> http://localhost:8080/webapp/employees/update
public class UpdateData extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {}

	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {}
}
