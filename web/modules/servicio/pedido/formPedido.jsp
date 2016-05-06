<%@include file="../../util/conectionDB.jsp" %>

<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-6">
            <!-- general form elements -->

            <!-- Form Element sizes -->
            <div class="box">

                <%
                
                  String id_usuario = (String) request.getParameter("id_usuario");
                    String id_mesa = (String) request.getParameter("id_mesa");
                    String id_pedido = "";
                    SQL = "  INSERT INTO pedido (fecha,estado,id_mesa,id_usuario) VALUES (SYSDATE(),'1','" + id_mesa + "','" + id_usuario + "')";

//executeUpdate
                    //rs = scSQL.executeQuery(SQL);
                    int a = scSQL.executeUpdate(SQL);

                    SQL2 = " SELECT id FROM pedido "
                            + "WHERE id_mesa ='" + id_mesa + "' AND id_usuario = '" + id_usuario + "' ";
                    rs = scSQL2.executeQuery(SQL2);
                    while (rs.next()) {
                        id_pedido = rs.getObject("id").toString();
                    }
                    SQL3 = "  INSERT INTO pedido_mesa (id_mesa,id_pedido,estado) VALUES ('" + id_mesa + "','" + id_pedido + "','1')";

//executeUpdate
                    //rs = scSQL.executeQuery(SQL);
                    int aa = scSQL.executeUpdate(SQL3);



                
                %>
                


                <div class="nav-tabs-custom">

                    <%                        
//                    String id_usuario = (String) request.getParameter("id_usuario");
//                        String id_mesa = (String) request.getParameter("id_mesa");
//                        String id_pedido = "";

                        SQL2 = "SELECT * FROM categoria ";

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

                                                        <a href="#" class="btn btn-info btn-sm pull-right" onclick="cargarURL('pedido/addProducto.jsp?id_producto=<%=rs2.getObject("id")%>&id_pedido=<%=id_pedido%>&precio=<%=rs2.getObject("precio")%>&grupo=1&id_usuario=<%=id_usuario%>', 'idContenedorProdutoPedidos')"><i class="fa fa-hand-o-right"></i> AGREGAR</a>

                                                    </span>
                                                </div>
                                            
                                        </li> 
                                    </div>

                                    <%}%>
                                </ul>

                            </div>


                        </div>
                        <%}%>


                        <!-- /.tab-pane -->
                        <!--                        <div class="tab-pane" id="timeline">
                                                     The timeline 
                                                    <h2>Page 02</h2>
                                                </div>
                                                 /.tab-pane 
                        
                                                <div class="tab-pane" id="settings">
                                                    <h2>Page 03</h2>
                                                </div>-->
                        <!-- /.tab-pane -->
                    </div>
                    <!-- /.tab-content -->
                </div>
                <!-- /.nav-tabs-custom -->
  
            </div><!-- /.box-body -->

            <hr>
<!--            <div class="box-header with-border">
                <h3 class="box-title"><b>PRODUCTOS</b></h3>
            </div>
            <div id="idContenedorProdutos" class="box-body">

            </div> /.box-body -->




        </div>
        <div class="col-md-6">
            <div class="box box-success">
                <div class="box-header with-border">
                    <h3 class="box-title"><b>Lista de Productos En El Pedido</b></h3>
                </div>
                <div id="idContenedorProdutoPedidos" class="box-body">

                </div><!-- /.box-body -->
            </div><!-- /.box --> 
        </div><!--/.col (left) -->
    </div>

    <!-- /.row -->
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

