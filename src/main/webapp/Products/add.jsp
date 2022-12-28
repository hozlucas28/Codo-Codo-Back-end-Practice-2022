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
			content="Codo a Codo - Full Stack Java, Back-end, HTML, Java, MySQL, Práctica, Supermercado, Añadir producto"
		/>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
			crossorigin="anonymous"
		/>
		<title>Supermercado - Añadir Producto</title>
	</head>
	<body class="min-vh-100 d-flex flex-column bg-secondary bg-opacity-50">
		<!-- ------------------------- Menú de Navegación -------------------------- -->
		<jsp:include page="../components/navbar.jsp">
  			<jsp:param name="activeOption" value="productsManagement" />
		</jsp:include>

		<nav class="mx-2 mt-4">
  			<ul class="breadcrumb">
    			<li class="breadcrumb-item">Inicio</li>
    			<li class="breadcrumb-item" aria-current="page">Gestionar Productos</li>
    			<li class="breadcrumb-item active" aria-current="page">Añadir un producto</li>
  			</ul>
		</nav>

		<!-- ------------------------- Contenido Principal ------------------------- -->
		<main class="mb-4">
			<div class="container mx-auto my-5">
				<form class="row align-items-center justify-content-center needs-validation" method="post" action="<%= request.getContextPath() %>/products/add" novalidate>
					<div class="col-md-4 mt-3">
						<label class="form-label" for="validationCustom01">Nombre</label>
						<input id="validationCustom01" class="form-control" type="text" name="name" placeholder="Ingrese el nombre..." required />
						<div class="invalid-feedback">Ingrese un nombre.</div>
					</div>
					<div class="col-md-4 mt-3">
						<label for="validationCustom02" class="form-label">Marca</label>
						<input id="validationCustom02" class="form-control" type="text" name="brand" placeholder="Ingrese la marca..." required />
						<div class="invalid-feedback">Ingrese una marca.</div>
					</div>
					<div class="col-md-4 mt-3">
						<label class="form-label" for="validationCustom03">Precio Unitario</label>
						<div class="input-group">
							<span class="input-group-text">$</span>
							<input id="validationCustom03" class="form-control rounded-end" type="number" step="0.01" min="0" name="price" placeholder="Ingrese el precio..." required />
							<div class="invalid-feedback">Ingrese un precio unitario.</div>
						</div>
					</div>
					<div class="row row-cols-3 mt-3 p-0 justify-content-between">
						<div class="col-md-4">
							<label class="form-label" for="validationCustom04">Stock</label>
							<div class="input-group mb-3">
								<input id="validationCustom04" class="form-control rounded-end" type="number" step="1" min="0" name="stock" placeholder="Ingrese el stock..." required />
								<div class="invalid-feedback">Ingrese un stock.</div>
							</div>
						</div>
						<div class="col-md-4">
							<label class="form-label" for="validationCustom05">Fecha de Ingreso</label>
							<input id="validationCustom05" class="form-control actualDate" type="date" name="entryDate" required />
							<div class="invalid-feedback">Ingrese una fecha.</div>
						</div>
						<div class="col-md-4">
							<label class="form-label" for="validationCustom06">Fecha de Expiración</label>
							<input id="validationCustom06" class="form-control" type="date" name="expireDate" />
							<div class="invalid-feedback">Ingrese una fecha.</div>
						</div>
					</div>
					<div class="row row-cols-3 mt-3 justify-content-center">
						<button class="btn btn-success mx-4 w-50 d-flex align-items-center justify-content-center gap-1" type="submit">
							<svg class="bi bi-cart-plus-fill" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
	  							<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM9 5.5V7h1.5a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0V8H6.5a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 1 0z"/>
							</svg>
							<span>Añadir Producto</span>
						</button>
					</div>
					<p class="mt-2 text-muted text-center">
						Note que es necesario completar todos los campos para que se añada el producto, exceptuando la fecha de expiración que es opcional.
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
	<script src="../JS/actualDate.js" type="text/javascript"></script>
</html>
