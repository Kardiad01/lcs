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

const selectorDeck = (urlmazo, urlobtenermazo, user, app, room_code) =>{
    console.log(urlmazo);
    console.log(urlobtenermazo);
    bootbox.dialog({
        title : '<h5>Elige tu mazo</h5>',
        message : `<table data-library-func="datatable-mazos">
            <thead>
                <th>Nombre</th>
                <th>Seleccionar</th>
            </thead>
        </table>`,
        closeButton: false,
        onShow : function(){
            app.addComponent(document.querySelector('[data-library-func="datatable-mazos"]'), {
                datatable : {
                    mazos: {
                        name : 'Datatabla que da mazos para esta aplicación y los selecciona',
                        config : {
                            info : false,
                            autoWidth: true,
                            lengthMenu : [20],
                            ajax :{
                                type : "POST",
                                url :  urlmazo,
                                dataSrc : 'data'
                            },
                            columnDefs: [
                                {
                                    targets: 0,
                                    data: 'nombre',
                                    render : function (data, type, row, meta){                             
                                        return row.nombre.replace(' ', '&nbsp')
                                    }
                                },
                                {
                                    targets: 1,
                                    data: 'id',
                                    render : function (data, type, row, meta){
                                        return `<input type="radio" name="mazo" value="${data}" id="mazo${data}">`
                                    }
                                },
                            ],
                            fnInitComplete: function(e){    
                                $(app.webMap.datatable.mazos.dom).css({
                                    'width': '100%',
                                    'text-aling': 'center'
                                });
                            }
                        }
                    } 
                }
            });
        },
        buttons : {
            seleccionar : {
                label : 'Seleccionar',
                className : 'btn-success',
                callback: function(){
                    const mazoSeleccionado = [...$('input[type=radio]')].filter((el)=>{
                        if(el.checked){
                            return el
                        }
                    });
                    if(mazoSeleccionado.length>0){
                        const mazo = $(mazoSeleccionado[0]).val();
                        console.log(mazo)
                        $.ajax({
                            type: "POST",
                            url: urlobtenermazo,
                            data: {
                                id_deck : mazo
                            },
                            dataType: "JSON",
                            success: function (response) {
                                if(response.data!=undefined){
                                    const regexp = new RegExp('\=.+?\&', 'g')
                                    const room_code = window.location.search.match(regexp)[0].replace('&', '').replace('=', '');
                                    const objetoInitgame = {
                                        type : 'start',
                                        mazo : response.data,
                                        user : user,
                                        room : room_code
                                    }
                                    console.log(objetoInitgame);
                                    app.webMap.event.eljuego.class.config.event.socket.send(JSON.stringify(objetoInitgame))
                                }
                            }
                        });
                    }else{
                        window.location.reload();
                    }
                }
            }
        }
    });
}