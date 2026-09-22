package com.sena.sistemagestion.servlet;

import com.sena.sistemagestion.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * Servlet para registrar y listar usuarios.
 */
@WebServlet("/usuarios")
public class UsuarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final List<Usuario> USUARIOS = new CopyOnWriteArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("usuarios", USUARIOS);
        request.getRequestDispatcher("/listadoUsuarios.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        request.setCharacterEncoding("UTF-8");

        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String rol = request.getParameter("rol");
        String idTexto = request.getParameter("id");

        try {
            int id = Integer.parseInt(idTexto);
            if (id <= 0 || estaVacio(nombre) || estaVacio(correo) || estaVacio(rol)) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                        "Todos los campos son obligatorios y el ID debe ser positivo.");
                return;
            }

            USUARIOS.add(new Usuario(id, nombre.trim(), correo.trim(), rol.trim()));
            response.sendRedirect(request.getContextPath() + "/usuarios");
        } catch (NumberFormatException ex) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El ID debe ser un número válido.");
        }
    }

    private boolean estaVacio(String valor) {
        return valor == null || valor.trim().isEmpty();
    }
}
