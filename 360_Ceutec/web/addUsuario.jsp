<%-- 
    Document   : addUsuario
    Created on : 11-06-2017, 03:17:26 PM
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

                    
                   request.getParameter("password");
                    String insert2 ="";
                    db.query.execute("SELECT Id_Carrera   " 
                    + "FROM  Carrera WHERE Nombre ='"+request.getParameter("user_study")+"';");
                    ResultSet rs1 = db.query.getResultSet();
                    while(rs1.next()){
                       insert2 = rs1.getString(1);
                    }
                   if (request.getParameter("password") != null && insert2 != "" && request.getParameter("username")!= null && request.getParameter("mail")!= null  ) {
                    contador = db.query.executeUpdate("INSERT INTO Usuario (Id_Usuario,Password,Rol,Id_Carrera,Correo) VALUES ("+ request.getParameter("username")+",'" + request.getParameter("password") + "',"+ request.getParameter("tipo_roll")+","+insert2+",'"+request.getParameter("mail")+"' );");
                    } 

                db.commit();
                db.disconnect();
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (contador == 1) {
                 request.getRequestDispatcher("createSU.jsp?msj=Usuario ingresado exitosamente").forward(request, response);
                //JOptionPane.showMessageDialog(null, "");
            } else {
                 request.getRequestDispatcher("createSU.jsp?msj=Ha occurido un error").forward(request, response);
                //JOptionPane.showMessageDialog(null, "Ha occurido un error");
            }
            //request.getRequestDispatcher("create.jsp").forward(request, response);
           
        %>
    </body>
</html>
