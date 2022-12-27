<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
			content="Codo a Codo - Full Stack Java, Back-end, HTML, Java, MySQL, Práctica, Supermercado, Añadir empleado"
		/>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
			crossorigin="anonymous"
		/>
		<title>Supermercado - Añadir Empleado</title>
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
    			<li class="breadcrumb-item active" aria-current="page">Añadir un empleado</li>
  			</ul>
		</nav>

		<!-- ------------------------- Contenido Principal ------------------------- -->
		<main class="mb-4">
			<div class="container mx-auto my-5">
				<form class="row align-items-center justify-content-center needs-validation" method="post" action="<%= request.getContextPath() %>/employees/add" novalidate>
					<div class="col-md-4 mt-3">
						<label class="form-label" for="validationCustom01">Nombre</label>
						<input id="validationCustom01" class="form-control" type="text" name="firstName" placeholder="Ingrese el nombre..." required />
						<div class="invalid-feedback">Ingrese un nombre.</div>
					</div>
					<div class="col-md-4 mt-3">
						<label for="validationCustom02" class="form-label">Apellido</label>
						<input id="validationCustom02" class="form-control" type="text" name="lastName" placeholder="Ingrese el apellido..." required />
						<div class="invalid-feedback">Ingrese un apellido.</div>
					</div>
					<div class="col-md-4 mt-3">
						<label for="validationCustom03" class="form-label">Teléfono</label>
						<input id="validationCustom03" class="form-control" type="number" name="telephone" placeholder="Ingrese el telefono..." required />
						<div class="invalid-feedback">Ingrese un teléfono.</div>
					</div>
					<div class="row row-cols-3 mt-3 p-0 justify-content-between">
						<div class="col-md-4">
							<label class="form-label" for="validationCustom04">Puesto de Trabajo</label>
							<select id="validationCustom04" class="form-select" name="workstation" required>
								<option selected disabled value="">Selecciona...</option>
								<option value="Cajero/a">Cajero/a</option>
								<option value="Gerente/a">Gerente/a</option>
								<option value="Reponedor/a">Reponedor/a</option>
								<option value="Empleado/a de ventas">Empleado/a de ventas</option>
								<option value="Empleado/a de limpieza">Empleado/a de limpieza</option>
								<option value="Empleado/a de envasado">Empleado/a de envasado</option>
								<option value="Empleado/a de inventario">Empleado/a de inventario</option>
								<option value="Otro">Otro</option>
							</select>
							<div class="invalid-feedback">Seleccione un puesto válido.</div>
						</div>
					<div class="col-md-4">
						<label class="form-label" for="validationCustom05">Salario</label>
						<div class="input-group mb-3">
							<span class="input-group-text">$</span>
							<input id="validationCustom05" class="form-control" type="number" name="salary" placeholder="Ingrese el salario..." required />
							<div class="invalid-feedback">Ingrese un salario.</div>
						</div>
					</div>
					<div class="col-md-4">
						<label class="form-label" for="validationCustom04">Fecha de Inicio</label>
						<input id="validationCustom04" class="form-control" type="date" name="startDate" required />
						<div class="invalid-feedback">Ingrese una fecha.</div>
					</div>
					</div>
					<div class="row row-cols-3 mt-3 justify-content-center">
						<button class="btn btn-success mx-4 w-50 d-flex align-items-center justify-content-center gap-1" type="submit">
							<svg class="bi bi-person-plus-fill" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
  								<path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
  								<path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
							</svg>
							<span>Añadir Empleado</span>
						</button>
					</div>
					<p class="mt-2 text-muted text-center">
						Note que es necesario completar todos los campos para que se añada al empleado.
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
</html>
