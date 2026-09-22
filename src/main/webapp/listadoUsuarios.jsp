<%@ page import="java.util.List" %>
<%@ page import="com.sena.sistemagestion.model.Usuario" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de usuarios</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<main class="contenedor">
    <section class="tarjeta tarjeta-ancha">
        <div class="encabezado-tabla">
            <div>
                <h1>Usuarios registrados</h1>
                <p class="subtitulo">Consulta los usuarios almacenados en la sesión de la aplicación.</p>
            </div>
            <a class="boton-secundario" href="${pageContext.request.contextPath}/index.jsp">Nuevo usuario</a>
        </div>

        <% if (usuarios == null || usuarios.isEmpty()) { %>
            <p class="vacio">Todavía no hay usuarios registrados.</p>
        <% } else { %>
            <div class="tabla-contenedor">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Rol</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (Usuario usuario : usuarios) { %>
                    <tr>
                        <td><%= usuario.getId() %></td>
                        <td><%= usuario.getNombre() %></td>
                        <td><%= usuario.getCorreo() %></td>
                        <td><span class="etiqueta"><%= usuario.getRol() %></span></td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        <% } %>
    </section>
</main>
</body>
</html>
