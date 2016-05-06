 
<!-- Left side column. contains the logo and sidebar -->
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@include file="../../util/conectionDB.jsp" %>


<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-md-12">

            <div class="box">


                <div class="box-header with-border">
                    <h3 class="box-title"><b>17/02/2016</b></h3>

                    <div class="btn-group pull-right">

                        <button type="button" class="btn btn-info">PENDIENTES</button> 

                        <!--                        <button type="button" class="btn btn-success">ENTREGADOS</button> -->

                        <button type="button" class="btn btn-danger">TERMINADOS</button>

                    </div>  
                </div><!-- /.box-header -->
                <div class="box-body">
                    <table class="table table-bordered table-hover">
                        <tr>
                            <th style="width: 10px">#</th>
                            <th>Mesa</th>
                            <th>Mozo</th>
                            <th>Productos</th>
                 
                        </tr>

                        <%

                            SQL = " SELECT pe.* , per.nombre, per.ap_paterno , per.ap_materno   FROM pedido pe "
                                    + " INNER JOIN usuario us ON us.id = pe.id_usuario "
                                    + " INNER JOIN persona_dato per ON per.id = us.id_persona "
                                    + "  WHERE   pe.estado ='1'";
                            /*
                             * + " AND DATE_FORMAT(pe.fecha,'%m-%d-%Y') =
                             * DATE_FORMAT(NOW(),'%m-%d-%Y') ";
                             */

                            rs = scSQL.executeQuery(SQL);

                            while (rs.next()) {
                        %>

                        <tr>
                            <td>x</td>      

                            <td> 

                                <ul>
                                    <%

                                        SQL1 = "SELECT y.numero numero FROM pedido_mesa x "
                                                + " inner join mesa y on x.id_mesa = y.id "
                                                + " where  x.id_pedido = '" + rs.getObject("id") + "' ";


                                        rs1 = scSQL1.executeQuery(SQL1);
                                        while (rs1.next()) {
                                    %>    
                                    <li>
                                        Mesa <%=rs1.getObject("numero")%>
                                    </li>
                                    <%}%>
                                </ul>

                            </td>
                            <td>
                                <%=rs.getObject("nombre")%> <%=rs.getObject("ap_paterno")%> <%=rs.getObject("ap_materno")%>
                            </td>
                            <td> 
                                <table class="table table-bordered">
                                    <%

                                        SQL2 = " SELECT y.nombre, x.estado_preparacion , x.estado_entrega , x.estado_cobro , x.id FROM pedido_destalle x "
                                                + " INNER JOIN producto y ON y.id = x.id_producto "
                                                + " WHERE x.id_pedido = '" + rs.getObject("id") + "' ";


                                        rs2 = scSQL2.executeQuery(SQL2);
                                        while (rs2.next()) {
                                    %>    

                                    <tr><td>
                                            <%=rs2.getObject("nombre")%>
                                        </td>

                                        <td>
                                            <% if (rs2.getObject("estado_preparacion").equals("0")) {%>
                                            <button class="btn btn-danger btn-sm"  onclick="cargarURL('pedido/activePreparacion.jsp?id_pedido_detalle=<%=rs2.getObject("id")%>', 'content')">
                                                <i class="fa fa-plus"></i> <br>
                                                <b> PREPARACION</b>
                                            </button>
                                            <%} else if (rs2.getObject("estado_preparacion").equals("1")) {%>
                                            <button class="btn btn-warning btn-sm"  onclick="cargarURL('pedido/terminarPreparacion.jsp?id_pedido_detalle=<%=rs2.getObject("id")%>', 'content')">
                                                <i class="fa fa-plus"></i> <br>
                                                <b> PREPARACION</b>
                                            </button>
                                            <%} else if (rs2.getObject("estado_preparacion").equals("2")) {%>
                                            <button class="btn btn-success btn-sm"  >
                                                <i class="fa fa-plus"></i> <br>
                                                <b> PREPARACION</b>
                                            </button>
                                            <%} %>
                                        </td>
                                    </tr>
                                    <%}%>
                                </table>
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

