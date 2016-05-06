
<%@include file="../../util/conectionDB.jsp" %>
<%    String id_pedido = (String) request.getParameter("id_pedido");
    String id_usuario = (String) request.getParameter("id_usuario");

    SQL = " update  pedido set estado = '3' where id = '" + id_pedido + "' ";

    int a = scSQL.executeUpdate(SQL);

    SQL1 = " update  pedido_mesa set estado = '0' where id = '" + id_pedido + "' ";

    int aa = scSQL1.executeUpdate(SQL1);
%>

<script>

    cargarURL('pedido/listaPedidos.jsp?id_usuario=<%=id_usuario%>', 'content');
</script>
