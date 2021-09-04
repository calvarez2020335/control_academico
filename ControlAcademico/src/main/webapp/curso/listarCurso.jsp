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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- bootsrap -->
        <link rel="stylesheet" href="../assets/css/bootstrap.css">

        <title>Listado de Cursos</title>

    </head>
    <body>

        <header id="main-header" class="py-2 bg-info text-white" > 
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h1>Control de cursos</h1>
                    </div>
                </div>
            </div>
        </header> 

        <section id="estudiantes">
            <div class="container">
                <div class="row">

                    <div class="col-9">
                        <table class="table table-striped">
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
                                    <th>-</th>
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
                                            <a href="${pageContext.request.contextPath}/ServletCurso?accion=eliminar&curso_id=${curso.curso_id}">Eliminar</a>
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