<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Contactos</title>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>

<body>

	<form:form id="frmAcciones" modelAttribute="Contact">
		<div>
			<fieldset>
				<legend>Contactos</legend>
				<table class="form">
					<tr>
						<td>Nombre: </td>
						<td><input type="text" placeholder="Nombre" id="idNombre" name="nombre" /></td>
						<td>Apellido Paterno: </td>
						<td><input type="text" placeholder="Apellido paterno" id="idApellidoPaterno"
								name="apellidoPaterno" /></td>
						<td>Apellido Materno: </td>
						<td><input type="text" placeholder="Apellido Materno" id="idApellidoMaterno"
								name="apellidoMaterno" /></td>
					</tr>
					<tr>
						<td>Dirección: </td>
						<td colspan="3"><input type="text" placeholder="Direccion" id="idDireccion" name="direccion"
								width="100%" /></td>
						<td>Teléfono: </td>
						<td><input type="text" placeholder="Telefono" id="idTelefono" name="telefono" /></td>
					</tr>
					<tr>
						<td colspan="6">
							<input type="button" value="Agregar"
								onclick="submitFormAction('initContactManager', 'post')" />
							<input type="button" value="Eliminar" onclick="deleteRow()" />
						</td>
					</tr>
				</table>

			</fieldset>
		</div>
	</form:form>


	<h1>Lista de contactos</h1>
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
						<td><input type="radio" id="select${contact.idPersona }" name="id"
								onclick="setIdSelect(${contact.idPersona})"></td>
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
	</fieldset>
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
			window.location.href = `http://www.localhost:8080/eliminarContacto/?id=` + idSelect;
		}
	</script>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>

</html>