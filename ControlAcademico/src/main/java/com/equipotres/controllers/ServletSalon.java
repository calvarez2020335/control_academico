/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.controllers;

import com.equipotres.models.dao.SalonDaoImpl;
import com.equipotres.models.domain.Salon;
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
 * @author Alan Eduardo De La Cruz Najera
 * @date 01-sep-2021
 * @time 9:15:00 Carnet:2020390 Codigo Tecnico: IN5BV
 */
@WebServlet("/ServletSalon")
public class ServletSalon extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");

        System.out.println("\ndoPost");

        String accion = request.getParameter("accion");

        System.out.println("accion: " + accion);
        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarSalon(request, response);
                    break;
                case "actualizar":
                    actualizarSalon(request, response);

                    break;
            }
        }

    }

    private void actualizarSalon(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int salonId = Integer.parseInt(request.getParameter("salonId"));
        int capacidad = 0;
        String capacidadMax = request.getParameter("capacidad");
        String descripcion = request.getParameter("descripcion");
        String nombreSalon = request.getParameter("nombreSalon");
        capacidad = Integer.parseInt(capacidadMax);
        
        Salon salon = new Salon(salonId, capacidad, descripcion, nombreSalon);
        System.out.println(salon);
        
        int salonActualizado = new SalonDaoImpl().actualizar(salon);
        System.out.println("salon actualizado" + salonActualizado);
        listarSalones(request, response);
        
    }

    private void insertarSalon(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int capacidad = 0;
        String capacidadMax = request.getParameter("capacidad");
        String descripcion = request.getParameter("descripcion");
        String nombreSalon = request.getParameter("nombreSalon");

        capacidad = Integer.parseInt(capacidadMax);

        Salon salon1 = new Salon(capacidad, descripcion, nombreSalon);
        System.out.println(salon1);

        int salonesRegistrados = new SalonDaoImpl().insertar(salon1);

        System.out.println("salones registrados" + salonesRegistrados);

        listarSalones(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String accion = request.getParameter("accion");

        if (accion != null) {

            switch (accion) {
                case "listar":
                    listarSalones(request, response);
                    break;

                case "editar":
                    editarSalon(request, response);
                    break;

                case "eliminar":
                    eliminarSalon(request, response);
                    break;

            }
        }
    }

    private void editarSalon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int salonId = Integer.parseInt(request.getParameter("salonId"));

        Salon salon = new SalonDaoImpl().encontrar(new Salon(salonId));

        System.out.println(salon);
        
        request.setAttribute("salon", salon);

        request.getRequestDispatcher("salon/editar-salon.jsp").forward(request, response);
    }

    private void eliminarSalon(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int salonId = Integer.parseInt(request.getParameter("salonId"));

        Salon salon = new Salon(salonId);
        int registrosEliminados = new SalonDaoImpl().eliminar(salon);
        listarSalones(request, response);

    }

    private void listarSalones(HttpServletRequest request, HttpServletResponse response) throws IOException {

        List<Salon> listaSalones = new SalonDaoImpl().listar();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("listadoSalones", listaSalones);
        response.sendRedirect("salon/listar-salon.jsp");
    }

}
