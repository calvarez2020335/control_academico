/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.controllers;

import com.equipotres.models.dao.InstructorDaoImpl;
import com.equipotres.models.domain.Instructor;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author carlos
 */
@WebServlet("/ServletInstructor")
public class ServletInstructor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        System.out.println("\nDoPost");
        String accion = request.getParameter("accion");

        System.out.println("Accion:" + accion);
        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarInstructor(request, response);
                    break;
                case "actualizar":
                    actualizarInstructor(request, response);
                    break;
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "listar":
                    listarInstructor(request, response);
                    break;
                case "editar":
                    editarInstructor(request, response);
                    break;
                case "eliminar":
                    eliminarInstructor(request, response);
                    break;
            }
        }
    }

    private void listarInstructor(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Instructor> listaInstructor = new InstructorDaoImpl().listar();

        HttpSession sesion = request.getSession();
        sesion.setAttribute("listadoInstructores", listaInstructor);

        response.sendRedirect("instructor/lista-instructor.jsp");

    }

    private void eliminarInstructor(HttpServletRequest resquest, HttpServletResponse response) throws IOException, ServletException{
        System.out.println("\nEliminar");
        int instructor_id = Integer.parseInt(resquest.getParameter("instructor_id"));

        Instructor instructor = new Instructor(instructor_id);

        int registroEliminados = new InstructorDaoImpl().Eliminar(instructor);

        System.out.println("Cantidad de registros eliminados" + registroEliminados);

        listarInstructor(resquest, response);

    }

    private void insertarInstructor(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("\nInsertar");

        String apellidos = request.getParameter("apellido");
        String nombres = request.getParameter("nombre");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");

        Instructor instructor = new Instructor(apellidos, nombres, direccion, telefono);
        System.out.println(instructor);

        int registrosIngresados = new InstructorDaoImpl().Insertar(instructor);

        System.out.println("Registros insertados" + registrosIngresados);

        listarInstructor(request, response);
    }

    private void editarInstructor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int instructor_id = Integer.parseInt(request.getParameter("instructor_id"));

        Instructor instructor = new InstructorDaoImpl().encontrar(new Instructor(instructor_id));

        request.setAttribute("instructor", instructor);
        request.getRequestDispatcher("instructor/editar-instructor.jsp").forward(request, response);

    }

    private void actualizarInstructor(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        int instructor_id = Integer.parseInt(request.getParameter("instructor_id"));

        String apellidos = request.getParameter("apellido");
        String nombres = request.getParameter("nombre");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");

        Instructor instructor = new Instructor(instructor_id, apellidos, nombres, direccion, telefono);
        System.out.println(instructor);

        int registroAct = new InstructorDaoImpl().Actualizar(instructor);

        listarInstructor(request, response);
    }
}
