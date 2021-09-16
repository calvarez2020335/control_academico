/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.controllers;

import com.equipotres.models.dao.UsuarioDaoImpl;
import com.equipotres.models.domain.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Carlos Adolfo Alvarez Crúz
 */
public class ServletUsuario extends HttpServlet {
    
    UsuarioDaoImpl dao = new UsuarioDaoImpl();
    Usuario u = new Usuario();
    
    int r;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        
        if(accion.equals("Ingresar")){
            String user = request.getParameter("txtnom");
            String pass = request.getParameter("txtpass");
            u.setUser(user);
            u.setPass(pass);
            r = dao.validar(u);
            if(r==1){
                request.getRequestDispatcher("inicio.jsp").forward(request, response);
            }else
                request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
