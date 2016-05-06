<%@include file="../../util/conectionDB.jsp" %>

<section class="content" id="idContenForm">
    <div class="row">
<%  String id_usuario = (String) request.getParameter("id_usuario");%>
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
                                    <h3 class="box-title"><b>FORMULARIO PRODUCTO</b></h3>


                                </div>

                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="nombre" class="col-sm-2 control-label">NOMBRE : </label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="nombre" name="nombre"  placeholder="Nombre Producto">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="precio" class="col-sm-2 control-label">PRECIO :</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="precio" name="precio"  placeholder="Precio del Producto">
                                        </div>
                                    </div> 



                                    <div class="form-group">
                                        <label for="categoria" class="col-sm-2 control-label">CATEGORIA :</label>

                                        <div class="col-sm-10">

                                            <select type="text" class="form-control" id="id_categoria" name="id_categoria" >
                                                <% SQL = "SELECT * FROM categoria WHERE estado ='1' ";

                                                    rs = scSQL.executeQuery(SQL);

                                                    while (rs.next()) {
                                                %>

                                                <option value="<%=rs.getObject("id")%>"><%=rs.getObject("nombre")%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>

                                            <input type="hidden" value="<%=id_usuario%>" name="id_usuario">

                                </div>
                                <div class="box-footer">

                                    <button type="submit" class="btn btn-info pull-right">CREAR PRODUCTO</button>
                                </div>

                            </div>

                        </div>  

                    </div><!-- /.box-footer -->
                </form>

            </div><!-- /.box-body -->

        </div>

    </div>
</section>


<script type="text/javascript">

    var frm = $('#formBoleta');
    frm.submit(function (ev) {
        ev.preventDefault();
        $.ajax({
            type: 'POST',
            url: 'producto/addProducto.jsp',
            data: frm.serialize(),
            target: '#idContenForm',
            success: function (responseText, statusText) {
                $('#idContenForm').html(responseText);
            }
        });


    });

</script>