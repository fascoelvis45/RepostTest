
<%@include file="../../util/conectionDB.jsp" %>
<% String id_pedido_producto_detalle = (String) request.getParameter("id_pedido_detalle");
//    String id_pedido = (String) request.getParameter("id_pedido");
//    String precio = (String) request.getParameter("precio");
    SQL = " update pedido_destalle "
+ " set estado_preparacion = '2'"
+ " where id='"+id_pedido_producto_detalle+"' ; ";

    out.println(">>>>>>>  "+SQL);
    
    int a = scSQL.executeUpdate(SQL);
%>

<script>
    
    cargarURL('pedido/listaPedidos.jsp', 'content') ;
</script>
