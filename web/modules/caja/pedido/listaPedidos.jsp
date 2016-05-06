 

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

<!--        <button class="btn btn-success btn-lg" onclick="cargarURL('pedido/addPedidoListaMesas.jsp?id_usuario=<%=id_usuario%>', 'content')">
            <b>    <i class="fa fa-plus"></i> PEDIDO</b> 
        </button>-->

    </div>

</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-md-12">

            <div class="box">


                <div class="box-header with-border">
                    <h3 class="box-title"><b>17/02/2016</b></h3>

                    <div class="btn-group pull-right">

                        <button type="button" class="btn btn-info"  >PENDIENTES</button> 

                        <!--                        <button type="button" class="btn btn-success">ENTREGADOS</button> -->

                        <button type="button" class="btn btn-danger" onclick="cargarURL('pedido/listaPedidosTerminados.jsp?id_usuario=<%=id_usuario%>', 'content')" >TERMINADOS</button>

                    </div>  
                </div><!-- /.box-header -->
                <div class="box-body">
                    <table class="table table-bordered table-hover">
                        <tr>
                            <th style="width: 10px">#</th>
                          
                            <th>Productos</th>
                            <th style="width: 40px">OPC</th>
                        </tr>

                        <%
                        int numFil = 0;
                            SQL = "SELECT *   FROM pedido "
                                    + " where  id_usuario = '" + id_usuario + "' and estado in ('1','3')     ";

                            rs = scSQL.executeQuery(SQL);

                            while (rs.next()) {
                                numFil++;
                        %>

                        <tr>
                            <td style="vertical-align:middle;" ><%=numFil%></td>      

                            
                            <td> 
                                <table class="table table-bordered">

                                    <tr>
                                        <th colspan="3" style="text-align:center; ">
                                             
                                            MESA :   
                                             
                                            <%
                                                SQL1 = "SELECT y.numero numero FROM pedido_mesa x "
                                                        + " inner join mesa y on x.id_mesa = y.id "
                                                        + " where  x.id_pedido = '" + rs.getObject("id") + "' ";

                                                rs1 = scSQL1.executeQuery(SQL1);
                                                while (rs1.next()) {
                                            %> 


                                            <%=rs1.getObject("numero")%> ,

                                            <%}%>

                                        </th>
                                    </tr>
                                    <%
                                        int countNum = 0;
                                        SQL3 = " SELECT COUNT(*) num FROM pedido_destalle   "
                                                + " WHERE  id_pedido = '" + rs.getObject("id") + "' ";

                                        rs3 = scSQL3.executeQuery(SQL3);

                                        if (rs3.next()) {
                                            countNum = Integer.parseInt(rs3.getObject("num").toString());
                                        }

                                        SQL2 = " SELECT y.nombre, x.estado_preparacion , x.estado_entrega , x.estado_cobro, x.cantidad_producto, x.precio_total,x.precio_unitario FROM pedido_destalle x "
                                                + " INNER JOIN producto y ON y.id = x.id_producto "
                                                + " WHERE x.id_pedido = '" + rs.getObject("id") + "' ";

                                        rs2 = scSQL2.executeQuery(SQL2);
                                        while (rs2.next()) {
                                    %>    

                                    <tr>
                                        <td> <%=rs2.getObject("nombre")%> </td>
                                        <td><%=rs2.getObject("cantidad_producto")%></td>
                                        <td>S/. <%=rs2.getObject("precio_total")%></td> 
                                    </tr>

                                    <%}%>

                                    <%

                                        float total = 0;
                                        SQL4 = " SELECT SUM(precio_total)IS NULL nu,SUM(precio_total) total  FROM pedido_destalle   "
                                                + " WHERE  id_pedido = '" + rs.getObject("id") + "' ";

                                        rs4 = scSQL4.executeQuery(SQL4);

                                        if (rs4.next()) {

                                            if (rs4.getObject("nu").toString().equals("1")) {
                                                total = 0;
                                            } else {
                                                total = Float.parseFloat(rs4.getObject("total").toString());
                                            }

                                        }
                                    %>
                                    <tr>
                                        <td></td>
                                        <td> <b>TOTAL</b> : </td>
                                        <td> <b>S/. <%=total%></b></td>
                                    </tr>
                                </table>
                            </td>
                            <td> 
                                <% if (total != 0) {%>

                                <button class="btn btn-info btn-lg btn-block" onclick="cargarURL('boleta/formBoleta.jsp?id_pedido=<%=rs.getObject("id")%>&id_usuario=<%=id_usuario%>', 'content')">
                                    <b>    
                                        <!--<i class="fa fa-plus" ></i>-->
                                        BOLETA VENTA</b>
                                </button>

                                <button class="btn btn-success btn-lg btn-block" onclick="cargarURL('factura/formFactura.jsp?id_pedido=<%=rs.getObject("id")%>&id_usuario=<%=id_usuario%>', 'content')">
                                    <b> 
                                        <!--<i class="fa fa-plus" ></i>--> 
                                        FACTURA</b>
                                </button>


                                <button class="btn btn-default btn-lg btn-block" onclick="cargarURL('ticket/formTicket.jsp?id_pedido=<%=rs.getObject("id")%>&id_usuario=<%=id_usuario%>', 'content')">
                                    <b>  COPIA TICKET <br> VENTA<br> </b>
                                </button>

                                <%}%>


                            </td>
                        </tr>

                        <%
                            }
                        %>




                    </table>
                </div><!-- /.box-body -->

                <div class="box-footer clearfix">
                    <ul class="pagination pagination-sm no-margin pull-right">
                        <li><a href="#">&laquo;</a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ul>
                </div>
            </div><!-- /.box -->


        </div><!-- /.col -->

    </div><!-- /.row -->

</section><!-- /.content -->


