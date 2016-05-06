<%@include file="../../util/conectionDB.jsp" %>

<section class="content-header">
    <h1>
        CREANDO PEDIDO
        <small>Lista de mesas del local </small>
    </h1>

    <div class="box-body">

    </div>

</div> 
</section>

<div class="row">

    <%
        String id_usuario = (String) request.getParameter("id_usuario");
        SQL = " select id,numero,capacidad ,'1' estado from mesa "
+" where id not in (select id_mesa from pedido_mesa"
+" where estado ='1') and estado = '1'"
+" union all "
+" SELECT m.id, m.numero, m.capacidad, '0' estado FROM pedido_mesa pm"
+" inner join mesa m"
+" on m.id = pm.id_mesa"
+" WHERE pm.estado ='1' order by 2 ";


        rs = scSQL.executeQuery(SQL);

        while (rs.next()) {
            if(rs.getObject("estado").equals("0")){
    %>
    
    <div class="col-md-3 col-sm-6 col-xs-12">
        <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-envelope-o"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">MESA <%=rs.getObject("numero")%></span>
                <span class="info-box-number">Cacidad : <%=rs.getObject("capacidad")%> Personas </span>
                 <span class="info-box-text"  > OCUADO </span>
            </div><!-- /.info-box-content -->
        </div><!-- /.info-box -->
    </div><!-- /.col -->

    <%}else if(rs.getObject("estado").equals("1")){%>
    <a class="col-md-3 col-sm-6 col-xs-12" href="#" onclick="cargarURL('pedido/formPedido.jsp?id_usuario=<%=id_usuario%>&id_mesa=<%=rs.getObject("id")%>', 'content')">
    <div >
        <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-envelope-o"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">MESA <%=rs.getObject("numero")%></span>
                <span class="info-box-number">Cacidad : <%=rs.getObject("capacidad")%> Personas </span>
            </div><!-- /.info-box-content -->
        </div><!-- /.info-box -->
    </div><!-- /.col -->
    </a>
    <%}}%>

</div>