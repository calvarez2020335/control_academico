/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.controllers;

import com.equipotres.models.dao.HorarioDaoImpl;
import com.equipotres.models.domain.Horario;
import java.io.IOException;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Diego Enrique Hernández Cholotío <dhernandez-2020296@kinal.edu.gt>
 * @date 03-sep-2021
 * @time 15:23:26 
 * Codigo Tecnico: IN5BV 
 * Carnet: 2020394
 */
@WebServlet("/ServletHorario")
public class ServletHorario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "listar":
                    listarHorario(request, response);
                    break;
                case "eliminar":
                    eliminarHorario(request, response);
                    break;
            }
        }
    }
    
    private void listarHorario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Horario> listaHorario = new HorarioDaoImpl().listar();

        HttpSession seccion = request.getSession();

        seccion.setAttribute("listaHorario", listaHorario);
        response.sendRedirect("horario/listar-horario.jsp");

    }
    
    private void eliminarHorario(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int horarioId = Integer.parseInt(request.getParameter("horarioId"));

        Horario horario = new Horario(horarioId);

        int registroEliminados = new HorarioDaoImpl().eliminar(horario);

        listarHorario(request, response);
    }

}
