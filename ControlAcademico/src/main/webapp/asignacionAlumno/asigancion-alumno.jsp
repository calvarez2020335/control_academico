<%-- 
    Document   : asigancionAlumno
    Created on : 01-sep-2021, 11:10:34
    Author     : Daniel Marroquin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="es_GT"/>
<!DOCTYPE html>
<html>


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../assets/css/style-css.css"/>
        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script>
        <link rel="stylesheet" href="assets/css/style-css.css"/>
        <!-- bootsrap -->
        <link rel="stylesheet" href="../assets/css/bootstrap.css">

        <title>Asigancion de Alumnos</title>
    </head>
    <body id="body_Kinal">

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
        <div class="modal fade" id="agregar-asignacion-alumno-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header text-white bg-dark">
                        <h5 class="modal-title" id="exampleModalLabel">Agregar Nuevo Registro</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="POST" action="${pageContext.request.contextPath}/ServletAsigAlumno">
                        <div class="modal-body bg-dark text-dark">
                            <div class="form-floating mb-3">
                                <input type="text" id="asigancion" name="asigancion" class="form-control" placeholder="Asigancion">
                                <label for="asigancion" class="form-label">Asigancion</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" id="carne" name="carne" class="form-control" placeholder="Carne">
                                <label for="carne" class="form-label">Carne</label>
                                <a href="${pageContext.request.contextPath}/ServletAlumno?accion=listar" class="link-light">¿Cual es mi Carne?  <i class="far fa-question-circle"></i></a>
                            </div>   
                            <div class="form-floating mb-3">
                                <input type="number" id="curso" name="curso" class="form-control" placeholder="Curso">
                                <label for="curso" class="form-label">Curso</label>
                                <a href="${pageContext.request.contextPath}/ServletCurso?accion=listar" class="link-light">¿Cual es mi Curos?  <i class="far fa-question-circle"></i></a>
                            </div>
                            <div class="form-floating">
                                <input type="datetime" id="fecha" name="fecha" class="form-control" placeholder="Fecha Asignacion Año-Mes-Dia Hora:Minutos:Segundos">
                                <label for="fecha" class="form-label">Fecha Asignacion</label>
                            </div>
                            <div class="text-light text-start">
                                    Para Ingresar la Fecha y Hora: <br>
                                    Debera Ingresar la Fecha: Año-Mes-Dia *Con los Guiones <br>
                                    Debera Ingresar la Hora: Hora:Minutos:Segundos *Con los 2 Puntos <br>
                                    Ejemplo: 2021-19-15 20:59:59
                            </div>

                            <input type="hidden" name="accion" value="insetar">
                        </div>
                        <div class="modal-footer bg-dark">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary">Guardar</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <section id="asigancionAlumnos">
            <div class="conteiner">
                <div class="row">
                    <div class="col-12 bg-dark">
                        <table class="table table-dark table-sm table-bordered border-primary text-center"> 
                            <thead class="table-dark">
                                <tr>
                                    <th>Asignación</th>
                                    <th>Carne</th>
                                    <th>Curso</th>
                                    <th>Fecha Asignacion</th>
                                    <th colspan="3">

                                        <a class="btn btn-outline-light btn-dark bnt-block w-50  rounded-pill fs-6" data-bs-toggle="modal" data-bs-target="#agregar-asignacion-alumno-modal" class="btn btn-block">
                                            <i class="far fa-plus-square"></i> Agregar Asignacion Alumno
                                        </a>

                                    </th>
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
                                            <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/ServletAsigAlumno?accion=eliminar&asigancionId=${asigAlumno.asigancionId}">
                                                <i class="far fa-trash-alt"></i></a>
                                        </td>
                                        <td>
                                            <a class="btn btn-outline-warning" href="${pageContext.request.contextPath}/ServletAsigAlumno?accion=editar&asigancionId=${asigAlumno.asigancionId}">
                                                <i class="far fa-edit"></i></a>
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
