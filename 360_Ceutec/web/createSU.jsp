<%-- 
    Document   : createSU
    Created on : 11-04-2017, 10:23:01 AM
    Author     : Darío Cardona
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>  
        /* Style the tab content */
        .tabcontent {
            display: none;
            padding: 6px 12px;
            -webkit-animation: fadeEffect 1s;
            animation: fadeEffect 1s;
        }
        /* Fade in tabs */
        @-webkit-keyframes fadeEffect {
            from {opacity: 0;}
            to {opacity: 1;}
        }

        @keyframes fadeEffect {
            from {opacity: 0;}
            to {opacity: 1;}

        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>360 CEUTEC</title>
        <link rel="stylesheet" href="styles/style.css">
        <link rel="stylesheet" href="styles/bootstrap-css/css/bootstrap.min.css">
        <link rel="stylesheet" href="styles/bootstrap3-dialog/dist/css/bootstrap-dialog.min.css">
        <link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    </head>
    <body class="redbg">
        <%
            /*if (session.getAttribute("session_user") == null) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }*/
            DatabaseConnection db = new DatabaseConnection(application.getRealPath(""));
            db.connect();
            db.query.execute("SELECT Nombre   " // para el filtro de vendor
                    + "FROM  Universidad ");
            ResultSet rs1 = db.query.getResultSet();
            
            db.query.execute("SELECT Nombre   " // para el filtro de vendor
                    + "FROM  Carrera ");
            ResultSet rs2 = db.query.getResultSet();
        %>
        <div>

            <div class="tab mynav col-md-12">
                <form class="nospace" action="backMain.jsp ">
                    <input class="col-md-1 btnred left tablinks" type="submit" value="Regresar"/>
                </form>
                <button class="col-md-1 left btnred2 tablinks" onclick="opentab(event, 'Usuario')">Usuario</button>
                <button class="col-md-1 left btnred2 tablinks" onclick="opentab(event, 'Carrera')">Carrera</button>
                <button class="col-md-1 left btnred2 tablinks" onclick="opentab(event, 'Universidad')">Universidad</button>
                <button class="col-md-1 left btnred2 tablinks" onclick="opentab(event, 'Formato')">Formato</button>

            </div>

            <div class="container-extra"></div>

            <div>


                <div id="Usuario" class="myform2 tabcontent centered tab-pane  tab-content"> 
                    <div class="container-extra"></div>
                    <form action = "addUsuario.jsp">
                        <h3>Crear Usuario</h3>
                        <br>
                        <div class="space"></div>
                        <div>
                            <label for="username">TH de usuario</label>
                            <br>
                            <input type="text" name="username">
                        </div>
                        <br>
                        <div>
                            <label for="password">Contraseña</label>
                            <br>
                            <input type="password" name="password">
                        </div>
                        <div>
                            <label class="lb2">Carrera</label>
                            <br>
                            <input class="input_register"  id = "user_study" list="browsers3" name="user_study">
                            <datalist id="browsers3">
                                 <% while (rs2.next()) {%> 
                                <option ><%=rs2.getString(1)%></option>
                                <% }%>
                            </datalist>
                        </div>
                        <div>
                            <label for="tipo_roll">Roll</label>
                            <br>
                            <select id="tipo_roll" name="tipo_roll">
                                <option value="3">Docente </option>
                                <option value="2">Jefe de Carrera </option>
                                <option value="1">Jefatura </option>
                                <option value="0">Administrador</option>    
                            </select>
                        </div>
                        
                        <input class="btnred" type="submit" value="Agregar Usuario"/>
                    </form>
                    <div class="container-extra"></div>
                </div>




                <div id="Carrera" class="myform2 tabcontent centered tab-pane  tab-content">
                    <div class="container-extra"><br><br></div>
                    <form action = "addCarrera.jsp">
                        <h3>Crear Carrera</h3>
                        <div class="space"></div>
                        <div>
                            <label for="carrera">Nombre de la Carrera</label>
                            <br>
                            <input type="text" name="carrera">
                        </div>
                        <div>
                            <label class="lb2">Universidad</label>
                            <br>
                            <input class="input_register"  id = "carrera_uni" list="browsers4" name="carrera_uni">
                            
                            <datalist id="browsers4">
                                <% while (rs1.next()) {%> 
                                <option ><%=rs1.getString(1)%></option>
                                <% }%>
                            </datalist>
                        </div>
                        
                        <input class="btnred" type="submit" value="Crear nueva Carrera"/>
                    </form>
                    <div class="container-extra"><br><br></div>
                </div>



                <div id="Universidad" class="tabcontent myform2 centered tab-pane   tab-content">
                    <div class="container-extra"><br><br></div>
                    <form action = "addUniversidad.jsp">
                        <h3>Crear Univeridad</h3>
                        <div class="space"></div>
                        <div>
                            <label for="warehouseName">Nombre de la Univeridad</label>
                            <br>
                            <input type="text" name="universidad">
                        </div>
                        <br>
                        <input class="btnred" type="submit" value="Crear Universidad"/>
                    </form>
                    <div class="container-extra"><br><br></div>
                </div>




                <div id="Formato" class="tabcontent myform2 centered tab-pane   tab-content">
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
                           <input class="input_register"  id = "estructura_uni" list="browsers4" name="estructura_uni">
                            
                            <datalist id="browsers4">
                                <% while (rs1.next()) {%> 
                                <option ><%=rs1.getString(1)%></option>
                                <% }%>
                            </datalist>

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

        <script>
            document.getElementById("Usuario").style.display = "block";
            opentab(event, 'Usuario');
            function opentab(evt, cityName) {
                //alert(evt);
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += "active";
            }


            function search_b() {
                var input, filter, table, tr, td, i;
                input = document.getElementById("Search");
                filter = input.value.toUpperCase();
                table = document.getElementById("PerformanceTable");
                tr = table.getElementsByTagName("tr"),
                        th = table.getElementsByTagName("th");

                // Loop through all table rows, and hide those who don't match the        search query
                for (i = 1; i < tr.length; i++) {
                    tr[i].style.display = "none";
                    for (var j = 0; j < th.length; j++) {
                        td = tr[i].getElementsByTagName("td")[j];
                        if (td) {
                            if (td.innerHTML.toUpperCase().indexOf(filter.toUpperCase()) > -1) {
                                tr[i].style.display = "";
                                break;
                            }
                        }
                    }
                }
            }
        </script>
    </body>
</html>

