/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.controllers;


import com.equipotres.models.dao.InstructorDaoImpl;
import com.equipotres.models.domain.Instructor;
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
 * @author carlos
 */
@WebServlet("/ServletInstructor")
public class ServletInstructor extends  HttpServlet{

      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
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
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        System.out.println("/ndoPost");

        String accion = request.getParameter("accion");

        if (accion != null) {

            switch (accion) {
                case "insertar":

                    actualizarInstructor(request, response);
                    break;
                case "actualizar":
                    actualizarInstructor(request, response);
                    break;
                case "editar":
                    actualizarInstructor(request, response);

                    break;
            }

        }
    }
    
private void listarInstructor(HttpServletRequest request,HttpServletResponse response) throws IOException{
    List<Instructor> listaInstructor = new InstructorDaoImpl().listar();

    HttpSession sesion = request.getSession();
    sesion.setAttribute("listadoInstructores", listaInstructor);
    
    response.sendRedirect("instructor/listaInstructor.jsp");

 }

private void eliminarInstructor (HttpServletRequest resquest, HttpServletResponse response) throws IOException{

    int instructor_id = Integer.parseInt(resquest.getParameter("instructor_id"));
    Instructor instructor = new Instructor(instructor_id);
    int registroEliminados = new InstructorDaoImpl().Eliminar(instructor);
    
    System.out.println("Cantidad de registros eliminados" + registroEliminados);
   
    listarInstructor(resquest, response);
    
  }

private void actualizarInstructor(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int instructor_id = Integer.parseInt(request.getParameter("instructor_id"));

        String apellidos = request.getParameter("apellidos");
        String nombres = request.getParameter("nombres");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");

        Instructor instructor = new Instructor(instructor_id, apellidos, nombres, direccion, telefono);
        System.out.println(instructor);

        int registrosModificados = new InstructorDaoImpl().Actualizar(instructor);
        listarInstructor(request, response);

    }
    
private void editarInstructor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int instructor_id = Integer.parseInt(request.getParameter("instructor_id"));
        Instructor instructor = new InstructorDaoImpl().encontrar(new Instructor(instructor_id));
        System.out.println(instructor);
        request.setAttribute("instructor", instructor);
        request.getRequestDispatcher("Instructor/editar-instructor.jsp").forward(request, response);

    }

}