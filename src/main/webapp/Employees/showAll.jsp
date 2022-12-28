<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="ar.com.codoacodo.domain.Employee"%>

<%
	String searchValue = (String)request.getAttribute("searchValue");
	
	searchValue = (searchValue == null) ? "" : searchValue;

	List<Employee> employees = (List<Employee>)request.getAttribute("employees");
	boolean isEmpty = employees.isEmpty();
	
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
		<link rel="shortcut icon" href="<%= request.getContextPath() + "/resources/logo.png"%>" type="image/x-icon" />
		<meta
			name="keywords"
			content="Codo a Codo - Full Stack Java, Back-end, HTML, Java, MySQL, Práctica, Supermercado, Tabla de empleados"
		/>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
			crossorigin="anonymous"
		/>
		<title>Supermercado - Tabla de Empleados</title>
	</head>
	<body class="min-vh-100 d-flex flex-column bg-secondary bg-opacity-50">
		<!-- ------------------------- Menú de Navegación -------------------------- -->
		<jsp:include page="../components/navbar.jsp">
			<jsp:param name="activeOption" value="employeesManagement" />
			<jsp:param name="showSearchButton" value="true" />
			<jsp:param name="searchAction" value="/employees/searchByLastName" />
			<jsp:param name="searchValue" value="<%= searchValue %>" />
			<jsp:param name="searchName" value="lastName" />
			<jsp:param name="searchPlaceholder" value="Ingrese el apellido..." />
		</jsp:include>

		<nav class="mx-2 mt-4">
  			<ul class="breadcrumb">
    			<li class="breadcrumb-item">Inicio</li>
    			<li class="breadcrumb-item" aria-current="page">Gestionar Empleados</li>
    			<li class="breadcrumb-item active" aria-current="page">Ver tabla de empleados</li>
  			</ul>
		</nav>

		<!-- ------------------------- Contenido Principal ------------------------- -->
		<main class="mb-4">
			<%
				if (!isEmpty) {
			%>
				<%
					if (!searchValue.equalsIgnoreCase("")) {
				%>
						<div class="alert alert-warning mx-3 d-flex align-items-center justify-content-start gap-1" role="alert">
							<svg class="bi bi-info-circle" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
  								<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  								<path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
							</svg>
			  				<span>Se han encontrado <%= employees.size() %> resultados que coinciden con el apellido '<%= searchValue %>'.</span>
						</div>
				<%
					};
				%>
				<div class="table-responsive mx-3 border border-dark shadow">
					<table class="table table-sm table-dark table-hover table-bordered mb-0 align-middle">
						<thead>
							<tr class="align-middle text-center">
								<th scope="col">#</th>
								<th scope="col">Nombre</th>
								<th scope="col">Apellido</th>
								<th scope="col">Telefono</th>
								<th scope="col">Puesto de trabajo</th>
								<th scope="col">Salario</th>
								<th scope="col">Fecha de inicio</th>
								<th scope="col">Fecha de finalización</th>
								<th scope="col">¿Esta activo?</th>
								<th class="text-center" scope="col">Acciones</th>
							</tr>
						</thead>
						<tbody class="table-light">
							<%
								for (Employee employee : employees)
								{
									int ID = employee.getID();
									String firstName = employee.getFirstName();
									String lastName = employee.getLastName();
									String telephone = employee.getTelephone();
									String workstation = employee.getWorkstation();
									float salary = employee.getSalary();
									String startDate = employee.getStartDate();
									String endDate = employee.getEndDate();
									Boolean isActive = employee.isActive();
									if (endDate == null) {
										endDate = "-";
									};
							%>
									<tr>
										<th class="table-primary align-middle text-center" scope="row"><%= ID %></th>
										<td><%= firstName %></td>
										<td><%= lastName %></td>
										<td><%= telephone %></td>
										<td><%= workstation %></td>
										<td>$ <%= salary %></td>
										<td><%= startDate %></td>
										<td><%= endDate %></td>
										<%
											if (isActive) {
										%>
											<td class="text-success">Si</td>
										<%
											} else {
										%>
											<td class="text-danger">No</td>
										<%
											};
										%>
										<td>
											<div class="d-flex align-items-center justify-content-center gap-3">
												<button class="btn btn-sm btn-danger px-4 d-flex align-items-center gap-1" type="button" onclick="location.href = '<%= request.getContextPath() %>/employees/delete?ID=<%= ID %>';">
													<svg class="bi bi-trash" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
  														<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  														<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
													</svg>
													<span>ELIMINAR</span>
												</button>
												<button class="btn btn-sm btn-info px-4 d-flex align-items-center gap-1" type="button" onclick="location.href = '<%= request.getContextPath() %>/employees/update?ID=<%= ID %>';">
													<svg class="bi bi-pen" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
  														<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"/>
													</svg>
													<span>EDITAR</span>
												</button>
											</div>
										</td>
									</tr>
							<%
								};
							%>
						</tbody>
					</table>
				</div>		
				<div class="mx-2 mt-3 d-flex align-items-stretch justify-content-center gap-5">
					<button class="btn btn-outline-success w-25 d-flex align-items-center justify-content-center gap-1" type="button" onclick="location.href = '<%= request.getContextPath() %>/employees/add.jsp';">
						<svg class="bi bi-person-plus-fill" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
  							<path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  							<path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
						</svg>
						<span>Añadir Empleado</span>
					</button>
					<button class="btn btn-outline-danger w-25 d-flex align-items-center justify-content-center gap-1" type="button" onclick="location.href = '<%= request.getContextPath() %>/employees/deleteAll';">
						<svg class="bi bi-trash-fill" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
  							<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
						</svg>
						<span>Vaciar Tabla</span>
					</button> 
				</div>
			<%
				} else {
			%>
				<div class="alert alert-danger mx-3 d-flex align-items-center justify-content-start gap-1" role="alert">
					<svg class="bi bi-exclamation-triangle" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
  						<path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/>
  						<path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
					</svg>
			  		<span>No se han encontrado resultados que coinciden con el apellido '<%= searchValue %>'.</span>
				</div>
				<div class="mx-2 mt-3 d-flex align-items-center justify-content-center gap-5">
					<button class="w-25 btn btn-light d-flex align-items-center gap-1 justify-content-center" type="button" onclick="location.href = '<%= request.getContextPath() %>/employees/all';">
						<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-arrow-left-short" viewBox="0 0 16 16">
  							<path fill-rule="evenodd" d="M12 8a.5.5 0 0 1-.5.5H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5a.5.5 0 0 1 .5.5z"/>
						</svg>
						<span>Volver a la tabla</span>
					</button> 
				</div>
			<%
				};
			%>
		</main>
		
		<!-- ---------------------------- TODO ---------------------------- -->
		<%
			if (showToast.equalsIgnoreCase("true")) {
		%>
			<jsp:include page="../components/toast.jsp">
				<jsp:param name="color" value="<%= toastColor %>" />
				<jsp:param name="header" value="<%= toastHeader %>" />
				<jsp:param name="message" value="<%= toastMessage %>" />
			</jsp:include>
		<%
			};
		%>

		<!-- ---------------------------- Pie de Página ---------------------------- -->
		<jsp:include page="../components/footer.jsp" />
	</body>
	<!-- ----------------------------- JavaScript ------------------------------ -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"
	></script>
	
	<script src="../JS/tooltip.js" type="text/javascript"></script>
</html>
