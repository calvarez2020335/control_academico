<%-- 
    Document   : listarAlumno
    Created on : 29/08/2021, 04:04:43 PM
    Author     : Carlos Adolfo Alvarez Crúz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        <link rel="stylesheet" href="../assets/css/style-css.css">
        <!-- bootsrap -->
        <link rel="stylesheet" href="../assets/css/bootstrap.css">

        <title>Listado de Alumnos</title>

    </head>
    <body>
        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>

        <header id= "main-header" class="py-2 bg-black text-white text-center">

            <div class="container">

                <div class="row">

                    <div class="col-12">

                        <h1>
                            <i class="fas fa-id-badge"></i> Control De Alumnos
                        </h1>
                    </div>
                </div>
            </div>
        </header>

        <!--
            Crear un formulario con la estructura que tuvimos en clase o como esta estructura y llamar a los servlets
            Se pueden guiar con la gravacion de la clase del dia miercoles, o pueden buscar en la documentación de boostrap
        -->

        <div class="modal fade" id="agregar-alumno-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Agregar Alumno </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="POST" action="${pageContext.request.contextPath}/ServletAlumno">
                        <div class="modal-body">

                            <div class="mb-3">
                                <label for="carne" class="form-label">Carnet</label>
                                <input type="number" id="carne" name="carne" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label form="apellidos" class="form-label" >Apellidos</label>
                                <input type="text" id="apellidos" name="apellidos" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label for="nombres" class="form-label">Nombres</label>
                                <input type="text" id="nombres" name="nombres" class="form-control">                         
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" id="email" name="email" class="form-control">                         
                            </div>
                            
                            <input type="hidden"  name="accion" value="insertar">                           

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-success">Guardar</button>                    
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <div class="p-3 mb-2 bg-black text-white">
            <section id="estudiantes">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <table class="table table table-dark table-striped table-bordered border-light text-center">
                                <thead class="table-dark">
                                    <tr>
                                        <th>Carne</th>
                                        <th>Apellidos</th>
                                        <th>Nombres</th>
                                        <th>Email</th>
                                        <th colspan="3">

                                            <a class="btn btn-outline-light btn-dark bnt-block w-50  rounded-pill fs-6" data-bs-toggle="modal" data-bs-target="#agregar-alumno-modal" class="btn btn-block">
                                                <i class="fa fa-plus"></i> Agregar Alumno
                                            </a>

                                        </th>
                                    </tr>
                                </thead>
                                <tbody>                

                                    <c:forEach var="alumno" items="${listaAlumno}">
                                        <tr>
                                            <td>${alumno.carne}</td>
                                            <td>${alumno.apellidos} </td>
                                            <td>${alumno.nombres}</td>
                                            <td>${alumno.email}</td>
                                            <td>
                                                <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/ServletAlumno?accion=eliminar&carne=${alumno.carne}">
                                                    <i class="far fa-trash-alt"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/ServletAlumno?accion=editar&carne=${alumno.carne}">
                                                    <i class="far fa-edit"></i>
                                                </a>
                                            </td>

                                        </tr>
                                    </c:forEach>


                                </tbody>
                            </table>    

                        </div>

                    </div>

                </div>
            </section>  

        </div>
        <jsp:include page="/WEB-INF/paginas/comunes/pie-pagina.jsp"/>

        <script src="../assets/js/jquery-3.6.0.js"></script>
        <script src="../assets/js/bootstrap.bundle.js"></script>

    </body>
</html>
