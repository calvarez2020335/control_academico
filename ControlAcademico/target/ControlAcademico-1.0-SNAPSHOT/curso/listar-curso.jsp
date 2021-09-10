<%-- 
    Document   : listarCurso
    Created on : 29/08/2021, 08:32:31 AM
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
        <link rel="stylesheet" href="assets/css/style-css.css"/>
        <!-- bootsrap -->
        <link rel="stylesheet" href="../assets/css/bootstrap.css">

        <title>Listado de Cursos</title>

    </head>
    <body>
        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>

        <header id= "main-header" class="py-2 bg-black text-white text-center">

            <div class="container">

                <div class="row">

                    <div class="col-12">

                        <h1>
                            <i class="fas fa-id-badge"></i> Control De Cursos
                        </h1>
                    </div>
                </div>
            </div>
        </header>


        <div class="modal fade" id="agregar-curso-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Agregar Curso </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="POST" action="${pageContext.request.contextPath}/ServletAlumno">
                        <div class="modal-body">

                            <div class="mb-3">
                                <label for="capacidad" class="form-label">...</label>
                                <input type="number" id="capacidad" name="capacidad" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label form="descripcion" class="form-label" >...</label>
                                <input type="text" id="descripcion" name="descripcion" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label for="nombreSalon" class="form-label">...</label>
                                <input type="text" id="nombreSalon" name="nombreSalon" class="form-control">                         
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
            <section id="curso">
                <div class="container">
                    <div class="row">

                        <div class="col-12">
                            <table class="table table table-dark table-striped table-bordered border-light text-center">
                                <thead class="table-dark">
                                    <tr>
                                        <th>#</th>
                                        <th>Ciclo</th>
                                        <th>Cupo Maximo</th>
                                        <th>Cupo Minimo</th>
                                        <th>Descripción</th>
                                        <th>Codigo Carrera</th>
                                        <th>Id Horario</th>
                                        <th>Id Instructor</th>
                                        <th>Id Salon</th>
                                        <th colspan="2">

                                            <a class="btn btn-outline-light btn-dark bnt-block w-50  rounded-pill fs-6" data-bs-toggle="modal" data-bs-target="#agregar-curso-modal" class="btn btn-block">
                                                <i class="fa fa-plus"></i> Agregar Curso
                                            </a>

                                        </th>
                                    </tr>
                                </thead>
                                <tbody>                

                                    <c:forEach var="curso" items="${listaCurso}">
                                        <tr>
                                            <td>${curso.curso_id}</td>
                                            <td>${curso.ciclo} </td>
                                            <td>${curso.cupo_maximo}</td>
                                            <td>${curso.cupo_minimo}</td>
                                            <td>${curso.descripcion}</td>
                                            <td>${curso.codigo_carrera}</td>
                                            <td>${curso.horario_id}</td>
                                            <td>${curso.instructor_id}</td>
                                            <td>${curso.salon_id}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/ServletCurso?accion=eliminar&curso_id=${curso.curso_id}">
                                                    <i class="far fa-trash-alt"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/ServletCurso?accion=editar&curso_id=${curso.curso_id}">
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