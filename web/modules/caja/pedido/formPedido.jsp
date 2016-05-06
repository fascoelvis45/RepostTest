<%@include file="../../util/conectionDB.jsp" %>

<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-6">




            <div class="nav-tabs-custom">


                <ul class="nav nav-tabs">
                    <li class="active"><a href="#activity" data-toggle="tab">Activity</a></li>
                    <li><a href="#timeline" data-toggle="tab">Timeline</a></li>
                    <li><a href="#settings" data-toggle="tab">Settings</a></li>
                </ul>


                <div class="tab-content">

                    <div class="active tab-pane" id="activity">
                        <div class="row">
                            <a class="col-md-3 col-sm-6 col-xs-12" href="#" >
                                <div >
                                    <div class="info-box">
                                        <span class="info-box-icon bg-aqua"><i class="fa fa-envelope-o"></i></span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">MESA </span>
                                            <span class="info-box-number">Cacidad :   Personas </span>
                                        </div><!-- /.info-box-content -->
                                    </div><!-- /.info-box -->
                                </div><!-- /.col -->
                            </a>

                        </div></div><!-- /.tab-pane -->

                    <div class="tab-pane" id="timeline">

                    </div><!-- /.tab-pane -->

                    <div class="tab-pane" id="settings">

                    </div><!-- /.tab-pane -->

                </div><!-- /.tab-content -->
            </div><!-- /.nav-tabs-custom -->








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

</div>   <!-- /.row -->
</section><!-- /.content -->

<script type="text/javascript">
    
    var frm = $('#buscador');
    frm.submit(function (ev) {
        ev.preventDefault();
        $.ajax({
            type: 'POST',
            url: 'pedido/reporteProductosBuscados.jsp',
            data: frm.serialize(),
            target : '#idContenedorProdutos',
            success: function(responseText, statusText) {
                $('#idContenedorProdutos').html(responseText);
            }
        });

        
    });
    
</script>

