<%-- 
    Document   : editar-asignacion-alumno
    Created on : 15-sep-2021, 12:15:20
    Author     : Daniel Marroquin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="es_GT"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./assets/css/style-css.css"/>
        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.css" rel="stylesheet"/>
        <!-- bootsrap -->
        <link rel="stylesheet" href="./assets/css/bootstrap.css">

        <title>Editar Asigancion Alumno</title>
    </head>
    <body id="body_Kinal">

        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>

        <header id="main-header" class="py-4 bg-dark text-info text-center">
            <div class="conteiner">
                <div class="row">
                    <div class="col-12">
                        <h1>
                            <i class="fas fa-tools"></i>
                            Editar Asignacion de Alumnos
                        </h1>
                    </div>
                </div>
            </div>
        </header>
        <section id="actions" class="py-4 mb-4 bg-dark">
            <div class="conteiner">
                <div class="row">
                    <div class="col-md-3">
                        <a href="${pageContext.request.contextPath}/ServletAsigAlumno?accion=listar" class="btn btn-outline-light"><i class="fas fa-angle-left"></i>     Regresar a Asignacion Alumno</a>
                    </div>
                </div>
            </div>
        </section>
        <main class="bg-dark">
            <div class="conteiner">
                <div class="row">
                    <div class="col-12">
                        <div class="card bg-dark">
                            <div class="card-body">
                                <form method="POST" action="${pageContext.request.contextPath}/ServletAsigAlumno">
                                    <div class="form-floating mb-3">
                                        <input type="text" id="carne" name="carne" class="form-control" placeholder="Carne" value="${asigAlumno.carne}">
                                        <label for="carne" class="form-label">Carne</label>
                                        <a href="${pageContext.request.contextPath}/ServletAlumno?accion=listar" class="link-light">¿Cual es mi Carne?  <i class="far fa-question-circle"></i></a>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="number" id="curso" name="curso" class="form-control" placeholder="Curso" value="${asigAlumno.cursoId}">
                                        <label for="curso" class="form-label">Curso</label>
                                        <a href="${pageContext.request.contextPath}/ServletCurso?accion=listar" class="link-light">¿Cual es mi Curos?  <i class="far fa-question-circle"></i></a>
                                    </div>
                                    <div class="form-floating">
                                        <input type="datetime" id="fecha" name="fecha" class="form-control" placeholder="Fecha Asignacion Año-Mes-Dia Hora:Minutos:Segundos" value="${asigAlumno.fechaAsignacion}">
                                        <label for="fecha" class="form-label">Fecha Asignacion</label>
                                    </div>
                                    <div class="text-light text-start">
                                        Para Ingresar la Fecha y Hora: <br>
                                        Debera Ingresar la Fecha: Año-Mes-Dia *Con los Guiones <br>
                                        Debera Ingresar la Hora: Hora:Minutos:Segundos *Con los 2 Puntos <br>
                                        Ejemplo: 2021-19-15 20:59:59
                                    </div>

                                    <input type="hidden" name="accion" value="actualizar">
                                    <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Cancelar</button>
                                    <button type="submit" class="btn btn-outline-info">Actualizar</button>
                                    <input type="hidden" name="asigancionId" value="${asigAlumno.asigancionId}">
                                    <input type="hidden" name="accion" value="actualizar">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>


        <jsp:include page="/WEB-INF/paginas/comunes/pie-pagina.jsp"/>

        <script src="./assets/js/jquery-3.6.0.js"></script>
        <script src="./assets/js/bootstrap.bundle.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.3.0/mdb.min.js"></script>
    </body>
</html>
