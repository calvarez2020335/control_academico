<%-- 
    Document   : listarSalon
    Created on : 29/08/2021, 08:40:05 AM
    Author     : Carlos Adolfo Alvarez Crúz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Glory:ital,wght@1,200;1,500&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="../assets/css/style-css.css"/>
        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script>
        <link rel="stylesheet" href="assets/css/style-css.css"/>
        <!-- bootsrap -->
        <link rel="stylesheet" href="../assets/css/bootstrap.css">

        <title>Listado de Salones</title>

    </head>
    <body>
        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>
        <header id="main-header" class="py-2 bg-info text-white" > 
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h1>Control de salones</h1>
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
                                    <th>capacida completo</th>
                                    <th>descripcion</th>
                                    <th>nombre salon</th>
                                    <th>-</th>
                                </tr>
                            </thead>
                            <tbody>                

                                <c:forEach var="salon" items="${listadoSalones}">
                                    <tr>
                                        <td>${salon.salonId}</td>
                                        <td>${salon.capacidad} </td>
                                        <td>${salon.descripcion}</td>
                                        <td>${salon.nombreSalon}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/ServletSalon?accion=eliminar&salonId=${salon.salonId}">Eliminar</a>
                                        </td>

                                    </tr>
                                </c:forEach>


                            </tbody>
                        </table>    

                    </div>

                    <div class="col-3">
                        <div class="card-body">

                            <h3>cantidad de salones</h3>
                            <h4 class="display-4"> 

                            </h4>
                        </div>

                    </div>

                </div>

            </div>


        </section>

        <jsp:include page="/WEB-INF/paginas/comunes/pie-pagina.jsp"/>

        <script src="../assets/js/jquery-3.6.0.js"></script>
        <script src="../assets/js/bootstrap.bundle.js"></script>
    </body>
</html>
