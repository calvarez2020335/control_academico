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

/**
 *
 * @author Josué Daniel Marroquín Hernández <jmarroquin-2020296@kinal.edu.gt>
 * @date 01-sep-2021
 * @time 11:24:26 Codigo Tecnico: IN5BV Carnet: 2020296
 */
@WebServlet("/ServletAsigAlumno")
public class ServletAsigAlumno extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "listar":
                    listarAsigAlumno(request, response);
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
        String asigancionId = (request.getParameter("asigancionId"));

        //Crear objeto tipo Asiganacion Alumno
        AsignacionAlumno asigAlumno = new AsignacionAlumno(asigancionId);

        int registroEliminados = new AsigAlumnoDaoImpl().eliminar(asigAlumno);
        System.out.println("Cantidad de registros eliminados: " + registroEliminados);

        //Llamar al Metodo Listar Asigancion Alumno
        listarAsigAlumno(request, response);
    }

}
