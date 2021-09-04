<%-- 
    Document   : horario
    Created on : 03-sep-2021, 15:09:38
    Author     : Diego Hernández
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

        <title>Listado de horarios</title>

    </head>
    <body>

        <header id="main-header" class="py-2 bg-info text-white" > 
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h1>Control de horarios</h1>
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
                                    <th>Horario Final</th>
                                    <th>Horario Inicio</th>
                                    <th>-</th>
                                </tr>
                            </thead>
                            <tbody>                

                                <c:forEach var="horario" items="${listaHorario}">
                                    <tr>
                                        <td>${horario.horarioId}</td>
                                        <td>${horario.horarioFinal} </td>
                                        <td>${horario.horarioInicio}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/ServletHorario?accion=eliminar&horarioId=${horario.horarioId}">Eliminar</a>
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
