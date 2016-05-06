<%@include file="../../util/conectionDB.jsp" %>


<table class="table table-bordered table-hover">
    <tr>
        <th>
            #
        </th>
        <th>
            PRODUCTO 
        </th>
        <th>
            CANTIDAD
        </th>
        <th>
            PRECIO
        </th>
        <th>
            OPC
        </th>
    </tr>


    <%

        String id_pedido = (String) request.getParameter("id_pedido");
        SQL = "   SELECT x.id ,x.id_producto , x.cantidad_producto ,x.precio_total, p.nombre FROM pedido_destalle x, producto p WHERE  x.id_pedido = '" + id_pedido + "' and x.id_producto = p.id  ";
        rs = scSQL.executeQuery(SQL);

        while (rs.next()) {

    %>
    <tr>
        <td> | </td>
        <td> <%=rs.getObject("nombre")%></td>
        <td> <%=rs.getObject("cantidad_producto")%></td>
        <td> <%=rs.getObject("precio_total")%></td>

        <td> <button class="btn btn-danger" onclick="cargarURL('pedido/deletePedidoDetalle.jsp?id_pedido_detalle= <%=rs.getObject("id")%>&id_pedido=<%=id_pedido%>', 'idContenedorProdutoPedidos')"  > <span class="icon-row" >
                    <i class="fa fa-times"></i>
                </span></button>  </td>
    </tr>
    <%}%>
</table>