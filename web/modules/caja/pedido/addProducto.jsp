
<%@include file="../../util/conectionDB.jsp" %>
<% String id_producto = (String) request.getParameter("id_producto");
    String id_pedido = (String) request.getParameter("id_pedido");
    String precio = (String) request.getParameter("precio");
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
            + "  estado_cobro ,id "
            + " )"
            + " values"
            + " (" + id_pedido + ", "
            + " " + id_producto + ", "
            + " '1', "
            + " '" + precio + "', "
            + " '" + precio + "', "
            + " '0.0', "
            + " '0.0', "
            + " '0', "
            + " '0', "
            + " '0', "
            + " '0', '111' 	) ";

    out.println(">>>>>>>  "+SQL);
    
    int a = scSQL.executeUpdate(SQL);
%>

<script>
    
    cargarURL('pedido/reporteProductosEnPedido.jsp?id_pedido=<%=id_pedido%>', 'idContenedorProdutoPedidos') ;
</script>
