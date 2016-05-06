<%@include file="../../util/conectionDB.jsp" %>

<%    
String id_usuario = (String) request.getParameter("id_usuario");
%>
<div class="col-md-12">

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
                PRECIO UNI.
            </th>
            <th>
                PRECIO TOTAL
            </th>
            <th>
                OPC
            </th>
        </tr>


        <%            int grup = 0;
            String id_pedido = (String) request.getParameter("id_pedido");
            SQL = "   SELECT x.id ,x.id_producto , x.cantidad_producto ,x.precio_total,x.precio_unitario, p.nombre, x.grupo FROM pedido_destalle x, producto p WHERE  x.id_pedido = '" + id_pedido + "' and x.id_producto = p.id  ";
            rs = scSQL.executeQuery(SQL);

            while (rs.next()) {

                if (grup != Integer.parseInt(rs.getObject("grupo").toString())) {
                    grup = grup + 1;

        %>

        <tr>
            <td colspan="5" ><b> Grupo : <%=rs.getObject("grupo")%></b> </td>
        </tr>
        <% }%>
        <tr>
            <td> | </td>
            <td> <%=rs.getObject("nombre")%></td>
            <td> <%=rs.getObject("cantidad_producto")%></td>
            <td> <%=rs.getObject("precio_unitario")%></td>
            <td> <%=rs.getObject("precio_total")%></td>

            <td> <button class="btn btn-danger" onclick="cargarURL('pedido/deletePedidoDetalle.jsp?id_pedido_detalle= <%=rs.getObject("id")%>&id_pedido=<%=id_pedido%>', 'idContenedorProdutoPedidos')"  > <span class="icon-row" >
                        <i class="fa fa-times"></i>
                    </span></button>  </td>
        </tr>
        <%}%>

    </table> 
    <div >

        <div id="idContenedorProdutoPedidos" class="box-body">
            <a class="btn btn-success btn-lg right"  onclick="cargarURL('pedido/imprimirPedidoTicket.jsp?id_pedido=<%=id_pedido%>&id_usuario=<%=id_usuario%>')" > <span class ="icon-row" >
                    <i class="fa fa-angle-double-left"></i>
                </span>Terminar Pedido ELXXVIS - <%=id_usuario%></a>
        </div> 
    </div>
</div> 
