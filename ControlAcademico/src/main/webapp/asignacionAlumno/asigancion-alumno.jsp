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
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Glory:ital,wght@1,200;1,500&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="../assets/css/style-css.css"/>
        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script>
        <link rel="stylesheet" href="assets/css/style-css.css"/>
        <!--Bootstrap CSS -->
        <link rel="stylesheet" href="../assets/css/bootstrap.css">

        <title>Agigancion de Alumnos</title>
    </head>
        <body>

        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>

        <header id="main-header" class="py-2 bg-dark text-info text-center">
            <div class="conteiner">
                <div class="row">
                    <div class="col-12">
                        <h1><i class="fas fa-id-badge"></i>
                            Asignacion de Alumnos
                        </h1>
                    </div>
                </div>
            </div>
        </header>
        <section id="asigancionAlumnos">
            <div class="conteiner">
                <div class="row">
                    <div class="col-12 bg-dark">
                        <table class="table table-dark table-sm border-primary text-center"> 
                            <thead class="table-dark">
                                <tr>
                                    <th>Asignación</th>
                                    <th>Carne</th>
                                    <th>Curso</th>
                                    <th>Fecha Asignacion</th>
                                    <th></th>
                                    <th></th>
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
                                            <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/ServletAsigAlumno?accion=eliminar&asigancionId=${asigAlumno.asigancionId}">
                                                <i class="far fa-trash-alt"></i></a>
                                        </td>
                                        <td>
                                            <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/ServletAsigAlumno?accion=editar&asigancionId=${asigAlumno.asigancionId}">
                                                <i class="far fa-edit"></i></a>
                                        </td>
                                        <td>
                                            <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/ServletAsigAlumno?accion=agregar&asigancionId=${asigAlumno.asigancionId}">
                                                <i class="far fa-plus-square"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </section>

        <jsp:include page="/WEB-INF/paginas/comunes/pie-pagina.jsp"/>


        <script src="../assets/js/jquery-3.6.0.js"></script>
        <script src="../assets/js/bootstrap.bundle.js"></script>

    </body>
</html>