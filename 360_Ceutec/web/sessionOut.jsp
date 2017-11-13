<%-- 
    Document   : sessionOut
    Created on : 11-12-2017, 12:45:07 PM
    Author     : Darío Cardona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.setAttribute("session_usuario", null);
                    session.setAttribute("session_pass", null);
                    session.setAttribute("session_rol",null);
                    session.setAttribute("session_carrera", null );
                    session.setAttribute("session_universidad", null );
                     request.getRequestDispatcher("index.jsp").forward(request, response);
            %>
    </body>
</html>
