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

        <header id= "main-header" class="py-2 bg-info text-white">
            <div class="container">

                <div class="row">

                    <div class="col-12">

                        <h1>
                            Control De Instructores
                        </h1>


                    </div>


                </div>


            </div>



        </header>

        <section id="instructores">
            <div class="container">
                <div class="row">
                    <div class="col-9">
                        <table class="table table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th>#</th>
                                    <th>Nombre Completo</th>
                                    <th>Dirección</th>
                                    <th>Telefono</th>
                                    <th></th>

                                    <th></th>
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
                                            <a href="${pageContext.request.contextPath}/ServletInstructor?accion=eliminar&instructor_id=${instructor.instructor_id}">eliminar</a>
                                        </td>
                                    </tr>

                                </c:forEach>

                            </tbody>
                        </table>

                    </div>


                </div>


        </section>


        <jsp:include page="/WEB-INF/paginas/comunes/pie-pagina.jsp"/>


        <script src="../assets/js/jquery-3.6.0.js"></script>
        <script src="../assets/js/bootstrap.bundle.js"></script>
    </body>
</html>
