/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


  function cargarURL(url,idContenedor) {
             
            $.get(url).done(function(data) {
               
                $("#" + idContenedor).html(data);
            });

        }
function CargarPOST(parametros){

                        
            //            if(opciones.type === "POST"){                
            //            $("#" + parametros.idFormulario).html(
            //                    "<img src='../resources/images/loading.gif' />");            
            //            }

            
            console.log(" idFormulario -> "+parametros.idFormulario);
            var tipoEnvio = "POST";
            var opciones = {};
            opciones.target = "#" + parametros.idContenedor;
            opciones.method = tipoEnvio;
            opciones.type = tipoEnvio;
            opciones.url = parametros.url;
            //            opciones.success = function(responseText, statusText, xhr) {
            //                if (parametros.success) {
            //                    parametros.success();
            //                }
            //            };
            //            opciones.uploadProgress = function(event, position, total,
            //                percentComplete) {
            //
            //                $("#" + parametros.idProgress).progressbar({
            //                    value: percentComplete
            //                });
            //
            //            };
            //            opciones.beforeSend = function() {
            //                if (parametros.beforeSend) {
            //                    parametros.beforeSend();
            //                }
            //            }
            /*$("#" + parametros.idFormulario).submit(function(){
                $("#" + parametros.idContenedor).html(
                    "<img src='../resources/images/loading.gif' />");                      
            });*/
            $("#" + parametros.idFormulario).ajaxForm(opciones);
}