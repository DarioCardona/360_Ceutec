<%-- 
    Document   : addUniversidad
    Created on : 11-04-2017, 09:41:20 PM
    Author     : Darío Cardona
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int contador = 0;
            try {
                DatabaseConnection db = new DatabaseConnection(application.getRealPath(""));
                db.connect();
                
                 if (request.getParameter("universidad") != null) {
                     String insert = request.getParameter("universidad");
                 contador = db.query.executeUpdate("INSERT INTO Universidad (Nombre) VALUES ('" + insert + "' );");
                
                 }
                
                db.commit();
                db.disconnect();
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (contador == 1) {
                     request.getRequestDispatcher("createSU.jsp?msj=Campus ingresado exitosamente").forward(request, response);
                    JOptionPane.showMessageDialog(null,"");
                } else{
                   request.getRequestDispatcher("createSU.jsp?msj=Ha occurido un error").forward(request, response);
                    //JOptionPane.showMessageDialog(null,"");
                }
            //request.getRequestDispatcher("create.jsp").forward(request, response);
           
        %>
        
    </body>
</html>
