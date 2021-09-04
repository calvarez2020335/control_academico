<%-- 
    Document   : index
    Created on : 29/08/2021, 07:19:03 AM
    Author     : Carlos Adolfo Alvarez Crúz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control Academico - inicio</title>
    </head>
    <body>
        <h1>Control Academico</h1>
        <a href="${pageContext.request.contextPath}/ServletCurso?accion=listar">Listar Cursos</a> <br>
        <a href="${pageContext.request.contextPath}/ServletSalon?accion=listar">Listar Salones</a>  <br>
        <a href="${pageContext.request.contextPath}/ServletCarreraTecnica?accion=listar">Listar Carrera tecnica</a> <br>
        <a href="${pageContext.request.contextPath}/ServletHorario?accion=listar">Listar Horario</a> <br>
        <a href="${pageContext.request.contextPath}/ServletInstructor?accion=listar">Listar instructor</a> <br> <br>
        
        
        <a href="${pageContext.request.contextPath}/ServletAsigAlumno?accion=listar">Listar Asignacion de alumnos</a> <br>
        <a href="${pageContext.request.contextPath}/ServletAlumno?accion=listar">Listar alumnos</a> <br>
          
        <h4>Borrar primero las entidades debiles, para que no ocurra un error con las llaves foraneas</h4>
        
    </body>
</html>
