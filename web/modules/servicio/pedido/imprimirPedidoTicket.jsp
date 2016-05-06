<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.net.Socket"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.PrintWriter"%>
<%@include file="../../util/conectionDB.jsp" %>

<%    String URL = "";
    String msj = "";

    PrintWriter pwr = null;
    BufferedReader br = null;

    //Date DtActual = new Date();
    FileWriter fichero = null;
    String id_usuario = (String) request.getParameter("id_usuario");
    String id_pedido = (String) request.getParameter("id_pedido");

    String ticket = "";

    SQL1 = "SELECT grupo FROM pedido_destalle WHERE id_pedido ='" + id_pedido + "' AND estado_pedido ='T' GROUP BY grupo ";

    rs1 = scSQL1.executeQuery(SQL1);

    while (rs1.next()) {

        String grupo =  rs1.getObject("grupo").toString();
        
        String espacio = " \n \n ";

        String pedidos = "";

//        SQL4 = " SELECT * FROM pedido_destalle WHERE id_pedido ='" + id_pedido + "' and grupo = '" + grupo + "' ";
        SQL4 = "SELECT * FROM pedido_destalle pe INNER JOIN producto pro ON pro.id = pe.id_producto WHERE id_pedido ='" + id_pedido + "' and grupo = '" + grupo + "' ";

        rs4 = scSQL4.executeQuery(SQL4);

        int num = 0;

        while (rs4.next()) {
            num++;
            pedidos = pedidos + " \n " + num + ".- " + rs4.getObject("nombre").toString() + "  " + rs4.getObject("cantidad_producto");

        }

        String espacio2 = " \n \n \n ";

        ticket = ticket + "GRUPO"+ grupo + espacio + pedidos + espacio2;

    }

    SQL5 = "update pedido_destalle set estado_pedido='P' WHERE id_pedido ='" + id_pedido + "'";

    int dd = scSQL5.executeUpdate(SQL5);

    out.println(ticket);

//    try {
//
//        String texto = "ELVIS GUNCIONA....!!!!";
//        Socket soc = new Socket("192.168.1.44", 7654);
//        pwr = new PrintWriter(new BufferedWriter(new OutputStreamWriter(soc.getOutputStream())), true);
//        br = new BufferedReader(new InputStreamReader(soc.getInputStream()));
//        pwr.println(texto);
//        pwr.close();
//
//    } catch (Exception e) {
//        out.print("<center style='color:red'>" + "Tiketera no esta habilitado" + "</center>");
////        URL = "3; url=index.jsp";
//    }

%>


<html>
    <head>
        <link rel="stylesheet" media="screen" href="../../style01.css" type="text/css"> 
    </head>
    <body bgcolor="#FFFFFF">
        <h1>IMPRIMIENDO BOLETA</h1>
        <h4><%=ticket%></h4>
        <script>

            cargarURL('pedido/listaPedidos.jsp?id_usuario=<%=id_usuario%>', 'content')
        </script>

    </body>
</html>
