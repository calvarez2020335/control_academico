<%-- 
    Document   : editar-instructor
    Created on : 17/09/2021, 01:23:25 AM
    Author     : carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content = "width=device-width, initial-scale=1">

        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/css/bootstrap.css">
        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script> 




    <body id = "contenido">
        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>



        <section  >
            <div class="container" >
                <div class="row-cols-1" style="background-color: #5E2129">
                    <div class="col-9">
                        <!-- Button trigger modal -->
                        <button type="button" class="btn text-light" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            <i class="fas fa-user-plus"></i> regresar </i>
                    </div>
                </div>
            </div>
        </section>



        <main>
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card">
                                <h4>Editar Instructor</h4>
                            </div>
                            <div class="card-body">

                                <form method="POST" action="${pageContext.request.contextPath}/ServletInstructor">
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label for="apellidos" class="form-label" >Ingres sus apellidos</label>
                                            <input type="text" id="apellidos" name="apellidos" class="form-control" value="${instructor.apellidos}"> 
                                        </div>

                                        <div class="mb-3">
                                            <label for="nombres" class="form-label">Ingrese sus nombres</label>
                                            <input type="text" id="nombres" name="nombres"class="form-control" value="${instructor.nombres}">
                                        </div>

                                        <div class="mb-3">
                                            <label for="direccion" class="form-label">Ingrese su  Direccion</label>
                                            <input type="text" id="direccion" name="direccion"class="form-control" values="${instructor.direccion}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="telefono" class="form-label">Ingrese su Telefono</label>
                                            <input type="telefono" id="telefono" name="telefono"class="form-control" value="${instructor.telefono}">
                                        </div>

                                        <input type="hidden" name="instructor_id" value="${instructor.instructor_id}" >
                                        <input type="hidden" name="accion" value="actualizar"> 
                                        

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Guardar</button>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>

                </div>      

            </div>

        </main>




        <jsp:include page="/WEB-INF/paginas/comunes/pie-pagina.jsp"/>
        <script src="./assets/js/jquery-3.6.0.js"></script>
        <script src="./assets/js/bootstrap.bundle.js"></script>
        
    </body>
</html>
