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
                            <i class="fas fa-user-tie"></i>Control De Instructores
                        </h1>


                    </div>


                </div>


            </div>



        </header>
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
                                        
                                        <button class="btn btn-danger" href="${pageContext.request.contextPath}/ServletInstructor?accion=eliminar&instructor_id=${instructor.instructor_id}"><i class="fas fa-virus-slash"></i>Eliminar</button>
                                        </td>
                                        <td >
                                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/ServletInstructor?accion=editar&"><i class="fas fa-highlighter"></i>Editar</a>
                                        </td>
                                        <td >
                                            
                                                    
                                            <!-- Button trigger modal -->
                                                 <button type="button" class="btn text-light" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                                <i class="fas fa-user-plus"></i> Agregar </i>
                                                                         
                                        </td>
                                    </tr>

                                </c:forEach>

                            </tbody>
                        </table>

                    </div>


                </div>
                
                <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white" >
                        <h5 class="modal-title" id="exampleModalLabel">Agregar estudiante</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="POST" action="${pageContext.request.contextPath}/ServletInstructor">
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="apellidos" class="form-label" >Ingres sus apellidos</label>
                                <input type="text" id="apellidos" name="apellidos" class="form-control"> 
                            </div>

                            <div class="mb-3">
                                <label for="nombres" class="form-label">Ingrese sus nombres</label>
                                <input type="text" id="nombres" name="nombres"class="form-control">
                            </div>

                            <div class="mb-3">
                                <label for="direccion" class="form-label">Ingrese su  Direccion</label>
                                <input type="text" id="direccion" name="direccion"class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="telefono" class="form-label">Ingrese su Telefono</label>
                                <input type="telefono" id="telefono" name="telefono"class="form-control">
                            </div>
               
                            
                            <input type="hidden" name="accion" value="insertar"> 

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Guardar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>      
                
        </section>


        <jsp:include page="/WEB-INF/paginas/comunes/pie-pagina.jsp"/>

        </div>
        <script src="../assets/js/jquery-3.6.0.js"></script>
        <script src="../assets/js/bootstrap.bundle.js"></script>
    </body>
</html>
