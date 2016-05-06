
<%@include file="../../util/conectionDB.jsp" %>
<% String id_producto = (String) request.getParameter("id_producto");
 String id_usuario = (String) request.getParameter("id_usuario");
    String id_pedido = (String) request.getParameter("id_pedido");
    String precio = (String) request.getParameter("precio");
    String grupo = (String) request.getParameter("grupo");

    int group = 0;

    group = Integer.parseInt(grupo);

    SQL2 = " select * from pedido_destalle where id_pedido = '" + id_pedido + "' and id_producto = '" + id_producto + "' and grupo = '" + group + "' ";

    rs2 = scSQL2.executeQuery(SQL2);

    if (rs2.next()) {

        int cantidadProducto = Integer.parseInt((String) rs2.getObject("cantidad_producto"));
        float precioUnitario = Float.parseFloat((String) rs2.getObject("precio_unitario"));
        float igvUnitario = Float.parseFloat((String) rs2.getObject("igv_unitario"));

        SQL3 = " update pedido_destalle "
                + " set cantidad_producto = '" + (cantidadProducto + 1) + "' ,"
                + " precio_total =FORMAT('"+(precioUnitario * (cantidadProducto + 1))+"',2), "
                + " igv_total = FORMAT('"+(igvUnitario * (cantidadProducto + 1))+"',2) "
                + " where id =  '" + rs2.getObject("id") + "'";
        int a = scSQL3.executeUpdate(SQL3);

    } else {

        SQL = " insert into   pedido_destalle "
                + " ( id_pedido , "
                + " id_producto , "
                + "  cantidad_producto , "
                + "  precio_unitario , "
                + "  precio_total , "
                + "  igv_unitario , "
                + "  igv_total , "
                + "  estado_pedido , "
                + "  estado_preparacion , "
                + "  estado_entrega , "
                + "  estado_cobro,grupo ,"
                + "  id "
                + " )"
                + " values"
                + " (" + id_pedido + ", "
                + " " + id_producto + ", "
                + " '1', "
                + " FORMAT('" + precio + "',2), "
                + " FORMAT('" + precio + "',2), "
                + " FORMAT('" + Float.parseFloat(precio)*0.18 + "',2), "
                + " FORMAT('" + Float.parseFloat(precio)*0.18 + "',2), "
                + " 'T', "
                + " '0', "
                + " '0', "
                + " '0','" + (grupo) + "', '111' 	) ";

        out.println(">>>>>>>  " + SQL);

        int a = scSQL.executeUpdate(SQL);

    }


%>

<script>

    cargarURL('pedido/reporteProductosEnPedido.jsp?id_pedido=<%=id_pedido%>&id_usuario=<%=id_usuario%>', 'idContenedorProdutoPedidos');
</script>
