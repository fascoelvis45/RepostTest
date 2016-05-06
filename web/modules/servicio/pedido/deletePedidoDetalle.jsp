
<%@include file="../../util/conectionDB.jsp" %>
<% String id_pedido_detalle = (String) request.getParameter("id_pedido_detalle");
    String id_pedido = (String) request.getParameter("id_pedido");
    
    SQL = " delete from pedido_destalle where id = '"+id_pedido_detalle+"' ";

    out.println(">>>>>>>  "+SQL);
    
    int a = scSQL.executeUpdate(SQL);
%>

<script>
    
    cargarURL('pedido/reporteProductosEnPedido.jsp?id_pedido=<%=id_pedido%>', 'idContenedorProdutoPedidos') ;
</script>
