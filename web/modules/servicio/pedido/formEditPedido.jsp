<%@include file="../../util/conectionDB.jsp" %>

<section class="content">
    <div class="row">
        <!-- left column --><%            String id_pedido = (String) request.getParameter("id_pedido");  %>
        <div class="col-md-6">

            <div class="box">

                <%

                    String id_usuario = (String) request.getParameter("id_usuario");
                    String id_mesa = (String) request.getParameter("id_mesa");
                    String grupo = "";
                    int grupofin = 0;
                    SQL4 = " SELECT MAX(grupo)  IS NULL nu  , MAX(grupo) grupo FROM pedido_destalle "
                            + "WHERE id_pedido ='" + id_pedido + "'  ";
                    rs4 = scSQL4.executeQuery(SQL4);

                    if (rs4.next()) {

                        if (rs4.getObject("nu").toString().equals("1")) {
                            grupo = "0";
                        } else {
                            grupo = rs4.getObject("grupo").toString();
                        }

                    }

                    grupofin = Integer.parseInt(grupo) + 1;

                    SQL2 = " SELECT id FROM pedido "
                            + "WHERE id_mesa ='" + id_mesa + "' AND id_usuario = '" + id_usuario + "' ";
                    rs = scSQL2.executeQuery(SQL2);
                    while (rs.next()) {
                        id_pedido = rs.getObject("id").toString();
                    }


                %>



                <div class="nav-tabs-custom">

                    <%                        SQL2 = "SELECT * FROM categoria ";

                        rs = scSQL2.executeQuery(SQL2);


                    %>

                    <ul class="nav nav-pills nav-tabs-justified">
                        <%                            while (rs.next()) {
                        %>

                        <li class=" 
                            <%
                                if (rs.getRow() == 1) {
                                    out.print("active");
                                }
                            %> "><a href="#<%=rs.getObject("id")%>" data-toggle="tab"><span class="glyphicon glyphicon-home"></span>
                                <%=rs.getObject("nombre")%>
                            </a>
                        </li> 
                        <%}%>
                    </ul>

                    <div class="tab-content">
                        <%
                            SQL2 = "SELECT * FROM categoria ";

                            rs = scSQL2.executeQuery(SQL2);

                            while (rs.next()) {
                        %>
                        <div class="

                             <%
                                 if (rs.getRow() == 1) {
                                     out.print("active");
                                 }
                             %>


                             tab-pane" id="<%=rs.getObject("id")%>">
                            <!-- Post -->

                            <div class="box-footer">
                                <ul class="mailbox-attachments clearfix">
                                    <%
                                        SQL3 = "SELECT * FROM producto "
                                                + "where id_categoria = '" + rs.getObject("id").toString() + " '  ";

                                        rs2 = scSQL3.executeQuery(SQL3);

                                        while (rs2.next()) {
                                    %>


                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <li class="box box-success ">
                                            <a href="#" class="mailbox-attachment-name"><i class="fa fa-arrow-right"></i> <b><%=rs2.getObject("nombre")%></b></a>

                                            <span class="mailbox-attachment-icon"><i class="fa fa-cutlery"></i></span>

                                            <div class="mailbox-attachment-info">

                                                <span class="mailbox-attachment-close">
                                                    <b>s/.<%=rs2.getObject("precio")%></b>

                                                    <a href="#" class="btn btn-info btn-sm pull-right" onclick="cargarURL('pedido/addProducto.jsp?id_producto=<%=rs2.getObject("id")%>&id_pedido=<%=id_pedido%>&precio=<%=rs2.getObject("precio")%>&grupo=<%=grupofin%>&id_usuario=<%=id_usuario%>', 'idContenedorProdutoPedidos')"><i class="fa fa-hand-o-right"></i> AGREGAR</a>

                                                </span>
                                            </div>

                                        </li> 
                                    </div>

                                    <%}%>
                                </ul>

                            </div>


                        </div>
                        <%}%>


                    </div>
                    <!-- /.tab-content -->
                </div>
                <!-- /.nav-tabs-custom -->

            </div><!-- /.box-body -->



        </div>
        <div class="col-md-6">
            <div class="box box-success">
                <div class="box-header with-border">
                    <h3 class="box-title"><b>Lista de Productos En El Pedido</b></h3>
                </div>
                <div id="idContenedorProdutoPedidos" class="box-body">



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
                                PRECIO UNITARIO
                            </th>
                            <th>
                                PRECIO TOTAL
                            </th>
                            <th>
                                OPC
                            </th>
                        </tr>


                        <%
                            int grup = 0;
                            SQL6 = "   SELECT x.id ,x.id_producto , x.cantidad_producto ,x.precio_total,x.precio_unitario, p.nombre, x.grupo FROM pedido_destalle x, producto p WHERE  x.id_pedido = '" + id_pedido + "' and x.id_producto = p.id ORDER BY x.GRUPO ";
                            rs6 = scSQL6.executeQuery(SQL6);

                            while (rs6.next()) {
//                                out.println("<h1> "+Integer.parseInt(rs6.getObject("grupo").toString())+" </h1>");
                                if (grup != Integer.parseInt(rs6.getObject("grupo").toString())) {
                                    grup = grup + 1;

                        %>
                        <tr>
                            <td colspan="5" ><b> Grupo : <%=rs6.getObject("grupo")%></b> </td>
                        </tr>
                        <% }%>
                        <tr>
                            <td> | </td>
                            <td> <%=rs6.getObject("nombre")%></td>
                            <td> <%=rs6.getObject("cantidad_producto")%></td>
                            <td> <%=rs6.getObject("precio_unitario")%></td>
                            <td> <%=rs6.getObject("precio_total")%></td>

                            <td> <button class="btn btn-danger" onclick="cargarURL('pedido/deletePedidoDetalle.jsp?id_pedido_detalle=<%=rs6.getObject("id")%>&id_pedido=<%=id_pedido%>', 'idContenedorProdutoPedidos')"  > <span class="icon-row" >
                                        <i class="fa fa-times"></i>
                                    </span></button>  </td>
                        </tr>




                        <%
                            }%>
                    </table>
                    <div >

                        <div id="idContenedorProdutoPedidos" class="box-body">
                            <button class="btn btn-success btn-lg right"  onclick="cargarURL('pedido/imprimirPedidoTicket.jsp?id_pedido=<%=id_pedido%>&id_usuario=<%=id_usuario%>','content')" > <span class ="icon-row" >
                                    <i class="fa fa-angle-double-left"></i>
                                </span>Terminar Pedido ELVIS ZZ-->>  <%=id_usuario%></button>
                        </div> 
                    </div>
                </div><!-- /.box-body -->
            </div><!-- /.box --> 
        </div><!--/.col (left) -->
    </div>

</div>   <!-- /.row -->
</section><!-- /.content -->

<script type="text/javascript">

                    var frm = $('#buscador');
                    frm.submit(function (ev) {
                    ev.preventDefault();
                            $.ajax({
                            type: 'POST',
                                    url: 'pedido/reporteProductosBuscados.jsp',
                                    data: frm.serialize(),
                                    target: '#idContenedorProdutos',
                                    success: function (responseText, statusText) {
                                    $('#idContenedorProdutos').html(responseText);
                                    }
                            });
                    });

</script>

