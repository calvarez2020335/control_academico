<%-- 
    Document   : listarCarreraTecnica
    Created on : 29/08/2021, 08:33:00 AM
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
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <title>Carrera Tecnica</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>
        <header id="main-header" class="py-2 bg-info text-white" > 
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h1>Control de carreras tecnicas</h1>
                    </div>
                </div>
            </div>
        </header> 

        <section id="estudiantes">
            <div class="container">
                <div class="row">

                    <div class="col-9">
                        <table class="table table-dark table-sm border-primary text-center fs-5">
                            <thead class="table-dark">
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombre de la carrera</th>
                                    
                                        <th colspan="3" >
                                            <a class="btn btn-primary bnt-block w-50  rounded-pill fs-6" data-bs-toggle="modal" data-bs-target="#agregar-carreraTecnica-modal" class="btn btn-block">
                                                <i class="fa fa-plus"></i> Agregar carrera 
                                            </a>
                                        </th>
                                </tr>
                            </thead>
                            <tbody>                
                                <c:forEach var="carreraTecnica" items="${listadoCarreraTecnica}">
                                    <tr>
                                        <td>${carreratecnica.codigoCarrera}</td>
                                        <td>${carreratecnica.nombre}</td>
                                        <td>
                                            <button type="button" class="btn btn-outline-danger rounded-pill">
                                                <a href="${pageContext.request.contextPath}/ServletCarreraTecnica?accion=eliminar&codigo_carrera=${carreratecnica.codigoCarrera}" class="text-decoration-none text-white"><i class="fas fa-trash-alt"></i> Eliminar</a>
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-outline-success rounded-pill">
                                                <a href="${pageContext.request.contextPath}/ServletCarreraTecnica?accion=editar&codigo_carrera=${carreratecnica.codigoCarrera}" class="text-decoration-none text-white"><i class="far fa-edit"></i> Editar</a>
                                            </button>
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
