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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Carlos Adolfo Alvarez Crúz
 * @date 2/09/2021
 * @time 08:33:37 AM Codigo tecnico: IN5BV
 */
@WebServlet("/ServletAlumno")
public class ServletAlumno extends HttpServlet {

    //Crear este metodo para tener una conexion mas segura, importante ponerle el UTF-E, ya que con este metodo acepta tildes
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");

        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarAlumno(request, response);
                    break;
                case "actualizar":
                    actualizarAlumno(request, response);
                    break;
            }
        }
    }
    
    private void actualizarAlumno(HttpServletRequest request, HttpServletResponse response) throws IOException{
        
        String Carne = request.getParameter("carne");
        String Apellidos = request.getParameter("apellidos");
        String Nombres = request.getParameter("nombres");
        String Email = request.getParameter("email");
        
        Alumno alumno = new Alumno(Carne, Apellidos, Nombres, Email);
        
        int registrosActualizados = new AlumnoDaoImpl().actualizar(alumno);
        
        listarAlumno(request, response);
        
    }

    //Creamos el metodo insertar, aqui es donde mandamos a llamar los objetos del IDAO, y por ultimo volvemos a llamar al metodo listar para que nos regrese a la pagina, ya que los valores ingresados
    private void insertarAlumno(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        String Carne = request.getParameter("carne");
        String Apellidos = request.getParameter("apellidos");
        String Nombres = request.getParameter("nombres");
        String Email = request.getParameter("email");
        
        Alumno alumno = new Alumno(Carne, Apellidos, Nombres, Email);
        
        int registroIngresados = new AlumnoDaoImpl().insertar(alumno);
        
        listarAlumno(request, response);
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "listar":
                    listarAlumno(request, response);
                    break;
                case "editar":
                    editarAlumno(request, response);
                    break;
                case "eliminar":
                    eliminarAlumno(request, response);
            }
        }

    }

    private void editarAlumno(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        
        //Recuperar el Carne del Alumno
        String carne = request.getParameter("carne");
        
        //Crear objeto de tipo Alumno
        Alumno alumno = new AlumnoDaoImpl().encontrar(new Alumno(carne));
        
        request.setAttribute("alumno", alumno);
        
        request.getRequestDispatcher("alumno/editr-alumno.jsp").forward(request, response);
        
        
    }
    
    private void eliminarAlumno(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String carne = request.getParameter("carne");

        Alumno alumno = new Alumno(carne);

        int registroEliminado = new AlumnoDaoImpl().eliminar(alumno);

        listarAlumno(request, response);

    }

    private void listarAlumno(HttpServletRequest request, HttpServletResponse response) throws IOException {

        List<Alumno> listarAlumno = new AlumnoDaoImpl().listar();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("listaAlumno", listarAlumno);
        response.sendRedirect("alumno/listar-alumno.jsp");

    }

}
