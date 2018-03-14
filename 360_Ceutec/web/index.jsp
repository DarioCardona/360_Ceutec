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
         <link rel="stylesheet" type="text/css" href="styles/sweetalert.css">
         <link rel="icon" type="image/png" href="logo.png">
        <link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    </head>
    <script src="md5.js"></script>
     <script src="styles/bootstrap-sweetalert/dist/sweetalert.min.js"></script>
    <% if (request.getParameter("msj")!= null) { %>
    <body class="redbg"> 
        <script>
             swal(" <% out.print(request.getParameter("msj") ); %> " );
        </script>    
    </body>    
      
    <% }  %>
    <body class="redbg">
        <form id= "mi_form" class="myform centered" action="auth.jsp" method="POST" autocomplete="off">
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
            <button class="btnred"   onclick="cifrar()">Iniciar sesión </button>
            <div class="container-extra"></div>
        </form>
        <script>
            function cifrar(){
                 var pass = document.getElementById("pass").value;
                 document.getElementById("pass").value = hex_md5(pass);
                // alert(document.getElementById("pass").value);
                document.forms["mi_form"].submit();
            }
           
        </script>
    </body>
</html>

