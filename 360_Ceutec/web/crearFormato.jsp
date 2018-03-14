<%-- 
    Document   : crearFormato
    Created on : 11-13-2017, 11:40:06 AM
    Author     : Darío Cardona
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DatabaseConnection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>360 CEUTEC </title>
        <link rel="stylesheet" href="styles/style.css">
        <link rel="stylesheet" href="styles/bootstrap-css/css/bootstrap.min.css">
        <link rel="stylesheet" href="styles/bootstrap3-dialog/dist/css/bootstrap-dialog.min.css">
        <link rel="icon" type="image/png" href="logo.png">
        <link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    </head>
    <body>
        <%
            DatabaseConnection db = new DatabaseConnection(application.getRealPath(""));
            db.connect();
            db.query.execute("SELECT u.Nombre, Periodo, Modulo, Año, Indicador_1,Indicador_2,Indicador_3,Indicador_4,"
                    + "Indicador_5,Indicador_6,Indicador_7,Indicador_8,Indicador_9,Indicador_10 "
                    + "FROM Estructura m "
                    + "inner join Universidad u  on m.Id_Universidad = u.Id_Universidad "
                    + "WHERE Id_Estructura = " + request.getParameter("id_e") + ";");
            ResultSet rs = db.query.getResultSet();
        %>
        
        <div id="Formato" class="tabcontent myform2 centered tab-pane   tab-content">
            <form class="nospace" action="tablaCarrera.jsp ">
                    <input class="col-md-1 btnred left tablinks" type="submit" value="Regresar"/>
         </form>
            <div class="container-extra"></div>
            <form action = "addEstructura.jsp">
                <h3>Crear Formato</h3>
                <!--*********************  Table start  *********************-->
                <div class="col-md-4">
                    <label>Periodo </label>
                    <br>
                    <select class="sel" id="periodo_select" name="periodo_select">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="4">4</option>
                        <option value="4">5</option>
                    </select>
                    <br>
                    <label class="left">Modulo </label>
                    <br>
                    <select class="sel" id="modulo_selector"  name="modulo_selector">
                        <option value="1">1</option>
                        <option value="2">2</option>

                    </select>
                    <br>
                    <label class="left">Año </label>
                    <br>
                    <input class="input_register"  id = "anio"  type="number" name="anio" min="2017" max="2022">
                    <br>
                    <label class="lb2">Universidad</label>
                    <br>
                    <input class="input_register"  id = "estructura_uni" list="browsers4" name="estructura_uni" readonly="">



                </div>

                <!--************* Column 1 *************-->
                <div class="col-md-4">

                    <label class="lb2">Indicador 1</label>
                    <br>
                    <input class="input_register"  id = "indicador_1" type="text" name="indicador_1">

                    <br>
                    <label class="lb2">Indicador 2</label>
                    <br>
                    <input class="input_register" id = "indicador_2" type="text"  name="indicador_2">

                    <br>
                    <label class="lb2">Indicador 3</label>
                    <br>
                    <input class="input_register" id = "indicador_3" type="text"  name="indicador_3" >  

                    <br>
                    <label class="lb2">Indicador 4</label>
                    <br>
                    <input class="input_register" id = "indicador_4" type="text"  name="indicador_4">

                    <br>
                    <label class="lb2">Indicador 5</label>
                    <br>
                    <input class="input_register" id = "indicador_5" type="text"  name="indicador_5">  


                </div>

                <!--************* Column 2 *************-->
                <div class="col-md-4">
                    <label class="lb2">Indicador 6</label>
                    <br>
                    <input class="input_register"  id = "indicador_6" type="text" name="indicador_6">

                    <br>
                    <label class="lb2">Indicador 7</label>
                    <br>
                    <input class="input_register" id = "indicador_7" type="text"  name="indicador_7">

                    <br>
                    <label class="lb2">Indicador 8</label>
                    <br>
                    <input class="input_register" id = "indicador_8" type="text"  name="indicador_8" >  

                    <br>
                    <label class="lb2">Indicador 9</label>
                    <br>
                    <input class="input_register" id = "indicador_9" type="text"  name="indicador_9">

                    <br>
                    <label class="lb2">Indicador 10</label>
                    <br>
                    <input class="input_register" id = "indicador_10" type="text"  name="indicador_10"> 
                </div>
                <br>
                <br>
                <br>
                <br>
                <div class="container-extra">
                    <div class="container-extra">
                        <div class="container-extra"> <div class="container-extra">

                                <div class="col-md-12">  
                                    <center>
                                        <input class="btnred" type="submit" value="Crear nuevo Formato"/>
                                    </center>
                                </div>   
                                </form>
                                <div class="container-extra"><br> <br></div>
                            </div>                
                        </div>
                    </div>
                </div>
        </div>
                <script>
                    <% while (rs.next()){  %>
                    document.getElementById("periodo_select").value = <%=rs.getString(2)%> ;
                    document.getElementById("modulo_selector").value =  <%=rs.getString(3)%> ;
                    document.getElementById("anio").value =  <%=rs.getString(4)%> ;
                    document.getElementById("estructura_uni").value = "<%=rs.getString(1)%>" ;
                    document.getElementById("indicador_1").value =  "<%=rs.getString(5)%>" ;
                    document.getElementById("indicador_2").value = "<%=rs.getString(6)%>" ;
                    document.getElementById("indicador_3").value = "<%=rs.getString(7)%>" ;
                    document.getElementById("indicador_4").value = "<%=rs.getString(8)%>" ;
                    document.getElementById("indicador_5").value = "<%=rs.getString(9)%>" ;
                    if ("<%=rs.getString(10)%>" != "null") {
                        document.getElementById("indicador_6").value = "<%=rs.getString(10)%>" ;
                    }
                    if ("<%=rs.getString(11)%>" != "null") {
                         document.getElementById("indicador_7").value =  "<%=rs.getString(11)%>";
                    }
                    if ("<%=rs.getString(12)%>" != "null") {
                        document.getElementById("indicador_8").value = "<%=rs.getString(12)%>" ;
                    }
                    if ("<%=rs.getString(13)%>" != "null") {
                        document.getElementById("indicador_9").value =  "<%=rs.getString(13)%>";
                    }
                    if ("<%=rs.getString(14)%>" != "null") {
                         document.getElementById("indicador_10").value = "<%=rs.getString(14)%>" ;
                    }                           
                   <% }%>
                </script>    
     </body>
</html>
