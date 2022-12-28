<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ar.com.codoacodo.domain.Employee"%>
<%@page import="ar.com.codoacodo.domain.Product"%>
<%@page import="ar.com.codoacodo.dao.impl.EmployeeDAOImpl"%>
<%@page import="ar.com.codoacodo.dao.impl.ProductDAOImpl"%>

<%
	String activeOption = request.getParameter("activeOption");
	String showSearchButton = request.getParameter("showSearchButton");
	String searchAction = request.getParameter("searchAction");
	String searchValue = request.getParameter("searchValue");
	String searchName = request.getParameter("searchName");
	String searchPlaceholder = request.getParameter("searchPlaceholder");

	activeOption = (activeOption == null) ? "null" : activeOption;
	showSearchButton = (showSearchButton == null) ? "false" : showSearchButton;

	String isEmployeesEmpty = request.getParameter("isEmployeesEmpty");
	String isProductsEmpty = request.getParameter("isProductsEmpty");
	
	if (isEmployeesEmpty == null || isProductsEmpty == null) {
		List<Employee> employees = new ArrayList<>();
		List<Product> products = new ArrayList<>();
		EmployeeDAOImpl employeeDAOImpl = new EmployeeDAOImpl();
		ProductDAOImpl productDAOImpl = new ProductDAOImpl();
		
		try {
			employees = employeeDAOImpl.getAll();
			products = productDAOImpl.getAll();
		} catch(Exception e) {
			employees = new ArrayList<>();
			products = new ArrayList<>();
			e.printStackTrace();
		}
		
		isEmployeesEmpty = (employees.isEmpty()) ? "true" : "false";
		isProductsEmpty = (products.isEmpty()) ? "true" : "false";
	}
%>

<nav class="navbar navbar-dark navbar-expand-lg bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="<%= request.getContextPath() %>">
			<img src="<%= request.getContextPath() + "/resources/logo.png"%>" alt="Super Market" width="80"/>
		</a>
		<button
			class="navbar-toggler"
			type="button"
			data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent"
			aria-expanded="false"
		>
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a class="nav-link <% if (activeOption.equalsIgnoreCase("index")) { %> active <% }; %>" aria-current="page" href="<%= request.getContextPath() %>">
						Inicio
					</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle <% if (activeOption.equalsIgnoreCase("employeesManagement")) { %> active <% }; %>" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Gestionar Empleados
					</a>
					<ul class="dropdown-menu dropdown-menu-dark">
						<li>
							<a class="dropdown-item" href="<%= request.getContextPath() %>/employees/add.jsp">Añadir un empleado</a>
						</li>
						<%
							if (isEmployeesEmpty.equalsIgnoreCase("false")) {
						%>
								<li>
									<a class="dropdown-item" href="<%= request.getContextPath() %>/employees/delete.jsp">
										Eliminar un empleado
									</a>
								</li>
								<li>
									<hr class="dropdown-divider" />
								</li>
								<li>
									<a class="dropdown-item" href="<%= request.getContextPath() %>/employees/all">
										Ver tabla de empleados
									</a>
								</li>
						<%
							} else {
						%>
								<li>
									<a class="dropdown-item opacity-25" data-bs-toggle="tooltip" data-bs-title="No disponible hasta que añadas al menos a un empleado" data-bs-placement="right" style="cursor: not-allowed;">
										Eliminar un empleado
									</a>
								</li>
								<li>
									<hr class="dropdown-divider" />
								</li>
								<li>
									<a class="dropdown-item opacity-25" data-bs-toggle="tooltip" data-bs-title="No disponible hasta que añadas al menos a un empleado" data-bs-placement="bottom" style="cursor: not-allowed;">
										Ver tabla de empleados
									</a>
								</li>
						<%
							};
						%>
					</ul>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle <% if (activeOption.equalsIgnoreCase("productsManagement")) { %> active <% }; %>" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Gestionar Productos
					</a>
					<ul class="dropdown-menu dropdown-menu-dark">
						<li>
							<a class="dropdown-item" href="<%= request.getContextPath() %>/products/add.jsp">
								Añadir un producto
							</a>
						</li>
						<%
							if (isProductsEmpty.equalsIgnoreCase("false")) {
						%>
							<li>
								<a class="dropdown-item" href="<%= request.getContextPath() %>/products/delete.jsp">
									Eliminar un producto
								</a>
							</li>
							<li>
								<hr class="dropdown-divider" />
							</li>
							<li>
								<a class="dropdown-item" href="<%= request.getContextPath() %>/products/all">
									Ver tabla de productos
								</a>
							</li>
						<%
							} else {
						%>
							<li>
								<a class="dropdown-item opacity-25" data-bs-toggle="tooltip" data-bs-title="No disponible hasta que añadas al menos un producto" data-bs-placement="right" style="cursor: not-allowed;">
									Eliminar un producto
								</a>
							</li>
							<li>
								<hr class="dropdown-divider" />
							</li>
							<li>
								<a class="dropdown-item opacity-25" data-bs-toggle="tooltip" data-bs-title="No disponible hasta que añadas al menos un producto" data-bs-placement="bottom" style="cursor: not-allowed;">
									Ver tabla de productos
								</a>
							</li>
						<%
							};
						%>
					</ul>
				</li>
			</ul>
			<%
				if (showSearchButton.equalsIgnoreCase("true")) {
			%>
					<form class="d-flex" role="search" method="get" action="<%= request.getContextPath() + searchAction%>">
						<input class="form-control me-2" type="search" name="<%= searchName %>" value="<%= searchValue %>" placeholder="<%= searchPlaceholder %>">
						<button class="btn btn-outline-light d-flex align-items-center justify-content-center" type="submit">
							<svg class="bi bi-search" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
								<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
							</svg>
						</button>
					</form>
      		<%
				};
			%>
		</div>
	</div>
</nav>
