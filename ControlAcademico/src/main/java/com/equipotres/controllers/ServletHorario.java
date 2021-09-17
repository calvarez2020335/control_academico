/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.controllers;

import com.equipotres.models.dao.HorarioDaoImpl;
import com.equipotres.models.domain.Horario;
import java.io.IOException;
import java.sql.Time;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Diego Enrique Hernández Cholotío <dhernandez-2020296@kinal.edu.gt>
 * @date 03-sep-2021
 * @time 15:23:26 Codigo Tecnico: IN5BV Carnet: 2020394
 */
@WebServlet("/ServletHorario")
public class ServletHorario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");

        System.out.println("\ndoPost");

        String accion = request.getParameter("accion");

        System.out.println("accion: " + accion);
        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarHorarios(request, response);
                    break;
                case "actualizar":
                    actualizarHorarios(request, response);

                    break;
            }
        }

    }

    private void actualizarHorarios(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int horarioId = Integer.parseInt(request.getParameter("horarioId"));

        Time horarioFinal = Time.valueOf("00:00:00");
        Time horarioInicio = Time.valueOf("00:00:00");

        String horarioFinal1 = request.getParameter("horarioFinal");
        String horarioInicio2 = request.getParameter("horarioInicio");

        System.out.println("devuelve" + horarioFinal1);

        horarioFinal = Time.valueOf(horarioFinal1 );
        horarioInicio = Time.valueOf(horarioInicio2);

        Horario horario = new Horario(horarioId, horarioFinal, horarioInicio);
        System.out.println(horario);

        int HorarioActualizado = new HorarioDaoImpl().actualizar(horario);
        System.out.println("salon actualizado" + HorarioActualizado);
        listarHorario(request, response);

    }

    private void insertarHorarios(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Time horarioFinal = Time.valueOf("00:00:00");
        Time horarioInicio = Time.valueOf("00:00:00");

        String horarioFinal1 = request.getParameter("horarioFinal");
        String horarioInicio2 = request.getParameter("horarioInicio");

        System.out.println("devuelve" + horarioFinal1);

        horarioFinal = Time.valueOf(horarioFinal1 + ":00");
        horarioInicio = Time.valueOf(horarioInicio2 + ":00");

        Horario horario = new Horario(horarioFinal, horarioInicio);
        System.out.println(horario);

        int HorarioRegistrado = new HorarioDaoImpl().insertar(horario);

        System.out.println("horario registrados" + HorarioRegistrado);

        listarHorario(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "listar":
                    listarHorario(request, response);
                    break;
                case "editar":
                    editarHorarios(request, response);
                    break;

                case "eliminar":
                    eliminarHorario(request, response);
                    break;
            }
        }
    }

    private void editarHorarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int horarioId = Integer.parseInt(request.getParameter("horarioId"));

        Horario horario = new HorarioDaoImpl().encontrar(new Horario(horarioId));

        System.out.println(horario);

        request.setAttribute("horario", horario);

        request.getRequestDispatcher("horario/editar-horario.jsp").forward(request, response);
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
