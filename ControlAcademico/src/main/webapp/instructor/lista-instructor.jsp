<%-- 
    Document   : listaInstructor
    Created on : 3/09/2021, 03:40:28 PM
    Author     : carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content = "width=device-width, initial-scale=1">
        <link rel="stylesheet" href="assets/css/style-css.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Glory:ital,wght@1,200;1,500&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="../assets/css/style-css.css"/>
        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script>
        <link rel="stylesheet" href="../assets/css/style.css">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">




        <title>Listado de Instructores</title>
    </head>

    <body>


        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>

        <header id= "main-header" class="py-2 bg-black text-white">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h1>
                            <i class="fas fa-user-tie"></i>  Control De Instructores
                        </h1>
                    </div>
                </div>
            </div>
        </header>

        <!-- Modal -->
        <div class="modal fade" id="agregar-instructor-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header text-white bg-dark">
                        <h5 class="modal-title" id="exampleModalLabel">Agregar Nuevo Registro</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="POST" action="${pageContext.request.contextPath}/ServletInstructor">
                        <div class="modal-body bg-dark text-dark">
                            <div class="form-floating mb-3">
                                <input type="text" id="apellido" name="apellido" class="form-control" placeholder="Apellido">
                                <label for="apellido" class="form-label">Apellido</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Nombre">
                                <label for="nombre" class="form-label">Nombre</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" id="direccion" name="direccion" class="form-control" placeholder="Direccion">
                                <label for="direccion" class="form-label">Direccion</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="tel" id="telefono" name="telefono" class="form-control" placeholder="Telefono">
                                <label for="telefono" class="form-label">Telefono</label>
                            </div>
                            <input type="hidden" name="accion" value="insertar">
                        </div>
                        <div class="modal-footer bg-dark">
                            <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-outline-light">Guardar</button>
                        </div>

                    </form>

                </div>
            </div>
        </div>
        <section>
            <div class="p-3 mb-2 bg-black text-white">
                <section id="instructores">
                    <div class="container">
                        <div class="row">
                            <div class="col-9">
                                <table class="table table-dark">

                                    <thead class="table-dark">
                                        <tr>
                                            <th>#</th>
                                            <th>Nombre Completo</th>
                                            <th>Dirección</th>
                                            <th>Telefono</th>
                                            <th colspan="3">
                                                <a class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#agregar-instructor-modal">
                                                    <i class="fas fa-user-tie"></i>  Agregar Instructor
                                                </a>
                                            </th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="instructor" items="${listadoInstructores}">
                                            <tr>
                                                <td>${instructor.instructor_id}</td>
                                                <td>${instructor.apellidos} ${instructor.nombres}</td>
                                                <td>${instructor.direccion}</td>
                                                <td>${instructor.telefono}</td>
                                                <td>                                 
                                                    <a class="btn btn-danger" href="${pageContext.request.contextPath}/ServletInstructor?accion=eliminar&instructor_id=${instructor.instructor_id}"><i class="fas fa-virus-slash"></i>Eliminar</a>
                                                </td>
                                                <td >
                                                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/ServletInstructor?accion=editar&instructor_id=${instructor.instructor_id}"><i class="fas fa-highlighter"></i>Editar</a>
                                                </td>
                                            </tr>

                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                </section>
                <jsp:include page="/WEB-INF/paginas/comunes/pie-pagina.jsp"/>

            </div>
            <script src="../assets/js/jquery-3.6.0.js"></script>
            <script src="../assets/js/bootstrap.bundle.js"></script>
    </body>

</html>
