<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="ar.com.codoacodo.domain.Employee"%>

<%
	Employee employee = (Employee)request.getAttribute("employee");
	
	int ID = employee.getID();
	String firstName = employee.getFirstName();
	String lastName = employee.getLastName();
	String telephone = employee.getTelephone();
	String workstation = employee.getWorkstation();
	Float salary = employee.getSalary();
	String startDate = employee.getStartDate();
	String endDate = employee.getEndDate();
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
			content="Codo a Codo - Full Stack Java, Back-end, HTML, Java, MySQL, Práctica, Supermercado, Actualizar datos del empleado"
		/>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
			crossorigin="anonymous"
		/>
		<title>Supermercado - Actualizar Datos del Empleado</title>
	</head>
	<body class="min-vh-100 d-flex flex-column bg-secondary bg-opacity-50"> 
		<!-- ------------------------- Menú de Navegación -------------------------- -->
		<jsp:include page="../components/navbar.jsp">
  			<jsp:param name="activeOption" value="employeesManagement" />
		</jsp:include>

		<nav class="mx-2 mt-4">
  			<ul class="breadcrumb">
    			<li class="breadcrumb-item">Inicio</li>
    			<li class="breadcrumb-item" aria-current="page">Gestionar Empleados</li>
    			<li class="breadcrumb-item active" aria-current="page">Actualizar datos de un empleado</li>
  			</ul>
		</nav>

		<!-- ------------------------- Contenido Principal ------------------------- -->
		<main class="mb-4">
			<div class="container mx-auto my-5">
				<form class="row align-items-center justify-content-center needs-validation" method="post" action="/supermarket/employees/update?ID=<%= ID %>" novalidate>
					<div class="col-md-4 mt-3">
						<label class="form-label" for="validationCustom01">Nombre</label>
						<input id="validationCustom01" class="form-control" type="text" name="firstName" value="<%= firstName %>" placeholder="Ingrese el nombre..." required>
						<div class="invalid-feedback">Ingrese un nombre.</div>
					</div>
					<div class="col-md-4 mt-3">
						<label for="validationCustom02" class="form-label">Apellido</label>
						<input id="validationCustom02" class="form-control" type="text" name="lastName" value="<%= lastName %>" placeholder="Ingrese el apellido..." required>
						<div class="invalid-feedback">Ingrese un apellido.</div>
					</div>
					<div class="col-md-4 mt-3">
						<label for="validationCustom03" class="form-label">Teléfono</label>
						<input id="validationCustom03" class="form-control" type="tel" name="telephone" value="<%= telephone %>" placeholder="Ingrese el telefono..." required>
						<div class="invalid-feedback">Ingrese un teléfono.</div>
					</div>
					<div class="row row-cols-3 mt-3 p-0 justify-content-center">
						<div class="col-md-4">
							<label class="form-label" for="validationCustom04">Puesto de Trabajo</label>
							<select id="validationCustom04" class="form-select" name="workstation" value="<%= workstation %>" required>
								<option selected="" disabled="" value="">Selecciona...</option>
								<option value="Cajero/a" <% if (workstation.equalsIgnoreCase("Cajero/a")) { %> selected <% }; %>>Cajero/a</option>
								<option value="Gerente/a" <% if (workstation.equalsIgnoreCase("Gerente/a")) { %> selected <% }; %>>Gerente/a</option>
								<option value="Reponedor/a" <% if (workstation.equalsIgnoreCase("Reponedor/a")) { %> selected <% }; %>>Reponedor/a</option>
								<option value="Empleado/a de ventas" <% if (workstation.equalsIgnoreCase("Empleado/a de ventas")) { %> selected <% }; %>>Empleado/a de ventas</option>
								<option value="Empleado/a de limpieza" <% if (workstation.equalsIgnoreCase("Empleado/a de limpieza")) { %> selected <% }; %>>Empleado/a de limpieza</option>
								<option value="Empleado/a de envasado" <% if (workstation.equalsIgnoreCase("Empleado/a de envasado")) { %> selected <% }; %>>Empleado/a de envasado</option>
								<option value="Empleado/a de inventario" <% if (workstation.equalsIgnoreCase("Empleado/a de inventario")) { %> selected <% }; %>>Empleado/a de inventario</option>
								<option value="Otro">Otro</option>
							</select>
							<div class="invalid-feedback">Seleccione un puesto válido.</div>
						</div>
						<div class="col-md-4">
							<label class="form-label" for="validationCustom05">Salario</label>
							<div class="input-group mb-3">
								<span class="input-group-text">$</span>
								<input id="validationCustom05" class="form-control rounded-end" type="number" step="0.01" min="0" name="salary" value="<%= salary %>" placeholder="Ingrese el salario..." required>
								<div class="invalid-feedback">Ingrese un salario.</div>
							</div>
						</div>
						<div class="col-md-2">
							<label class="form-label" for="validationCustom06">Fecha de Inicio</label>
							<input id="validationCustom06" class="form-control actualDate" type="date" name="startDate" value="<%= startDate %>" required>
							<div class="invalid-feedback">Ingrese una fecha.</div>
						</div>
						<div class="col-md-2">
							<label class="form-label" for="validationCustom07">Fecha de Finalización</label>
							<input id="validationCustom07" class="form-control" type="date" name="endDate" value="<%= endDate %>">
							<div class="invalid-feedback">Ingrese una fecha.</div>
						</div>
					</div>
					<div class="row row-cols-3 mt-3 justify-content-center">
						<button class="btn btn-info mx-4 w-50 d-flex align-items-center justify-content-center gap-1" type="submit">
							<svg class="bi bi-pen" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
  								<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"/>
							</svg>
							<span>Actualizar Datos</span>
						</button>
					</div>
					<p class="mt-2 text-muted text-center">
						Note que al ingresar una fecha de finalización dicho empleado sera considerado como 'inactivo'.
					</p>
				</form>
			</div>
		</main>

		<!-- ---------------------------- Pie de Página ---------------------------- -->
		<jsp:include page="../components/footer.jsp" />
	</body>
	<!-- ----------------------------- JavaScript ------------------------------ -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"
	></script>
	
	<script src="../JS/validateForm.js" type="text/javascript"></script>
	<script src="../JS/tooltip.js" type="text/javascript"></script>
</html>
