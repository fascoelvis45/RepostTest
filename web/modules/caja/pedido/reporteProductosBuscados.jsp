<%@include file="../../util/conectionDB.jsp" %>

 
<table class="table table-bordered  ">
    <%
        String dato = (String) request.getParameter("dato");
String id_pedido = (String) request.getParameter("id_pedido");
        SQL = "  SELECT * FROM PRODUCTO WHERE nombre LIKE '%" + dato + "%' AND estado ='1' ";
        rs = scSQL.executeQuery(SQL);
         
        while (rs.next()) {

    %>
    <tr>
        <td> <%=rs.getObject("nombre")%></td>
        <td> <%=rs.getObject("precio")%></td>
        
        <td> <button class="btn btn-success" onclick="cargarURL('pedido/addProducto.jsp?id_pedido=<%=id_pedido%>&id_producto=<%=rs.getObject("id")%>&precio=<%=rs.getObject("precio")%>', 'idContenedorProdutoPedidos')" ><samp><i class="fa fa-plus" /> </samp></button>  </td>
    </tr>
    <%}%>
</table>