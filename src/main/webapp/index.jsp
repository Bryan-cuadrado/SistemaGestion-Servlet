<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar usuario</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<main class="contenedor">
    <section class="tarjeta">
        <h1>Registrar usuario</h1>
        <p class="subtitulo">Completa los datos para agregar un nuevo usuario.</p>

        <form action="${pageContext.request.contextPath}/usuarios" method="post" class="formulario">
            <label for="id">ID</label>
            <input type="number" id="id" name="id" min="1" required>

            <label for="nombre">Nombre completo</label>
            <input type="text" id="nombre" name="nombre" maxlength="100" required>

            <label for="correo">Correo electrónico</label>
            <input type="email" id="correo" name="correo" maxlength="150" required>

            <label for="rol">Rol</label>
            <select id="rol" name="rol" required>
                <option value="">Selecciona un rol</option>
                <option value="Administrador">Administrador</option>
                <option value="Usuario">Usuario</option>
                <option value="Invitado">Invitado</option>
            </select>

            <button type="submit">Guardar usuario</button>
        </form>

        <a class="enlace" href="${pageContext.request.contextPath}/usuarios">Ver usuarios registrados</a>
    </section>
</main>
</body>
</html>
