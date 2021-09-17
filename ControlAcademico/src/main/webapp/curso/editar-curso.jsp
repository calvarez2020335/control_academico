<%-- 
    Document   : listarCurso
    Created on : 29/08/2021, 08:32:31 AM
    Author     : Carlos Adolfo Alvarez Crúz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Glory:ital,wght@1,200;1,500&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="./assets/css/style-css.css"/>
        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="assets/css/style-css.css"/>
        <!-- bootsrap -->
        <link rel="stylesheet" href="./assets/css/bootstrap.css">

        <title>Listado de Cursos</title>

    </head>
    <body>
        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>

        <section id="actions" class="py-3 mb-3 bg-info bg-opacity-50">
            <div class="container">
                <div class="row">
                    <div class="col-3">
                        <a href="javascript:history.back()" class="btn btn-danger btn-block">
                            <i class="fa fa-arrow-left"></i> Regresar A Cursos
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
                            <form method="POST" action="${pageContext.request.contextPath}/ServletCurso">
                                <div class="modal-body bg-black text-dark">

                                    <div class="form-floating mb-3">
                                        <input type="number" id="ciclo" name="ciclo" class="form-control" placeholder="Ciclo" value="${curso.ciclo}">
                                        <label for="ciclo" class="form-label">Ciclo</label>  
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input type="number" id="cupo_maximo" name="cupo_maximo" class="form-control" placeholder="Cupo maximo" value="${curso.cupo_maximo}">
                                        <label for="cupo_maximo" class="form-label">Cupo maximo</label>  
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input type="number" id="cupo_minimo" name="cupo_minimo" class="form-control" placeholder="Cupo minimo" value="${curso.cupo_minimo}">
                                        <label for="cupo_minimo" class="form-label">Cupo minimo</label>  
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input type="text" id="descripcion" name="descripcion" class="form-control" placeholder="Descripcion" value="${curso.descripcion}">  
                                        <label for="descripcion" class="form-label">Descripcion</label>                        
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input type="text" id="codigo_carrera" name="codigo_carrera" class="form-control" placeholder="Codigo carrera" value="${curso.codigo_carrera}">  
                                        <label for="codigo_carrera" class="form-label">Codigo carrera</label>  
                                        <a href="${pageContext.request.contextPath}/ServletCarreraTecnica?accion=listar" class="link-light">¿Cual el codigo de mi carrera? <i class="far fa-question-circle"></i></a>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input type="number" id="horario_id" name="horario_id" class="form-control" placeholder="Horario id" value="${curso.horario_id}">
                                        <label for="horario_id" class="form-label">Horario id</label>
                                        <a href="${pageContext.request.contextPath}/ServletHorario?accion=listar" class="link-light">¿Cual es mi id horario?  <i class="far fa-question-circle"></i></a>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input type="number" id="instructor_id" name="instructor_id" class="form-control" placeholder="Instructor id" value="${curso.instructor_id}">
                                        <label for="instructor_id" class="form-label">Instructor id</label>
                                        <a href="${pageContext.request.contextPath}/ServletInstructor?accion=listar" class="link-light">¿Cual es mi instructor id?  <i class="far fa-question-circle"></i></a>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input type="number" id="salon_id" name="salon_id" class="form-control" placeholder="Salon id" value="${curso.salon_id}">
                                        <label for="salon_id" class="form-label">Salon id</label>
                                        <a href="${pageContext.request.contextPath}/ServletSalon?accion=listar" class="link-light">¿Cual es el id de mi salon? <i class="far fa-question-circle"></i></a>
                                    </div>

                                    <input type="hidden"  name="accion" value="actualizar">
                                    <input type="hidden" name="curso_id" value="${curso.curso_id}">


                                </div>
                                <div class="modal-footer p-1">
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