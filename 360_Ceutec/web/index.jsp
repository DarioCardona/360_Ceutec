<%-- 
    Document   : index
    Created on : 11-04-2017, 08:06:33 AM
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
        <form class="myform centered" action="auth.jsp" method="POST">
            <div class="container-extra"></div>
            <img src="ceutec.jpg" width="300px">
            <h1>Iniciar sesión</h1>
            <label class="lb" for="user">TH de usuario</label>
            <br>
            <input type="text" name="user" id="user"/>
            <br>
            <label class="lb" for="pass">Contraseña</label>
            <br>
            <input type="password" name="pass" id="pass"/>
            <br><br>
            <input class="btnred" type="submit" value="Iniciar sesión"  />
            <div class="container-extra"></div>
        </form>
      
    </body>
</html>

