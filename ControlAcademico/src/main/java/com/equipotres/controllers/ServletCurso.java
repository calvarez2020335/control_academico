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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "listar":
                    listarCurso(request, response);
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
        response.sendRedirect("curso/listarCurso.jsp");
        
    }
    
    private void eliminarCurso(HttpServletRequest request, HttpServletResponse response) throws IOException{
        
        int cursoId = Integer.parseInt(request.getParameter("curso_id"));
        
        Curso curso = new Curso(cursoId);
        
        int registroEliminados = new CursoDaoImpl().eliminar(curso);
        
        listarCurso(request, response);
        
    }
    
}
