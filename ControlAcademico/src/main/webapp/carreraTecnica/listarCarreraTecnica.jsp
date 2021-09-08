<%-- 
    Document   : listarCarreraTecnica
    Created on : 29/08/2021, 08:33:00 AM
    Author     : Carlos Adolfo Alvarez Crúz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="../assets/css/bootstrap.css">
<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" href="assets/css/style-css.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Glory:ital,wght@1,200;1,500&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="../assets/css/style-css.css"/>
        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrera Tecnica</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>
        <header id="main-header" class="py-2 bg-info text-white" > 
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h1>Control de Carreras Tecnicas</h1>
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
                                    <th>Nombre de la carrera</th>
                                    <th>-</th>
                                </tr>
                            </thead>
                            <tbody>                
                                <c:forEach var="carreratecnica" items="${listadoCarreraTecnica}">
                                    <tr>
                                        <td>${carreratecnica.codigoCarrera}</td>
                                        <td>${carreratecnica.nombre}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/ServletCarreraTecnica?accion=eliminar&codigo_carrera=${carreratecnica.codigoCarrera}">Eliminar</a>
                                        </td>              
                                    </tr>
                                </c:forEach>                              
                            </tbody>
                        </table>    
                    </div>
                </div>
            </div>
        </section>               
        <jsp:include page="/WEB-INF/paginas/comunes/pie-pagina.jsp"/>
        <script src="../assets/js/jquery-3.6.0.js"></script>
        <script src="../assets/js/bootstrap.bundle.js"></script>
    </body>
</html>
</html>
