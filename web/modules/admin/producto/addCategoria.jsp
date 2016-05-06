
<%@include file="../../util/conectionDB.jsp" %>
<%    String nombre = (String) request.getParameter("nombre");

    String id_usuario = (String) request.getParameter("id_usuario");
    SQL = " insert into   categoria "
            + " ( estado , "
            + " id , "
            + "  nombre  "
            + " )"
            + " values"
            + " (1, "
            + " '111', "
            + " '" + nombre + "' ) ";

    int a = scSQL.executeUpdate(SQL);


%>

<script>

    cargarURL('producto/listaProductos.jsp?id_usuario=<%=id_usuario%>', 'idContenForm');
</script>
