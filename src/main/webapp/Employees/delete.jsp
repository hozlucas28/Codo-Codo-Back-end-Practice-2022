<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String showToast = (String)request.getAttribute("showToast");
	String toastColor = (String)request.getAttribute("toastColor");
	String toastHeader = (String)request.getAttribute("toastHeader");
	String toastMessage = (String)request.getAttribute("toastMessage");
	String toastCustomIcon = (String)request.getAttribute("toastCustomIcon"); 
	
	showToast = (showToast == null) ? "false" : showToast;
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
			content="Codo a Codo - Full Stack Java, Back-end, HTML, Java, MySQL, Práctica, Supermercado, Eliminar empleado"
		/>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
			crossorigin="anonymous"
		/>
		<title>Supermercado - Eliminar Empleado</title>
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
    			<li class="breadcrumb-item active" aria-current="page">Eliminar un empleado</li>
  			</ul>
		</nav>

		<!-- ------------------------- Contenido Principal ------------------------- -->
		<main class="mx-100 my-auto">
			<div class="d-flex align-items-center justify-content-center gap-5">
				<form class="card mx-2 align-items-stretch text-bg-light border-dark needs-validation" method="POST" action="<%= request.getContextPath() %>/employees/delete" style="width: 18rem;" novalidate>
					<h5 class="card-header text-center">Eliminar Empleado</h5>
					<div class="card-body">
						<label class="form-label" for="validationCustom01">Ingrese el ID</label>
						<input id="validationCustom01" class="form-control text-center text-success fw-semibold" type="number" name="ID" placeholder="..." required />
						<div class="invalid-feedback">Seleccione un ID válido.</div>
						<div class="row row-cols-3 mt-3 justify-content-center">
							<button class="btn btn-sm btn-danger w-50 d-flex align-items-center justify-content-center gap-1 text-center" type="submit">
								<svg class="bi bi-person-x-fill" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
  									<path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6.146-2.854a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z"/>
								</svg>
								<span>ELIMINAR</span>
							</button>
						</div>
					</div>
				</form>
			</div>
			<p class="mx-4 mt-2 text-center text-muted">
				Podrá observar el ID del empleado en la tabla de empleados.
			</p>
		</main>
		
		<!-- -------------------------------- Toast -------------------------------- -->
		<%
			if (showToast.equalsIgnoreCase("true")) {
		%>
				<jsp:include page="../components/toast.jsp">
					<jsp:param name="color" value="<%= toastColor %>" />
					<jsp:param name="header" value="<%= toastHeader %>" />
					<jsp:param name="message" value="<%= toastMessage %>" />
					<jsp:param name="customIcon" value="<%= toastCustomIcon %>" />
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
