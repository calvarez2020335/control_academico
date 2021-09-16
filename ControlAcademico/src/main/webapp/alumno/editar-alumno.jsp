<%-- 
    Document   : listarAlumno
    Created on : 29/08/2021, 04:04:43 PM
    Author     : Carlos Adolfo Alvarez Crúz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="es_GT"/>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Glory:ital,wght@1,200;1,500&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="../assets/css/style-css.css"/>
        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="./assets/css/style-css.css">
        <!-- bootsrap -->
        <link rel="stylesheet" href="./assets/css/bootstrap.css">

        <title>Editar Alumno</title>

    </head>
    <body>
        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>

        <section id="action" class="py-4 mb-4 bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-3" >
                        <a href="javascript:history.back()" class="btn btn-light btn-block">
                            <i class="fa fa-arrow-left"></i> Regresar a listado alumnos 
                        </a> 
                    </div>
                    <div class="col-md-3">

                    </div>
                    <div class="col-md-3">

                    </div>
                </div>
            </div>
        </section>

        <main>
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">

                                <h4>Editar Alumno</h4>

                                <div class="card-body">

                                    <form method="POST" action="${pageContext.request.contextPath}/ServletAlumno">

                                        <div class="mb-3">
                                            <label for="apellidos" class="form-label">Apellidos</label>
                                            <input type="text" id="apellidos" name="apellidos" class="form-control" value="${alumno.apellidos}"/>
                                        </div>

                                        <div class="mb-3">
                                            <label for="nombres" class="form-label">Nombres</label>
                                            <input type="text" id="nombres" name="nombres" class="form-control" value="${alumno.nombres}"/>
                                        </div>

                                        <div class="mb-3">
                                            <label for="email" class="form-label">Email</label>
                                            <input type="email" id="email" name="email" class="form-control" value="${alumno.email}"/>
                                        </div>

                                        <input type="hidden" name="carne" value="${alumno.carne}"/>
                                        <input type="hidden" name="accion" value="actualizar"/>

                                        <button type="submit" class="btn btn-success">Guardar Cambios</button>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="/WEB-INF/paginas/comunes/pie-pagina.jsp"/>

        <script src="./assets/js/jquery-3.6.0.js"></script>
        <script src="./assets/js/bootstrap.bundle.js"></script>

    </body>
</html>
