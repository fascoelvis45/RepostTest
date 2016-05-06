<%-- 
    Document   : conectionDB
    Created on : 07-feb-2016, 23:23:42
    Author     : Elvis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %>

        <%  Connection conConexion;
            Statement scSQL, scSQL1, scSQL2, scSQL3, scSQL4, scSQL5, scSQL6,scSQL7;
            ResultSet rs, rs1, rs2, rs3,rs4,rs5,rs6,rs7;
            ResultSetMetaData lsDatos;
            String SQL = "";
            String SQL1 = "";
            String SQL2 = "";
            String SQL3 = "";
            String SQL4 = "";
            String SQL5 = "";
            String SQL6 = "";
            String SQL7 = "";

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conConexion = DriverManager.getConnection("jdbc:mysql://localhost/restaurante",
                    "root", "");
            scSQL = conConexion.createStatement();
            scSQL1 = conConexion.createStatement();
            scSQL2 = conConexion.createStatement();
            scSQL3 = conConexion.createStatement();
            scSQL4 = conConexion.createStatement();
            scSQL5 = conConexion.createStatement();
            scSQL6 = conConexion.createStatement();
            scSQL7 = conConexion.createStatement();



            /*
             * rs = scSQL.executeQuery("SELECT nombre FROM persona_dato");
             * lsDatos = rs.getMetaData(); while (rsListaRegistros.next()) {
             * rsListaRegistros.getObject("nombre"); }
             */
        %>

    </body>
</html>
