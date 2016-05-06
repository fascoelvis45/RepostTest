
<%@include file="../../util/conectionDB.jsp" %>
<%  
    String id_pedido = (String) request.getParameter("id_pedido");
     String id_usuario = (String) request.getParameter("id_usuario");
    
    SQL = " delete from pedido where id = '"+id_pedido+"' ";

    out.println(">>>>>>>  "+SQL);
    
    int a = scSQL.executeUpdate(SQL);
%>

<script>
    
    cargarURL('pedido/listaPedidos.jsp?id_usuario=<%=id_usuario%>', 'content') ;
</script>
