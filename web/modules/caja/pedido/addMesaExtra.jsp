
<%@include file="../../util/conectionDB.jsp" %>
<% 
    String id_pedido = (String) request.getParameter("id_pedido");
    String id_mesa = (String) request.getParameter("id_mesa");
    String id_usuario = (String) request.getParameter("id_usuario");
    
    SQL = " insert into pedido_mesa  "
	+" values "
	+" ('111',  "
	+" '"+id_pedido+"',  "
	+" '"+id_mesa+"',  "
	+" '1' "
	+" ) ";

    out.println(">>>>>>>  "+SQL);
    
    int a = scSQL.executeUpdate(SQL);
%>

<script>
    
    cargarURL('pedido/listaPedidos.jsp?id_usuario=<%=id_usuario%>', 'content') ;
</script>
