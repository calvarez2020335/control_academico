/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.controllers;

import com.equipotres.models.dao.AsigAlumnoDaoImpl;
import com.equipotres.models.domain.AsignacionAlumno;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import java.util.List;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;

/**
 *
 * @author Josué Daniel Marroquín Hernández <jmarroquin-2020296@kinal.edu.gt>
 * @date 01-sep-2021
 * @time 11:24:26 Codigo Tecnico: IN5BV Carnet: 2020296
 */
@WebServlet("/ServletAsigAlumno")
public class ServletAsigAlumno extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("\nDoPost");
        String accion = request.getParameter("accion");
        System.out.println("Accion:" + accion);
        if (accion != null) {
            switch (accion) {
                case "insetar":
                    insetarAsigAlumno(request, response);
                    break;
                case "actualizar":
                    actualizarAsigAlumno(request, response);
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
                    listarAsigAlumno(request, response);
                    break;
                case "editar":
                    editarAsigAlumno(request, response);
                    break;
                case "eliminar":
                    eliminarAsigAlumno(request, response);
                    break;
            }
        }
    }

    private void listarAsigAlumno(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<AsignacionAlumno> listaAsigAlumno = new AsigAlumnoDaoImpl().listar();

        HttpSession seccion = request.getSession();

        seccion.setAttribute("listaAsigAlumnos", listaAsigAlumno);
        response.sendRedirect("asignacionAlumno/asigancion-alumno.jsp");

    }

    private void eliminarAsigAlumno(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //Recuperar Id Asigancion Alumno eliminado
        String asigancionId = request.getParameter("asigancionId");

        //Crear objeto tipo Asiganacion Alumno
        AsignacionAlumno asigAlumno = new AsignacionAlumno(asigancionId);

        int registroEliminados = new AsigAlumnoDaoImpl().eliminar(asigAlumno);
        System.out.println("Cantidad de registros eliminados: " + registroEliminados);

        //Llamar al Metodo Listar Asigancion Alumno
        listarAsigAlumno(request, response);
    }

    private void editarAsigAlumno(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("\nEditar");
        //Recuperar Id Estudiante Editado
        String asigancionId = request.getParameter("asigancionId");

        /*Crear Objeto Estudiante*/
        AsignacionAlumno asigAlumno = new AsigAlumnoDaoImpl().encontrar(new AsignacionAlumno(asigancionId));

        request.setAttribute("asigAlumno", asigAlumno);
        request.getRequestDispatcher("asignacionAlumno/editar-asignacion-alumno.jsp").forward(request, response);
    }

    private void insetarAsigAlumno(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("\nInsertar");

        //Ingresar Datos
        String asignacionId = request.getParameter("asigancion");
        String carne = request.getParameter("carne");
        int cursoId = Integer.parseInt(request.getParameter("curso"));
        Timestamp fechaAsignacion = Timestamp.valueOf(request.getParameter("fecha"));

        //Crear el Objeto Asiganacion Alumno utilizando el Bean
        AsignacionAlumno asigAlumno = new AsignacionAlumno(asignacionId, carne, cursoId, fechaAsignacion);
        System.out.println(asigAlumno);

        /*Ingresar el Nuevo Registro en la Base de Datos*/
        int registrosIngresados = new AsigAlumnoDaoImpl().insertar(asigAlumno);

        //Imprimir Datos en Consola
        System.out.println("registors insertados" + registrosIngresados);

        //Llamar al Metodo Listar Asigancion Alumno
        listarAsigAlumno(request, response);
    }

    private void actualizarAsigAlumno(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("\nActualizar");
        //Recuperar Id Estudiante Editado
        String asigancionId = request.getParameter("asigancionId");

        //Actualizar Datos
        String carne = request.getParameter("carne");
        int cursoId = Integer.parseInt(request.getParameter("curso"));
        Timestamp fechaAsignacion = Timestamp.valueOf(request.getParameter("fecha"));

        //Crear el Objeto Asiganacion Alumno utilizando el Bean
        AsignacionAlumno asigAlumno = new AsignacionAlumno(asigancionId, carne, cursoId, fechaAsignacion);
        System.out.println(asigAlumno);
        
        //Ingresar el Registro Actualizado en la Base de Datos
        int registrosIngresados = new AsigAlumnoDaoImpl().actualizar(asigAlumno);
        
        //Imprimir Datos en Consola
        System.out.println("registors actualizados" + registrosIngresados);
        
        //Llamar al Metodo Listar Asigancion Alumno
        listarAsigAlumno(request, response);
    }
}
