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
    String serie = (String) request.getParameter("serie");
    String dni = (String) request.getParameter("dni");
    String direccion = (String) request.getParameter("direccion");
    String nomCliente = (String) request.getParameter("nomCliente");
    String id_comprobante_serie = "";
    int num_serie = 0;

    String com_total = "";
    String com_sub_total = "";
    String com_igv = "";

    String com_uni_total = "";
    String com_uni_sub_total = "";
    String com_uni_igv = "";

    SQL = " SELECT numeracion, id FROM comprobante_serie WHERE estado = '1' AND serie ='B001' ";

    rs = scSQL.executeQuery(SQL);

    while (rs.next()) {
        num_serie = Integer.parseInt(rs.getObject("numeracion").toString());
        id_comprobante_serie = rs.getObject("id").toString();
    }
    num_serie++;

    SQL2 = " UPDATE comprobante_serie SET numeracion = '" + num_serie + "' WHERE id  = '" + id_comprobante_serie + "'";
    int aa = scSQL2.executeUpdate(SQL2);

    SQL2 = " UPDATE pedido SET estado = '0' WHERE id  = '" + id_pedido + "'";
    int bb = scSQL2.executeUpdate(SQL2);

    SQL2 = " UPDATE pedido_mesa SET estado = '0' WHERE id  = '" + id_pedido + "'";
    int cc = scSQL2.executeUpdate(SQL2);

    SQL7 = " SELECT SUM(precio_total) total,SUM(igv_total) igv,(SUM(precio_total)- SUM(igv_total)) sub_total  FROM pedido_destalle WHERE id_pedido = '" + id_pedido + "'";

    rs7 = scSQL7.executeQuery(SQL7);

    if (rs7.next()) {

        com_total = rs7.getObject("total").toString();
        com_sub_total = rs7.getObject("sub_total").toString();
        com_igv = rs7.getObject("igv").toString();

    }

    SQL3 = " INSERT INTO comprobante ("
            + " id, "
            + " nombre_cliente,"
            + " direccion,"
            + " documento_identidad,"
            + " serie,"
            + " numero_serie,"
            + " fecha,"
            + " id_pedido,"
            + " sub_total,"
            + " total,"
            + " IGV,"
            + " tipo_doc"
            + " ) "
            + " VALUES "
            + " ('111', "
            + " '" + nomCliente + "',  "
            + " '" + direccion + "',  "
            + " '" + dni + "',  "
            + " '" + serie + "',  "
            + " '" + num_serie + "',  "
            + " sysdate(),  "
            + " '" + id_pedido + "',  "
            + " FORMAT('" + com_sub_total + "',2),  "//sub_total
            + " FORMAT('" + com_total + "',2),  "//total
            + " FORMAT('" + com_igv + "',2),  "//igv
            + " '03' "//tipo_doc
            + " )";
    int i = scSQL3.executeUpdate(SQL3);

    SQL4 = " SELECT * FROM pedido_destalle WHERE id_pedido ='" + id_pedido + "' ";

    rs4 = scSQL4.executeQuery(SQL4);
    String id_comprobante = "";
    while (rs4.next()) {

        SQL5 = " SELECT id FROM comprobante WHERE serie ='" + serie + "' AND numero_serie = '" + num_serie + "' ";
        rs5 = scSQL.executeQuery(SQL5);
        while (rs5.next()) {
            id_comprobante = rs5.getObject("id").toString();
        }

        SQL6 = "INSERT INTO comprobante_detalle  "
                + " VALUES "
                + " ('111',  "
                + " '" + id_comprobante + "',  "
                + " '" + id_pedido + "',  "
                + " '" + rs4.getObject("id").toString() + "',  "
                + " '" + rs4.getObject("id_producto").toString() + "',  "
                + " '" + rs4.getObject("cantidad_producto").toString() + "',  "
                + " FORMAT('" + rs4.getObject("igv_unitario").toString() + "',2),  "
                + " FORMAT( FORMAT('" + rs4.getObject("precio_total").toString() + "',2) -  FORMAT('" + rs4.getObject("igv_total").toString() + "',2)  ,2),  "
                + " FORMAT('" + rs4.getObject("igv_total").toString() + "',2),  "
                + " FORMAT('" + rs4.getObject("precio_total").toString() + "',2) "
                + " ) ";

        scSQL6.executeUpdate(SQL6);

    }

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
        <script>
            cargarURL('pedido/listaPedidos.jsp?id_usuario=<%=id_usuario%>', 'content')
        </script>

    </body>
</html>
