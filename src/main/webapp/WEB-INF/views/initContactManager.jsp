<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contactos</title>
<style>
* {
	text-align: center;
}

#FormContainer {
	display: flex;
	justify-content: center;
	margin: 30px 30px 30px 30px;
}

#frmAcciones {
	text-align: center;
}
</style>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
</head>

<body>

	<div id="FormContainer">
		<form:form id="frmAcciones" modelAttribute="Contact"
			class="form-inline">
			<legend>Contactos</legend>
			<div class="input-group flex-nowrap" id="inputOne">
				<span class="input-group-text" id="addon-wrapping">Nombre</span> <input
					type="text" class="form-control" id="idNombre" name="nombre" />
			</div>
			<div class="input-group flex-nowrap" id="inputTwo">
				<span class="input-group-text" id="addon-wrapping">Apellido
					P.</span> <input type="text" class="form-control" id="idApellidoPaterno"
					name="apellidoPaterno" />
			</div>
			<div class="input-group flex-nowrap">
				<span class="input-group-text" id="addon-wrapping">Apellido
					M.</span> <input type="text" class="form-control" id="idApellidoMaterno"
					name="apellidoMaterno" />
			</div>
			<div class="input-group flex-nowrap">
				<span class="input-group-text" id="addon-wrapping">Direccion</span>
				<input type="text" class="form-control" id="idDireccion"
					name="direccion" width="100%" />
			</div>
			<div class="input-group flex-nowrap">
				<span class="input-group-text" id="addon-wrapping">Telefono</span> <input
					type="text" class="form-control" id="idTelefono" name="telefono" />
			</div>
			<input type="button" class="btn btn-success" value="Agregar"
				onclick="submitFormAction('initContactManager', 'post')" />
			<input type="button" class="btn btn-danger" value="Eliminar"
				onclick="deleteRow()" />
		</form:form>
	</div>

	<h3>Lista de Contactos</h3>
	<div>
		<table class="table table-dark table-striped">
			<tr>
				<th></th>
				<th>Id</th>
				<th>Nombre</th>
				<th>Apellido Paterno</th>
				<th>Apellido Materno</th>
				<th>Dirección</th>
				<th>Teléfono</th>
			</tr>
			<tbody>
				<c:forEach items="${listaContacto}" var="contact">
					<tr>
						<td><input type="radio" id="select${contact.idPersona }"
							name="id" onclick="setIdSelect(${contact.idPersona})"></td>
						<td>${contact.idPersona}</td>
						<td>${contact.nombre}</td>
						<td>${contact.apellidoPaterno}</td>
						<td>${contact.apellidoMaterno}</td>
						<td>${contact.direccion}</td>
						<td>${contact.telefono}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>

	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>

	<!--Js para formulario-->
	<script>
		var idSelect = 0;

		function submitFormAction(action, method) {
			document.getElementById('frmAcciones').action = action;
			document.getElementById('frmAcciones').method = method;
			document.getElementById('frmAcciones').submit();
		}

		function setIdSelect(id) {
			idSelect = id;
		}
		function deleteRow() {
			window.location.href = `http://www.localhost:8080/eliminarContacto/?id=`+ idSelect;
		}
	</script>
</body>

</html>