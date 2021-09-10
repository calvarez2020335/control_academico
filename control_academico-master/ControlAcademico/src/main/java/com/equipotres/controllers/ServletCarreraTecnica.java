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
     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String accion = request.getParameter("accion");

        if (accion != null) {

            switch (accion) {
                case "listar":
                    listarCarreraTecnica(request, response);
                    break;

                case "editar":

                    break;

                case "eliminar":
                    eliminarCarreraTecnica(request, response);
                    break;

            }
        }
    }
    private void eliminarCarreraTecnica(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String codigo_carrera = request.getParameter("codigo_carrera");
        
        CarreraTecnica carreraTecnica = new CarreraTecnica(codigo_carrera);
        
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

