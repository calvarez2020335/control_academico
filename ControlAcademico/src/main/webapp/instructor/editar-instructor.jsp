<%-- 
    Document   : listarInstructor
    Created on : 29/08/2021, 08:41:43 AM
    Author     : Carlos Adolfo Alvarez Crúz
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

        <title>Editar Instructores</title>
    </head>
    <body id="body_Kinal">

        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>

        <header id="main-header" class="py-4 bg-dark text-info text-center">
            <div class="conteiner">
                <div class="row">
                    <div class="col-12">
                        <h1>
                            <i class="fas fa-tools"></i>
                            Editar Instructores
                        </h1>
                    </div>
                </div>
            </div>
        </header>
        <section id="actions" class="py-4 mb-4 bg-dark">
            <div class="conteiner">
                <div class="row">
                    <div class="col-md-3">
                        <a href="${pageContext.request.contextPath}/ServletInstructor?accion=listar" class="btn btn-outline-light"><i class="fas fa-angle-left"></i>     Regresar a Instructores</a>
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
                                <form method="POST" action="${pageContext.request.contextPath}/ServletInstructor">
                                    <div class="form-floating mb-3">
                                        <input type="text" id="apellido" name="apellido" class="form-control" placeholder="Apellido" value="${instructor.apellidos}">
                                        <label for="apellido" class="form-label">Apellido</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Nombre" value="${instructor.nombres}">
                                        <label for="nombre" class="form-label">Nombre</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" id="direccion" name="direccion" class="form-control" placeholder="Direccion" value="${instructor.direccion}">
                                        <label for="direccion" class="form-label">Direccion</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="tel" id="telefono" name="telefono" class="form-control" placeholder="Telefono" value="${instructor.telefono}">
                                        <label for="telefono" class="form-label">Telefono</label>
                                    </div>

                                    <input type="hidden" name="accion" value="actualizar">
                                    <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Cancelar</button>
                                    <button type="submit" class="btn btn-outline-info">Actualizar</button>
                                    <input type="hidden" name="instructor_id" value="${instructor.instructor_id}">
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
