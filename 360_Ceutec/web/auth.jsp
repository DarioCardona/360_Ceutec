<%-- 
    Document   : auth
    Created on : 11-04-2017, 09:39:30 PM
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
            try {
                DatabaseConnection db = new DatabaseConnection(application.getRealPath(""));
                db.connect();
                db.query.execute("SELECT Id_Usuario, Password, Rol, Estado, Id_Carrera FROM Usuario");
                ResultSet rs = db.query.getResultSet();
                boolean found = false;
                int userType = -1;
                boolean estado = false ;
                int Id_Carrera = -1 ;
                while (rs.next()) {
                    out.print(request.getParameter("user") );
                    if (request.getParameter("user").equals(rs.getString(1))
                            && request.getParameter("pass").equals(rs.getString(2))) {
                        found = true;
                        userType = Integer.parseInt(rs.getString(3));
                        estado = Boolean.valueOf(rs.getString(4));
                        Id_Carrera = Integer.parseInt(rs.getString(5));
                    }
                }
               
                db.query.execute("SELECT Id_Universidad FROM Carrera "
                        + "WHERE Id_Carrera ="+Id_Carrera+";");
                ResultSet rs1 = db.query.getResultSet();
                int universidad = 0;
                while(rs1.next()){
                    universidad = Integer.parseInt(rs1.getString(1));
                }
                if (found == true) {
                    session.setAttribute("session_usuario", request.getParameter("user"));
                    session.setAttribute("session_pass", request.getParameter("pass"));
                    session.setAttribute("session_rol", userType);
                    session.setAttribute("session_carrera", Id_Carrera );
                    session.setAttribute("session_universidad", universidad );
                    
                     if (estado == false) {
                       request.getRequestDispatcher("index2.jsp").forward(request, response); 
                    } 
                    if (userType == 0) {
                        request.getRequestDispatcher("createSU.jsp").forward(request, response);
                    } else if (userType == 1) {
                        request.getRequestDispatcher("tablaJefe.jsp").forward(request, response);
                    } else if (userType == 2) {                     
                        request.getRequestDispatcher("tablaCarrera.jsp").forward(request, response);
                    } else  if (userType == 3) {
                        request.getRequestDispatcher("tablaUsuario.jsp").forward(request, response);
                    } else{
                        out.print("<script>alert('Tipo de usuario invalido')</script>");
                    }
                } else {
                    //out.print("<script>alert('No se encuentra el usuario')</script>");
                    //JOptionPane.showMessageDialog(null, "No se encuentra el usuario" );
                    request.getRequestDispatcher("index.jsp?msj=No se encuentra el usuario").forward(request, response);
                }
                db.disconnect();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
