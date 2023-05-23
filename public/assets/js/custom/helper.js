const baseUrl = window.location.origin;
const pantalla = {
    width: window.innerWidth,
    height: window.innerHeight
}
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

/**
 * 
 * Métodos del juego
 * 
 */

const startMatch = (ele, app, id_session, turno, room_code, data, x) =>{
    const baseUrl = window.location.origin;  
    $('.player-hand').append(`
        <div data-tipo="${ele.tipo}" id="card${ele.id}" style="right:${x*5}%; z-index:${x};">
            <img src="${baseUrl}/assets/img/cartas/${ele.id}.png">
        </div>
    `);
    if(id_session == turno && ele.tipo === 'concepto'){
        $(`#card${ele.id}`).on('click', (e) => {
            app.webMap.event.eljuego.class.config.event.socket.send(JSON.stringify({
                type : 'concepto',
                id_carta : ele.id,
                id_jugador : id_session,
                room : room_code
            }))
        })
    }            
}

/**EL bueno */
const renderCartas = (data, app, id_session) =>{
    console.warn('HEMOS ENTRADO EN SITIO CON CURVAAAAS')
    const baseUrl = window.location.origin;
    $('.player-hand').html('');
    $('.opponent-hand').html('');
    $('.opponent-board').find('.concept-place').html('');
    $('.player-board').find('.concept-place').html('');
    $('#puntos'+data.rol).html(`Puntos Jugador 1 : ${data.puntos_conviccion[data.rol]}`);
    $('#puntos'+data.oponente).html(`Puntos Jugador 2 : ${data.puntos_conviccion[data.oponente]}`);
    $('#mana'+data.rol).html(`Tiempo Jugador 1 : ${data.mana[data.rol]}`);
    $('#mana'+data.oponente).html(`Tiempo Jugador 2 : ${data.mana[data.oponente]}`);
    $('#turno').html(`${(data.propietario_turno === id_session)?'tu turno':'turno rival'}`);

    //renderiza en mano

    for(let x = 0; x<data.cartas_mano_oponente; x++){
        $('.opponent-hand').append(`<div></div>`); 
    }

    if(Array.isArray(data.mano)){
        data.mano.forEach((ele, i) => {
            $('.player-hand').append(`
            <div data-tipo="${ele.tipo}" id="card${ele.id}">
               <img src="${baseUrl}/assets/img/cartas/${ele.id}.png">
            </div>
            `);
        });
    }else{
        Object.keys(data.mano).forEach((carta, i)=>{
            $('.player-hand').append(`
            <div data-tipo="${data.mano[carta].tipo}" id="card${data.mano[carta].id}">
                <img src="${baseUrl}/assets/img/cartas/${data.mano[carta].id}.png">
            </div>
            `);
        });
    }

    //renderiza en mesa

    data.mesa[data.rol].forEach((ele, i)=>{
        $('.player-board').find('.concept-place').append(`
        <div data-tipo="${ele.tipo}" id="card${ele.id}">
            <img src="${baseUrl}/assets/img/cartas/${ele.id}.png">
        </div>
        `)
    })
    data.mesa[data.oponente].forEach((ele, i)=>{
        $('.opponent-board').find('.concept-place').append(`
        <div data-tipo="${ele.tipo}" id="card${ele.id}">
            <img src="${baseUrl}/assets/img/cartas/${ele.id}.png">
        </div>
        `)
    })
    addEvents(data, app, id_session);
}

const addEvents = (data, app, id_session) =>{
    data.mesa[data.rol].forEach((ele)=>{
        $('.player-board').find(`#card${ele.id}`).on('contextmenu',  function(e){
            e.stopPropagation();
            e.preventDefault();
            bootbox.alert({
                title : `<h1>${ele.nombre}</h1>`,
                message : `
                    <div>
                        <img src="${baseUrl}/assets/img/cartas/${ele.id}.png">
                    </div>
                `
            })
        })
    });
    data.mesa[data.oponente].forEach((ele)=>{
        $('.opponent-board').find(`#card${ele.id}`).on('contextmenu',  function(e){
            e.stopPropagation();
            e.preventDefault();
            bootbox.alert({
                title : `<h1>${ele.nombre}</h1>`,
                message : `
                    <div>
                        <img src="${baseUrl}/assets/img/cartas/${ele.id}.png">
                    </div>
                `
            })
        })
    });
    if(Array.isArray(data.mano)){
        data.mano.forEach((ele)=>{
            $('.player-hand').find(`#card${ele.id}`).on('contextmenu',  function(e){
                e.stopPropagation();
                e.preventDefault();
                bootbox.alert({
                    title : `<h1>${ele.nombre}</h1>`,
                    message : `
                        <div>
                            <img src="${baseUrl}/assets/img/cartas/${ele.id}.png">
                        </div>
                    `
                })
            })
            $('.player-hand').find(`#card${ele.id}`).on('click',  function(e){
                app.webMap.event.eljuego.class.config.event.socket.send(JSON.stringify({
                    type : ele.tipo,
                    id_carta : ele.id,
                    id_jugador : id_session,
                    room : data.nombre_partida
                }))
            })
        })
    }else{
        Object.keys(data.mano).forEach((ele)=>{
            $('.player-hand').find(`#card${data.mano[ele].id}`).on('contextmenu',  function(e){
                e.stopPropagation();
                e.preventDefault();
                bootbox.alert({
                    title : `<h1>${data.mano[ele].nombre}</h1>`,
                    message : `
                        <div>
                            <img src="${baseUrl}/assets/img/cartas/${data.mano[ele].id}.png">
                        </div>
                    `
                })
            })
            $('.player-hand').find(`#card${data.mano[ele].id}`).on('click', function(e){
                app.webMap.event.eljuego.class.config.event.socket.send(JSON.stringify({
                    type :   data.mano[ele].tipo,
                    id_carta : data.mano[ele].id,
                    id_jugador : id_session,
                    room : data.nombre_partida
                }))
            })
        })
    }
}
