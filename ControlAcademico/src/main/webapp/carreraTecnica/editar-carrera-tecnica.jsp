<%-- 
    Document   : listarCarreraTecnica
    Created on : 29/08/2021, 08:33:00 AM
    Author     : Carlos Adolfo Alvarez Crúz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="./assets/css/bootstrap.css">
<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" href="assets/css/style-css.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Glory:ital,wght@1,200;1,500&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="./assets/css/style-css.css"/>
        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrera Tecnica</title>
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
                            <form method="POST" action="${pageContext.request.contextPath}/ServletCarreraTecnica">
                                <div class="modal-body">

                                    <div class="mb-3">
                                        <label for="codigoCarrera" class="form-label">Codigo de la carrera</label>
                                        <input type="text" id="codigoCarrera" name="codigoCarrera" class="form-control" value="${carreratecnica.codigoCarrera}">
                                    </div>

                                    <div class="mb-3">
                                        <label form="nombre" class="form-label" >nombre de la carrera</label>
                                        <input type="text" id="nombre" name="nombre" class="form-control" value="${carreratecnica.nombre}">
                                    </div>
                                    
                                    <input type="hidden" name="codigoCarrera" value="${salon.codigoCarrera}">

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
</html>
