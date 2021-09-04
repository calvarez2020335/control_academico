/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.equipotres.controllers;

import com.equipotres.models.dao.AlumnoDaoImpl;
import com.equipotres.models.domain.Alumno;
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
 * @date 2/09/2021
 * @time 08:33:37 AM
 * Codigo tecnico: IN5BV
 */
@WebServlet("/ServletAlumno")
public class ServletAlumno extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        String accion = request.getParameter("accion");
        
        if(accion != null){
            switch(accion){
                case "listar":
                    listarAlumno(request, response);
                    break;
                case "editar":
                    break;
                case "eliminar":
                    eliminarAlumno(request, response);
            }
        }
     
    }
    
    private void eliminarAlumno(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String carne = request.getParameter("carne");
        
        Alumno alumno = new Alumno(carne);
        
        int registroEliminado = new AlumnoDaoImpl().eliminar(alumno);
        
        listarAlumno(request, response);
                
    }
    
    private void listarAlumno(HttpServletRequest request, HttpServletResponse response) throws IOException{
        
        List<Alumno> listarAlumno = new AlumnoDaoImpl().listar();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("listaAlumno", listarAlumno);
        response.sendRedirect("alumno/listarAlumno.jsp");
        
    }
    
}
