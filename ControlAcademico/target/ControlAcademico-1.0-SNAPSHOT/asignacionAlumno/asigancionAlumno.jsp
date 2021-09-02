<%-- 
    Document   : asigancionAlumno
    Created on : 01-sep-2021, 11:10:34
    Author     : Daniel Marroquin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--Bootstrap CSS -->
        <link rel="stylesheet" href="../assets/css/bootstrap.css">

        <title>Agigancion de Alumnos</title>
    </head>
    <body>
        <header id="main-header" class="py-2 bg-info text-white">
            <div class="conteiner">
                <div class="row">
                    <div class="col-12">
                        <h1>Asignacion de Alumnos</h1>
                    </div>
                </div>
            </div>
        </header>
        <section id="asigancionAlumnos">
            <div class="conteiner">
                <div class="row">
                    <div class="col-12">
                        <table class="table table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th>Asignación</th>
                                    <th>Carne</th>
                                    <th>Curso</th>
                                    <th>Fecha Asignacion</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="asigAlumno" items="${listaAsigAlumnos}">
                                    <tr>
                                        <td>${asigAlumno.asigancionId}</td>
                                        <td>${asigAlumno.carne}</td>
                                        <td>${asigAlumno.cursoId}</td>
                                        <td>${asigAlumno.fechaAsignacion}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/ServletAsigAlumno?accion=eliminar&asigancionId=${asigAlumno.asigancionId}">
                                                Eliminar</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </section>

        <script src="../assets/js/jquery-3.6.0.js"></script>
        <script src="../assets/js/bootstrap.bundle.js"></script>

    </body>
</html>
