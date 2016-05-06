 
<!-- Left side column. contains the logo and sidebar -->
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@include file="../../util/conectionDB.jsp" %>
<%  String id_usuario = (String) request.getParameter("id_usuario");%>
<section class="content-header">
    <h1>
        REPORTE PEDIDOS
        <small>Lista de Pedidos PENDIENTES<FECHA DEL SISTEMA> </small>
    </h1>

    <div class="box-body">




        <div class="box-body">

            <button class="btn btn-success btn-lg" onclick="cargarURL('producto/formProducto.jsp?id_usuario=<%=id_usuario%>', 'content')">
                <b>    <i class="fa fa-plus"></i> PRODUCTO</b>

            </button>
            <button class="btn btn-success btn-lg" onclick="cargarURL('producto/formCategoria.jsp?id_usuario=<%=id_usuario%>', 'content')">
                <b>    <i class="fa fa-plus"></i> CATEGORIA</b>

            </button>

        </div>

    </div>



</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->

            <!-- Form Element sizes -->
            <div class="box">

                <%

                %>



                <div class="nav-tabs-custom">

                    <%//                    String id_usuario = (String) request.getParameter("id_usuario");
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

                                                    <a href="#" class="btn btn-info btn-sm pull-right" onclick="cargarURL('pedido/addProducto.jsp?id_producto=<%=rs2.getObject("id")%>', 'idContenedorProdutoPedidos')"><i class="fa fa-hand-o-right"></i> AGREGAR</a>

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

