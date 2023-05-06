const getUserFriendRequest = (url, urlsi, urlno, app)=>{
    $.ajax({
        type: "POST",
        url: url,
        data: "",
        dataType: "JSON",
        success: function (response) {
            if(response.status===200 && response.data.length>0){
                for(let item in response.data){
                    let player = response.data[item][0];
                    console.log(player)
                    bootbox.dialog({
                        title : `<h5>Solicitud de Amistad</h5>`,
                        message : `<div>
                            ${player.nombre} quiere ser tu amigo
                        </div>`,
                        buttons: {
                            aceptar : {
                                label : 'Aceptar',
                                className : 'btn btn-success',
                                closeButton: false,
                                callback : ()=>{
                                    $.ajax({
                                        type: "POST",
                                        url: urlsi,
                                        data: {
                                            id_player : player.id 
                                        },
                                        dataType: "JSON",
                                        success: function (response) {
                                            if(response.status===200){
                                                toastr.success(response.msg);
                                                app.webMap.event[1].class.config.event.socket.send(`{"type": "accept","id": "${player.id}"}`);
                                                $(app.webMap.datatable[4].dom).dataTable().api().ajax.reload()
                                            }else{
                                                toastr.error(response.msg);
                                            }
                                        }
                                    });
                                }
                            },
                            rechazar : {
                                label : 'Rechazar',
                                className : 'btn btn-danger',
                                callback : ()=>{
                                    $.ajax({
                                        type: "POST",
                                        url: urlno,
                                        data: {
                                            id_player : player.id
                                        },
                                        dataType: "dataType",
                                        success: function (response) {
                                            if(response.status===200){
                                                toastr.success(response.msg);
                                            }else{
                                                toastr.error(response.msg);
                                            }
                                        }
                                    });
                                }
                            }
                        }
                    })
                }
            }
        }
    });
}

