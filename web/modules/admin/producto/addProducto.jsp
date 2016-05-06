
<%@include file="../../util/conectionDB.jsp" %>
<% String id_categoria = (String) request.getParameter("id_categoria");
    String nombre = (String) request.getParameter("nombre");
    String precio = (String) request.getParameter("precio");
    String id_usuario = (String) request.getParameter("id_usuario");
    SQL = " insert into   producto "
            + " ( estado , "
            + " id , "
            + "  id_categoria , "
            + "  nombre , "
            + "  precio  "
            + " )"
            + " values"
            + " (1, "
            + " '111', "
            + " '" + id_categoria + "', "
            + " '" + nombre + "', "
            + " '" + precio + "')  ";

    int a = scSQL.executeUpdate(SQL);


%>

<script>

    cargarURL('producto/listaProductos.jsp?id_usuario=<%=id_usuario%>', 'idContenForm');
</script>
