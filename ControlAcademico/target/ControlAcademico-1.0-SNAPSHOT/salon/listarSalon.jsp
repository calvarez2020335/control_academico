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
    <body class="bg-secondary bg-opacity-75 bg-gradient">
        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>

        <header id="main-header" class="py-2 bg-dark bg-gradient bg-opacity-75 text-info text-center" > 
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h1><i class="fas fa-chalkboard-teacher"></i> Salones</h1>
                    </div>
                </div>
            </div>
        </header> 


        <div class="modal fade" id="agregar-salon-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Agregar Salon </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="POST" action="${pageContext.request.contextPath}/ServletSalon">
                        <div class="modal-body">

                            <div class="mb-3">
                                <label for="capacidad" class="form-label">Capacidad del Salon</label>
                                <input type="number" id="capacidad" name="capacidad" class="form-control" value="${salon.capacidad}">
                            </div>

                            <div class="mb-3">
                                <label form="descripcion" class="form-label" >Descripcion Del Salon</label>
                                <input type="text" id="descripcion" name="descripcion" class="form-control" value="${salon.descripcion}">
                            </div>

                            <div class="mb-3">
                                <label for="nombreSalon" class="form-label">Nombre Del Salon</label>
                                <input type="text" id="nombreSalon" name="nombreSalon" class="form-control" value="${salon.nombreSalon}">                         
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
<!-- comentario prueba-->




        <section id="salones">
            <div class="conteiner pt-2">
                <div class="row">
                    <div class="col-12">
                        <table class="table table-dark table-sm border-primary table-striped text-center fs-5">
                            <thead class="table-dark">
                                <tr>
                                    <th>#</th>
                                    <th>Capacida</th>
                                    <th>Descripcion Del Salon</th>
                                    <th>Nombre De Salon</th>
                                    <th colspan="3" >
                                        <a class="btn btn-primary bnt-block w-50  rounded-pill fs-6" data-bs-toggle="modal" data-bs-target="#agregar-salon-modal" class="btn btn-block">
                                            <i class="fa fa-plus"></i> Agregar Salon
                                        </a>
                                    </th>
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
                                            <button type="button" class="btn btn-outline-danger rounded-pill">
                                                <a href="${pageContext.request.contextPath}/ServletSalon?accion=eliminar&salonId=${salon.salonId}" class="text-decoration-none text-white"><i class="fas fa-trash-alt"></i> Eliminar</a>
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-outline-success rounded-pill">
                                                <a href="${pageContext.request.contextPath}/ServletSalon?accion=editar&salonId=${salon.salonId}" class="text-decoration-none text-white"><i class="far fa-edit"></i> Editar</a>
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
