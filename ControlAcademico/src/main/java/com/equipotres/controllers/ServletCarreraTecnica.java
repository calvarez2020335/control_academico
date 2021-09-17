/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.controllers;

import com.equipotres.models.dao.CarreraTecnicaDaoImpl;
import com.equipotres.models.domain.CarreraTecnica;
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
 * @author esteb
 */
@WebServlet("/ServletCarreraTecnica")
public class ServletCarreraTecnica extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");

        System.out.println("\ndoPost");

        String accion = request.getParameter("accion");

        System.out.println("accion: " + accion);
        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarCarreraTecnica(request, response);
                    break;
                case "actualizar":
                    actualizarCarreraTecnica(request, response);

                    break;
            }
        }

    }
    
        private void actualizarCarreraTecnica(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String codigoCarrera = request.getParameter("codigoCarrera");
        String nombre = request.getParameter("nombre");

                    
        CarreraTecnica carreraTecnica = new CarreraTecnica(codigoCarrera, nombre);
        System.out.println(carreraTecnica);
        
        int CarreraActualizada = new CarreraTecnicaDaoImpl().actualizar(carreraTecnica);
        System.out.println("salon actualizado" + CarreraActualizada);
        listarCarreraTecnica(request, response);
        
    }

    private void insertarCarreraTecnica(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String codigoCarrera = request.getParameter("codigoCarrera");
        String nombre = request.getParameter("nombre");

        CarreraTecnica carreraTecnica = new CarreraTecnica(codigoCarrera, nombre);
        System.out.println(carreraTecnica);

        int carrerasTecnicasRegistradas = new CarreraTecnicaDaoImpl().insertar(carreraTecnica);

        System.out.println("carreras registradas" + carrerasTecnicasRegistradas);

        listarCarreraTecnica(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String accion = request.getParameter("accion");

        if (accion != null) {

            switch (accion) {
                case "listar":
                    listarCarreraTecnica(request, response);
                    break;

                case "editar":
                    editarCarreraTecnica(request, response);
                    break;

                case "eliminar":
                    eliminarCarreraTecnica(request, response);
                    break;

            }
        }
    }
    
        private void editarCarreraTecnica(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String codigoCarrera = request.getParameter("codigoCarrera");
            
            CarreraTecnica carreraTecnica = new CarreraTecnicaDaoImpl().encontrar(new CarreraTecnica(codigoCarrera));
           

        System.out.println(carreraTecnica);
        
        request.setAttribute("carreratecnica", carreraTecnica);

        request.getRequestDispatcher("carreraTecnica/editar-carrera-tecnica.jsp").forward(request, response);
    }

    private void eliminarCarreraTecnica(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String codigoCarrera = request.getParameter("codigoCarrera");

        CarreraTecnica carreraTecnica = new CarreraTecnica(codigoCarrera);

        int registroEliminado = new CarreraTecnicaDaoImpl().eliminar(carreraTecnica);

        listarCarreraTecnica(request, response);

    }

    private void listarCarreraTecnica(HttpServletRequest request, HttpServletResponse response) throws IOException {

        List<CarreraTecnica> listarCarreraTecnica = new CarreraTecnicaDaoImpl().listar();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("listadoCarreraTecnica", listarCarreraTecnica);
        response.sendRedirect("carreraTecnica/listar-carrera-tecnica.jsp");
    }

}
