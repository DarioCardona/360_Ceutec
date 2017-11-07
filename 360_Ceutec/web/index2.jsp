<%-- 
    Document   : index2
    Created on : 11-04-2017, 08:36:32 AM
    Author     : Darío Cardona
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>360 CEUTEC</title>
        <link rel="stylesheet" href="styles/style.css">
        <link rel="stylesheet" href="styles/bootstrap-css/css/bootstrap.min.css">
        <link rel="stylesheet" href="styles/bootstrap3-dialog/dist/css/bootstrap-dialog.min.css">
        <link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    </head>
    <body class="redbg">
        <form class="myform centered" action="cambiarPass.jsp" method="POST">
            
            <img src="ceutec.jpg" width="300px">
            <h1>Cambiar Contraseña</h1>
            <label class="lb" for="pass">Contraseña Anterior</label>
            <br>
            <input type="password" name="pass1" id="pass1"/>
            <br>
            <label class="lb" for="pass"> Nueva Contraseña</label>
            <br>
            <input type="password" name="pass2" id="pass2"/>
            <br>
            <label class="lb" for="pass"> Confirmar Contraseña</label>
            <br>
            <input type="password" name="pass3" id="pass3"/>
            <br><br>
            <input class="btnred" type="submit" value="Cambiar Contraseña"  />
            
        </form>
      
    </body>
</html>