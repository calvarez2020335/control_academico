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
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Glory:ital,wght@1,200;1,500&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="./assets/css/style-css.css"/>
        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script>
        <link rel="stylesheet" href="assets/css/style-css.css"/>
        <!-- bootsrap -->
        <link rel="stylesheet" href="./assets/css/bootstrap.css">

        <title>Listado de horarios</title>

    </head>
    <body>
        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>


        <section id="actions" class="py-3 mb-3 bg-info bg-opacity-50">
            <div class="container">
                <div class="row">
                    <div class="col-3">
                        <a href="javascript:history.back()" class="btn btn-danger btn-block">
                            <i class="fa fa-arrow-left"></i> Regresar A Salones
                        </a>
                    </div>
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                    </div>                
                </div>
            </div>
        </section>


        <main class="container pb-5">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header bg-secondary bg-opacity-75 text-white">
                            <h4>Editar Salones</h4>
                        </div>
                        <div class="card-body bg-dark bg-opacity-75  text-white">
                            <form method="POST" action="${pageContext.request.contextPath}/ServletHorario">
                                <div class="modal-body">

                                    <div class="mb-3">
                                        <label form="horarioFinal" class="form-label" >Horario De Fin </label>
                                        <input type="time" id="horarioFinal" name="horarioFinal" class="form-control" value="${horario.horarioFinal}">
                                    </div>

                                    <div class="mb-3">
                                        <label for="horarioInicio" class="form-label">Horarios de inicio</label>
                                        <input type="time" id="horarioInicio" name="horarioInicio" class="form-control" value="${horario.horarioInicio}">                         
                                    </div>
                                    <input type="hidden" name="horarioId" value="${horario.horarioId}">

                                    <input type="hidden"  name="accion" value="actualizar">                           

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    <button type="submit" class="btn btn-success">Guardar</button>                    
                                </div>
                            </form>
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
