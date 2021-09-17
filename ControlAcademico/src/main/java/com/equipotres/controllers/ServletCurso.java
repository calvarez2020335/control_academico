/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.equipotres.controllers;

import com.equipotres.models.dao.CursoDaoImpl;
import com.equipotres.models.domain.Curso;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Carlos Adolfo Alvarez Crúz
 * @date 3/09/2021
 * @time 03:11:42 PM
 * Codigo tecnico: IN5BV
 */
@WebServlet("/ServletCurso")
public class ServletCurso extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        System.out.println("\nDoPost");
        String accion = request.getParameter("accion");
        System.out.println("Accion:" + accion);
        if (accion != null) {
            switch (accion) {
                case "insetar":
                    insertarCurso(request, response);
                    break;
                case "actualizar":
                    actualizarCurso(request, response);
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
                    listarCurso(request, response);
                    break;
                case "editar":
                    editarCurso(request, response);
                    break;
                case "eliminar":
                    eliminarCurso(request, response);
                    break;
            }
        }
    }
    
    private void listarCurso(HttpServletRequest request, HttpServletResponse response) throws IOException{
        List<Curso> listaCurso = new CursoDaoImpl().listar();
        
        HttpSession seccion = request.getSession();
        
        seccion.setAttribute("listaCurso", listaCurso);
        response.sendRedirect("curso/listar-curso.jsp");
        
    }
    
    private void eliminarCurso(HttpServletRequest request, HttpServletResponse response) throws IOException{
        
        int cursoId = Integer.parseInt(request.getParameter("curso_id"));
        
        Curso curso = new Curso(cursoId);
        
        int registroEliminados = new CursoDaoImpl().eliminar(curso);
        
        listarCurso(request, response);
        
    }
    
    private void editarCurso(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        
        System.out.println("\nEditando");
        
        int cursoId = Integer.parseInt(request.getParameter("curso_id"));
        
        Curso curso = new CursoDaoImpl().encontrar(new Curso(cursoId));
        
        request.setAttribute("curso", curso);
        request.getRequestDispatcher("curso/editar-curso.jsp").forward(request, response);
    }
    
    private void insertarCurso(HttpServletRequest request, HttpServletResponse response) throws IOException{
        System.out.println("\nInsertando");
        
        int ciclo = Integer.parseInt(request.getParameter("ciclo"));
        int cupoMaximo  = Integer.parseInt(request.getParameter("cupo_maximo"));
        int cupoMinimo  = Integer.parseInt(request.getParameter("cupo_minimo"));
        String descripcion = request.getParameter("descripcion");
        String codigoCarrera = request.getParameter("codigo_carrera");
        int horarioId  = Integer.parseInt(request.getParameter("horario_id"));
        int instructorId  = Integer.parseInt(request.getParameter("instructor_id"));
        int salonId  = Integer.parseInt(request.getParameter("salon_id"));
        
        Curso curso = new Curso(ciclo, cupoMaximo, cupoMinimo, descripcion, codigoCarrera, horarioId, instructorId, salonId);
        System.out.println(curso);
        
        int registroIngresados = new CursoDaoImpl().insertar(curso);
        
        System.out.println("Inserciones: " + registroIngresados);
        
        listarCurso(request, response);
    }
    
    private void actualizarCurso(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        System.out.println("\nActualizando");
        
        int cursoId = Integer.parseInt(request.getParameter("curso_id"));
        
        int ciclo = Integer.parseInt(request.getParameter("ciclo"));
        int cupoMaximo  = Integer.parseInt(request.getParameter("cupo_maximo"));
        int cupoMinimo  = Integer.parseInt(request.getParameter("cupo_minimo"));
        String descripcion = request.getParameter("descripcion");
        String codigoCarrera = request.getParameter("codigo_carrera");
        int horarioId  = Integer.parseInt(request.getParameter("horario_id"));
        int instructorId  = Integer.parseInt(request.getParameter("instructor_id"));
        int salonId  = Integer.parseInt(request.getParameter("salon_id"));
        
        Curso curso = new Curso(cursoId, ciclo, cupoMaximo, cupoMinimo, descripcion, codigoCarrera, horarioId, instructorId, salonId);
        System.out.println(curso);
        
        int registroActualizado = new CursoDaoImpl().actualizar(curso);
        
        System.out.println("Registros actualizados: " + registroActualizado);
        
        listarCurso(request, response);
    }
    
}
