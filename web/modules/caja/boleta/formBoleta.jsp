<%@include file="../../util/conectionDB.jsp" %>

<%    String id_pedido = (String) request.getParameter("id_pedido");
    String id_usuario = (String) request.getParameter("id_usuario");

%>

<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-6">
            <!-- general form elements -->

            <!-- Form Element sizes -->
            <div class="box box-success">
                <!--                <div class="box-header with-border">
                                    <h3 class="box-title"><b>BUSCAHR PRODUCTO</b></h3>
                                </div>
                                <div class="box-body">-->



                <form id="formBoleta" class="form-horizontal"   >
                    <div class="box-body">
                        <div class="form-group">
                            <div class="col-sm-12">

                                <div class="box-header with-border">
                                    <h3 class="box-title"><b>BOLETA DE VENTA</b></h3>

                                    <table>

                                        <tbody>
                                            <tr> 
                                                <td>

                                                </td>
                                            </tr>    
                                        </tbody>
                                    </table>
                                </div>

                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="nomCliente" class="col-sm-2 control-label">Sr. (es) </label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="nomCliente" name="nomCliente"  placeholder="Nombre Cliente">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="Direccion" class="col-sm-2 control-label">Direccion</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="direccion" name="direccion"  placeholder="Domicio Cliente">
                                        </div>
                                    </div> 

                                    <div class="form-group">
                                        <label for="dni" class="col-sm-2 control-label">DNI</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="dni" name="dni" >
                                        </div>
                                    </div>

                                    <input type="hidden" class="form-control" id="id_perdido" name="id_pedido" value="<%=id_pedido%>" />
                                    <input type="hidden" class="form-control" id="serie" name="serie" value="B001" />
                                    <input type="hidden"   id="id_usuario" name="id_usuario" value="<%=id_usuario%>" />

                                </div>
                                <div class="box-footer">

                                    <button type="submit" class="btn btn-info pull-right">Generar Boleta</button>
                                </div>

                            </div>



                        </div>  


                    </div><!-- /.box-footer -->
                </form>


            </div><!-- /.box-body -->

            <hr>
            <div class="box-header with-border">
                <h3 class="box-title"><b>PRODUCTOS</b></h3>
            </div>
            <div id="idContenedorProdutos" class="box-body">

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
                </div><!-- /.box-body -->
            </div><!-- /.box --> 
        </div><!--/.col (left) -->
    </div>

</div>   <!-- /.row -->
</section><!-- /.content -->

<script type="text/javascript">

    var frm = $('#formBoleta');
    frm.submit(function (ev) {

        console.log("DDDD---->>>>>>> FUNCIONA pero ....");

        ev.preventDefault();
        $.ajax({
            type: 'POST',
            url: 'boleta/imprimirBoleta.jsp',
            data: frm.serialize(),
            target: '#idContenedorProdutos',
            success: function (responseText, statusText) {
                $('#idContenedorProdutos').html(responseText);
            }
        });


    });

</script>

