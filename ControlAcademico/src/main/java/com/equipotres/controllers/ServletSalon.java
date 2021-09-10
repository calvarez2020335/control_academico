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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String accion = request.getParameter("accion");

        if (accion != null) {

            switch (accion) {
                case "listar":
                    listarSalones(request, response);
                    break;

                case "editar":

                    break;

                case "eliminar":
                    eliminarSalon(request, response);
                    break;

            }
        }
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
