<%@include file="../../util/conectionDB.jsp" %>

<%    String id_pedido = (String) request.getParameter("id_pedido");
    String id_usuario = (String) request.getParameter("id_usuario");
%>

<section class="content">
    <div class="row">
        <div class="col-md-6">
            <div class="box box-success">
                <div class="box-header with-border">
                    <h3 class="box-title"><b>Lista de Productos En El Pedido</b></h3>
                </div>
                <div class="box-body">

                    <table class="table table-bordered table-hover">
                        <tr>
                            <th>
                                #
                            </th>
                            <th>
                                CANT.
                            </th>
                            <th>
                                PRODUCTO 
                            </th> 
                            <th>
                                PRECIO UNI.
                            </th>
                            <th>
                                TOTAL
                            </th>

                        </tr>


                        <%
                            SQL = "   SELECT x.id ,x.id_producto , x.cantidad_producto ,x.precio_total,x.precio_unitario, p.nombre FROM pedido_destalle x, producto p WHERE  x.id_pedido = '" + id_pedido + "' and x.id_producto = p.id  ";
                            rs = scSQL.executeQuery(SQL);

                            while (rs.next()) {

                        %>
                        <tr>
                            <td> | </td>
                            <td> <%=rs.getObject("cantidad_producto")%></td>
                            <td> <%=rs.getObject("nombre")%></td>
                            <td> <%=rs.getObject("precio_unitario")%></td>
                            <td> <%=rs.getObject("precio_total")%></td> 
                        </tr>
                        <%}%>
                        <%
                            float num = 0;
                            SQL2 = "   SELECT SUM(precio_total) total FROM pedido_destalle   WHERE   id_pedido = '" + id_pedido + "' ";
                            rs2 = scSQL2.executeQuery(SQL2);

                            if (rs2.next()) {
                                num = Float.parseFloat(rs2.getObject("total").toString());
                            }
                        %>
                        <tr>
                            <td colspan="3"></td>
                            <td><b>TOTAL : </b></td>
                            <td><b>S/. <%=num%> </b></td>
                        </tr>
                    </table>

                    <form id="formTicket" class="form-horizontal"   >
                        <div class="box-body">
                            <div class="form-group">
                                <div class="col-sm-12"> 
                                    <!--                                <input type="hidden" class="form-control" id="id_pedido" name="id_pedido" value="< %=id_pedido%>" />
                                                                    <input type="hidden" class="form-control" id="serie" name="serie" value="T001" />
                                                                    <input type="hidden"   id="id_usuario" name="id_usuario" value="< %=id_usuario%>" />-->

                                    <input type="hidden" class="form-control" id="id_perdido" name="id_pedido" value="<%=id_pedido%>" />
                                    <input type="hidden" class="form-control" id="serie" name="serie" value="T001" />
                                    <input type="hidden"   id="id_usuario" name="id_usuario" value="<%=id_usuario%>" />
                                </div>
                                <div class="box-footer">

                                    <button type="submit" class="btn btn-info btn-lg btn-block">GENERAR TICKET</button>
                                </div>

                            </div>

                        </div>  

                    </form>

                </div><!-- /.box-body -->

            </div><!-- /.box --> s
        </div><!--/.col (left) -->
    </div>
</div>

</div>   <!-- /.row -->
</section><!-- /.content -->

<script type="text/javascript">

    var frm = $('#formTicket');
    frm.submit(function (ev) {
        ev.preventDefault();
        $.ajax({
            type: 'POST',
            url: 'ticket/imprimirTicket.jsp',
            data: frm.serialize(),
            target: '#content',
            success: function (responseText, statusText) {
                $('#content').html(responseText);
            }
        });


    });

</script>

