<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ar.com.codoacodo.domain.Employee"%>
<%@page import="ar.com.codoacodo.domain.Product"%>
<%@page import="ar.com.codoacodo.dao.impl.EmployeeDAOImpl"%>
<%@page import="ar.com.codoacodo.dao.impl.ProductDAOImpl"%>

<%
	String isEmployeesEmpty = (String)request.getParameter("isEmployeesEmpty");
	String isProductsEmpty = (String)request.getParameter("isProductsEmpty");
	
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
	};
%>

<footer class="mt-auto py-3 d-flex flex-wrap align-items-center justify-content-around border-top">
	<div class="col-md-4 d-flex align-items-center gap-2">
		<img class="text-muted text-decoration-none" src="<%=request.getContextPath() + "/resources/logo.png"%>" alt="Super Market" width="30" style="filter: grayscale(100%);"/>
		<span class="text-muted">© 2022 Company, Inc</span>
	</div>
	<ul class="nav col-md-4 d-flex justify-content-end gap-4 list-unstyled">
		<%
			if (isEmployeesEmpty.equalsIgnoreCase("false")) {
		%>
			<li class="ms-3">
				<a class="text-muted text-decoration-none text-decoration-underline" href="<%= request.getContextPath() %>/employees/all">Tabla de empleados</a>
			</li>
		<%
			} else {
		%>
			<li class="ms-3">
				<a class="text-muted text-decoration-none text-decoration-underline opacity-25" href="<%= request.getContextPath() %>/employees/all" data-bs-toggle="tooltip" data-bs-title="No disponible hasta que añadas al menos a un empleado" data-bs-placement="top" style="cursor: not-allowed;">Tabla de empleados</a>
			</li>
		<%
			};
		%>
		<%
			if (isProductsEmpty.equalsIgnoreCase("false")) {
		%>
			<li class="ms-3">
				<a class="text-muted text-decoration-none text-decoration-underline" href="<%= request.getContextPath() %>/products/all">Tabla de productos</a>
			</li>
		<%
			} else {
		%>
			<li class="ms-3">
				<a class="text-muted text-decoration-none text-decoration-underline opacity-25" href="<%= request.getContextPath() %>/products/all" data-bs-toggle="tooltip" data-bs-title="No disponible hasta que añadas al menos un producto" data-bs-placement="top" style="cursor: not-allowed;">Tabla de productos</a>
			</li>
		<%
			};
		%>
	</ul>
</footer>