<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ar.com.codoacodo.domain.Employee"%>
<%@page import="ar.com.codoacodo.domain.Product"%>
<%@page import="ar.com.codoacodo.dao.impl.EmployeeDAOImpl"%>
<%@page import="ar.com.codoacodo.dao.impl.ProductDAOImpl"%>

<%
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
	
	String isEmployeesEmpty = (employees.isEmpty())? "true" : "false";
	String isProductsEmpty = (products.isEmpty())? "true" : "false";
	
	int amountOfActiveEmployees = 0;
	if (isEmployeesEmpty.equalsIgnoreCase("false")) {
		for (Employee employee : employees) {
			if (employee.isActive()) {
				amountOfActiveEmployees++;
			}
		}
	}

	int amountOfProducts = (isProductsEmpty.equalsIgnoreCase("false"))? amountOfProducts = products.size() : 0;
	
	String showToast = (String)request.getAttribute("showToast");
	String toastColor = (String)request.getAttribute("toastColor");
	String toastHeader = (String)request.getAttribute("toastHeader");
	String toastMessage = (String)request.getAttribute("toastMessage");
	String toastCustomIcon = (String)request.getAttribute("toastCustomIcon");

	showToast = (showToast == null)? "false" : showToast;
%>

<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="UTF-8" />
		<meta name="copyright" content="Lucas Hoz" />
		<meta name="robots" content="index, follow" />
		<meta name="Author" lang="es" content="Lucas Hoz" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta name="description" content="Práctica de Codo a Codo - Full Stack Java, lado Back-end." />
		<link rel="shortcut icon" href="<%=request.getContextPath() + "/resources/logo.png"%>" type="image/x-icon" />
		<meta
			name="keywords"
			content="Codo a Codo - Full Stack Java, Back-end, HTML, Java, MySQL, Práctica, Supermercado, Inicio"
		/>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
			crossorigin="anonymous"
		/>
		<title>Supermercado - Inicio</title>
	</head>
	<body class="min-vh-100 d-flex flex-column bg-secondary bg-opacity-50">
		<!-- ------------------------- Menú de Navegación -------------------------- -->
		<jsp:include page="./components/navbar.jsp">
  			<jsp:param name="activeOption" value="index" />
			<jsp:param name="isEmployeesEmpty" value="<%= isEmployeesEmpty %>" />
			<jsp:param name="isProductsEmpty" value="<%= isProductsEmpty %>" />
		</jsp:include>

		<!-- ------------------------- Contenido Principal ------------------------- -->
		<main class="mx-100 my-auto">
			<h1 class="mt-auto mb-1 text-center">Bienvenido</h1>
			<p class="mb-4 text-center">(Inicio del panel de administrador)</p>
			<div class="mx-2 d-flex align-items-stretch justify-content-center gap-5 text-center">
				<div class="card border-dark text-bg-light" style="width: 18rem;">
					<h5 class="card-header">Empleados Activos</h5>
					<div class="card-body">
						<p class="my-5 card-text fs-1 <% if (amountOfActiveEmployees > 0)  { %> text-success <% } else { %> text-danger <% }; %> fw-semibold"><%= amountOfActiveEmployees %></p>
					</div>
				</div>
				<div class="card border-dark text-bg-light" style="width: 18rem;">
					<h5 class="card-header">Productos Listados</h5>
					<div class="card-body">
						<p class="my-5 card-text fs-1 <% if (amountOfProducts > 0)  { %> text-success <% } else { %> text-danger <% }; %> fw-semibold"><%= amountOfProducts %></p>
					</div>
				</div>
			</div>
			<p class="mx-4 mt-4 text-center text-muted">
				Utilice el menú de navegación para gestionar a sus empleados y productos.
			</p>
		</main>
		
		<!-- -------------------------------- Toast -------------------------------- -->
		<%
			if (showToast.equalsIgnoreCase("true")) {
		%>
				<jsp:include page="./components/toast.jsp">
					<jsp:param name="color" value="<%= toastColor %>" />
					<jsp:param name="header" value="<%= toastHeader %>" />
					<jsp:param name="message" value="<%= toastMessage %>" />
					<jsp:param name="customIcon" value="<%= toastCustomIcon %>" />
				</jsp:include>
		<%
			};
		%>

		<!-- ---------------------------- Pie de Página ---------------------------- -->
		<jsp:include page="./components/footer.jsp">
			<jsp:param name="isEmployeesEmpty" value="<%= isEmployeesEmpty %>" />
			<jsp:param name="isProductsEmpty" value="<%= isProductsEmpty %>" />
		</jsp:include>
	</body>
	<!-- ----------------------------- JavaScript ------------------------------ -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"
	></script>
	
	<script src="./JS/tooltip.js" type="text/javascript"></script>
</html>
