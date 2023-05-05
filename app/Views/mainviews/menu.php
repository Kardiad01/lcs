<script>
$(document).ready(()=>{
    
    //Redimensionar imagen desde el background, para imagen de perfil
    const app = new App({
        event : {
            0:{
                name : 'observer de pruebas que de momento te da las friend request',
                config: {
                    event : 'observer',
                    trigger : document.querySelector('.user-img'),
                    config : {
                        childList : true,
                        attributes : true
                    },
                    call : function(e){
                        //de aquí se podría meter lo de recompensa diaria ajustando a back.
                        $.ajax({
                            type: "POST",
                            url: "<?=base_url('master/user/user/friendrequest')?>",
                            data: "",
                            dataType: "JSON",
                            success: function (response) {
                                if(response.status===200 && response.data.length>0){
                                    for(let item in response.data){
                                        let player = response.data[item][0];
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
                                                            url: "<?=base_url('master/user/user/aceptnewfriend')?>",
                                                            data: {
                                                                id_player : player.id 
                                                            },
                                                            dataType: "JSON",
                                                            success: function (response) {
                                                                if(response.status===200){
                                                                    toastr.success(response.msg);
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
                                                            url: "<?=base_url('master/user/user/rejectnewfriend')?>",
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
                }
            },
            1: {
                name : 'websocket del chat',
                config: {
                    event : 'websocket',
                    trigger : document,
                    url : 'http://localhost:8181', //url sin el wss o ws el http te lo quita, y tiene que estar, para que sea más notorio que es una... URL
                    config : [

                    ],
                    open : function(ev){
                        console.log('Conexión establecida');
                        ev.currentTarget.send(JSON.stringify({
                            type : "init",
                            user: "<?=esc($user)[0]['id']?>",
                            name : "<?=esc($user)[0]['nombre']?>"
                        }));
                        $(app.webMap.datatable[4].dom).dataTable().api().ajax.reload();
                    },
                    message : function(ev){
                        const data = JSON.parse(ev.data);
                        if(data.type==='init'){
                            toastr.info(`${data.name} se ha conectado`);
                            $(app.webMap.datatable[4].dom).dataTable().api().ajax.reload();
                        }
                        if(data.type==='chat'){
                            toastr.info(`Nuevo mensaje de : ${data.data.user}`);
                            $(`#chat-screen-${data.data.id_hablante}`).append(`
                            <div class="col-8 align-self-start border rounded mt-2 coment">
                                <p class="h-25  mr-3 coment">
                                    <b style="font-size:0.8rem">${data.data.user}</b><small style="font-size:0.8rem">${data.data.date}</small><p>${data.data.message}</p>
                                </p>
                            </div>
                            `);     
                            $(`#chat-screen-${data.data.id_hablante}`).animate({ scrollTop:  Number.MAX_SAFE_INTEGER }, 1000);                   
                        }
                        if(data.type=='close'){
                            $(app.webMap.datatable[4].dom).dataTable().api().ajax.reload();
                        }
                    },
                    close : function(ev){
                        ev.currentTarget.send(`{
                            type: "close"
                        }`)
                        $.ajax({
                            method: "POST",
                            url: "<?=base_url('/master/user/user/logout')?>",
                            data: "",
                            dataType: "JSON"
                        });
                        window.location.replace("<?=base_url()?>");
                    },
                    error : function(ev){
                        console.log(ev)
                    }
                }
            }
        },
        form:{
            0: {
                name : 'form que sirve para actualizar datos del usuario',
                config: {
                    get: 'data-get',
                    method: 'post',
                    format: 'json',
                    send: 'data-send',
                    ajax: true,
                    reload: true,
                    redirect: false,
                    debug: false
                }
            }
        },
        modal: {
            0 : {
                name : 'modal que sirve para borrar al usuario',
                config: {
                    title : '<h2>¿Estás seguro de que quieres borrar tu cuenta</h2>',
                    message : '<p>Sentimos que no haya sido de tu agrado el juego</p>'+
                    '<p>Para borrar su cuenta tendrá que poner la contraseña en el siguiente cuadro</p>'+
                    '<label for="pass-delete-get">Contraseña</label>'+
                    '<p><input type="password" class="form-control" id="pass-delete-get" placeholder="********">',
                    buttons : {
                        deleteacount : {
                            label : 'Eliminar cuenta',
                            className : 'btn btn-danger',
                            callback : function (){
                                $.ajax({
                                    type: "POST",
                                    url: "<?=base_url('master/user/user/deleteuser')?>",
                                    data: {
                                        id : "<?=esc($user)[0]['id']?>",
                                        password : $("#pass-delete-get").val()
                                    },
                                    dataType: "json",
                                    success: function (response) {
                                        if(response.status==200){
                                            toastr.success("", "Cuenta borrada");
                                            setTimeout(()=>{
                                                window.location.replace("<?=base_url()?>");
                                            }, 1500)();
                                        }
                                    }
                                });
                            }
                        }
                    }
                }
            },
            1: {
                name : 'modal que sirve para dar de alta un mazo',
                config : {
                    title : '<h2>Alta de nuevo mazo</h2>',
                    message : '<p> Introduce nombre para tu nuveo mazo </p>'+
                    '<label for="deck-name">Nuevo mazo</label>'+
                    '<p><input type="text" id="deck-name" class="form-control" placeholder="Nombre del mazo"></p>',
                    buttons : {
                        newdeck : {
                            label : 'Nuevo Mazo',
                            className: 'btn btn-success',
                            callback : () => {                                
                                if($("#deck-name").val()!=''){
                                    $.ajax({
                                        type: "POST",
                                        url: "<?=base_url('master/user/user/createdeck')?>",
                                        data: {
                                            deck_name : $("#deck-name").val()
                                        },
                                        dataType: "json",
                                        success: function (response) {
                                            if(response.status==200){
                                                toastr.success("", "Argumentario creado");
                                                $(app.webMap.datatable[3].dom).dataTable().api().ajax.reload();
                                            }
                                        }
                                    });
                                }
                            }
                        }
                    }
                }
            }
        },
        datatable: {
            0: {
                name : 'datatable que muestra los libros que puede comprar el jugador',
                config : {
                    procesing : true,
                    serverSide : true,
                    ajax :{
                        method : "POST",
                        url :  "<?=base_url('/master/user/user/listbook')?>",
                    } ,
                    columnDefs: [
                        {
                            targets: 0,
                            render : function (data, type, row, meta){
                                return row.id
                            }
                        },
                        {
                            targets: 1,
                            render : function (data, type, row, meta){
                                return row.titulo
                            }
                        },
                        {
                            targets: 2,
                            render : function (data, type, row, meta){
                                return row.precio
                            }
                        },
                        {
                            targets: 3,
                            render : function (data, type, row, meta){
                                return row.acciones;
                            }
                        }
                    ],
                    fnDrawCallback: function(e){                        
                        $('[data-buy]').click(function(){
                            let table = $(app.webMap.datatable[0].dom).dataTable();
                            $.ajax({
                                type: "POST",
                                url: "<?=base_url('master/user/user/buybook')?>",
                                data: {
                                    id_book : $(this).data('id'),
                                    id_user : $(this).data('user-id')
                                },
                                dataType: "JSON",
                                success: function (response) {
                                    if(response.status==200){
                                        toastr.success("", "Compra realizada"); 
                                        table.api().ajax.reload();
                                        $($('.money')[0]).html(`Fondos: ${response.data}`);
                                        $($('.money')[1]).html(`Fondos: ${response.data}`);                         
                                    }else{
                                        toastr.error("", "Compra no completada")
                                    }
                                }
                            });
                        })
                    }, 
                    fnInitComplete : function(e){
                        $($('.money')[0]).html('Fondos: <?=esc($user)[0]['dinero']?>');
                        $($('.money')[1]).html('Fondos: <?=esc($user)[0]['dinero']?>');                          
                    }
                },
            },
            1: {
                name : 'datatable que muestra usuarios del juego',
                config : {
                    procesing : true,
                    serverSide : true,
                    ajax :{
                        method : "POST",
                        url :  "<?=base_url('/master/user/user/lookingforfriends')?>",
                    } ,
                    columnDefs: [
                        {
                            targets: 0,
                            render : function (data, type, row, meta){
                                return row.id
                            }
                        },
                        {
                            targets: 1,
                            render : function (data, type, row, meta){                                
                                return row.nombre
                            }
                        },                       
                        {
                            targets: 2,
                            render : function (data, type, row, meta){
                                return row.acciones
                            }
                        }
                    ],
                    fnDrawCallback: function(e){
                        $('[data-friend]').click(function(){                             
                            let table = $(app.webMap.datatable[0].dom).dataTable();
                            $.ajax({
                                type: "POST",
                                url: "<?=base_url('master/user/user/addfriend')?>",
                                data: {
                                    id_solicitante : $(this).data('id')
                                },
                                dataType: "JSON",
                                success: function (response) {
                                    if(response.status==200){
                                        toastr.success("", response.msg);
                                        table.api().ajax.reload();
                                    }else{
                                        toastr.error("", response.msg)
                                    }
                                }
                            });
                        })
                    }
                }
            },
            2: {
                name : 'datatable que muestra los libros que tiene un jugador',
                config : {
                    procesing : true,
                    serverSide : true,
                    ajax :{
                        method : "POST",
                        url :  "<?=base_url('/master/user/user/booklist')?>"
                    } ,
                    columnDefs: [
                        {
                            targets: 0,
                            render : function (data, type, row, meta){
                                return row.id
                            }
                        },
                        {
                            targets: 1,
                            render : function (data, type, row, meta){
                                return row.titulo
                            }
                        },
                        {
                            targets: 2,
                            render : function (data, type, row, meta){
                                return row.autor
                            }
                        },
                        {
                            targets: 3,
                            render : function (data, type, row, meta){                                
                                return row.apellidos
                            }
                        },
                        {
                            targets: 4,
                            render : function (data, type, row, meta){                                
                                return row.disciplina
                            }
                        },
                        {
                            targets: 5,
                            render : function (data, type, row, meta){                                
                                return row.acciones
                            }
                        }
                    ],
                    fnDrawCallback: function(e){                     
                        $('[data-read]').click(function(){
                            $.ajax({
                                type: "POST",
                                url: "<?=base_url('master/user/user/readbook')?>",
                                data: {
                                    id_book : $(this).data('id')
                                },
                                dataType: "JSON",
                                success: function (response) {
                                    if(response.status==200){
                                        toastr.success("", "Concepto aprendido");
                                        setTimeout(()=>{
                                            //Se habilita modal con el concepto mostrándolo
                                            bootbox.alert({
                                                message: '<h2>Has obtenido '+response.data[0].nombre+'</h2>' +
                                                    '<p>',
                                                className: 'animate__animated animate__bounce'
                                            });
                                        },1500);
                                    }else{
                                        toastr.error("", response.msg)
                                    }
                                }
                            });
                        })
                    }
                }
            },
            3: {
                name : 'datatable que muestra los argumentarios de un jugador',
                config : {
                    info : false,
                    autoWidth: true,
                    ajax :{
                        type : "POST",
                        url :  "<?=base_url('/master/user/user/decklist')?>",
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
                                return `
                                    <a class="btn btn-warning" href="<?=base_url('master/user/user/deckbuilder')?>?id=${row.id}" target="_blank">Editar Mazo</a>
                                    <button class="btn btn-danger" data-argumentario-delete-id="${row.id}">Eliminar Mazo</button>
                                `;
                            }
                        },
                    ],
                    fnDrawCallback: function(e){              
                        $('[data-argumentario-delete-id]').unbind('click');
                        $('[data-argumentario-delete-id]').click(function(){                            
                            $.ajax({
                                type: "POST",
                                url: "<?=base_url('/master/user/user/deletedeck')?>",
                                data: {
                                    id_deck : $(this).data('argumentarioDeleteId')
                                },
                                dataType: "JSON",
                                success: function (response) {
                                    if(response.status==200){
                                        Command : toastr.success('', 'Argumentario eliminado');
                                        $(app.webMap.datatable[3].dom).dataTable().api().ajax.reload();
                                    }
                                }
                            });
                        })
                    }
                } 
            },
            4: {
                name : 'Datatabla que muestra los amigos que tienes',
                config : {
                    paging : false,
                    ajax: {
                        type : "POST",
                        url :  "<?=base_url('/master/user/user/friendlist')?>",
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
                                return `
                                <td>
                                    <button class="btn btn-primary" data-chat = "${data}"><i class="fa-solid fa-comment"></i></button>
                                    <button class="btn btn-danger" data-eliminar-amigo = "${data}"><i class="fa-solid fa-trash"></i></button>
                                </td>
                                `;
                            }
                        },
                        {
                            targets: 2,
                            data: 'enlinea',
                            render : function(data, type, row, meta){                                
                                if(data==1){
                                    return `
                                    <span class="badge bg-success">&nbsp</span>
                                    `
                                }
                                return `
                                    <span class="badge bg-danger">&nbsp</span>
                                `;
                            }
                        }
                    ],
                    fnDrawCallback : function(data){
                        $('[data-eliminar-amigo]').unbind('click');
                        $('[data-eliminar-amigo]').click(function(){
                            bootbox.dialog({
                                title : '<h5>Borrar amigo</h5>',
                                message : '<p>¿Quieres borrar a este amigo?</p>',
                                buttons : {
                                    confirmar : {
                                        label : 'Si',
                                        className : 'btn btn-danger',
                                        callback : ()=>{
                                            $.ajax({
                                                type: "POST",
                                                url: "<?=base_url('master/user/user/deletefriend')?>",
                                                data: {
                                                    id_player : $(this).data('eliminarAmigo')
                                                },
                                                dataType: "JSON",
                                                success: function (response) {
                                                    $(app.webMap.datatable[4].dom).dataTable().api().ajax.reload();
                                                }
                                            });
                                        }
                                    }
                                }
                            })
                        });
                        $('[data-chat]').unbind('click');
                        $('[data-chat]').click(function(){
                            let idChat = $(this).data('chat');
                            let datos = data.json.data;
                            datos = datos.filter((ele)=>{
                                if(ele.id == idChat) return ele;
                            })[0];
                            $.ajax({
                                type: "POST",
                                url: "<?=base_url('master/user/user/historicchat')?>",
                                data: {
                                    id_otrousuario : idChat
                                },
                                dataType: "JSON",
                                success: function (response) {
                                    console.log(response)
                                    if(response.status === 200){
                                        bootbox.dialog({
                                            title : `<h5> Hablar con ${datos.nombre} <h5>`,
                                            message : `<div class="chat-screen border">                                    
                                                        <div id="chat-screen-${idChat}" class="m-auto d-flex flex-column scroled-element w-100" style="height:40vh" id="chat-screen-${idChat}">
                                                            ${response.html}
                                                        </div>    
                                                        <input type="text" class="form-control" id="chat-message" name="message" placeholder="Escribe tu mensaje" style="resize:none;"></textarea>
                                                    <div>
                                                    </div>
                                            <div>`,
                                            onShow : (e) =>{
                                                //$(`#chat-screen-${data.data.id_hablante}`).height()*1999999
                                                 $(`#chat-screen-${idChat}`).animate({ scrollTop: Number.MAX_SAFE_INTEGER}, 1000);                                                            
                                                $('#chat-message').keypress(function(ev){
                                                    const fecha = moment().format('YYYY-MM-DD hh:mm:ss');
                                                    if(ev.originalEvent.code === 'Enter'){             
                                                        app.webMap.event[1].class.config.event.socket.send(`
                                                           {
                                                            "type": "chat",
                                                            "data": {
                                                                "id_hablante" : "<?=esc($user)[0]['id']?>",
                                                                "id_oyente": "${datos.id}",
                                                                "message": "${$('#chat-message').val()}",
                                                                "user": "<?=esc($user)[0]['nombre']?>",
                                                                "date": "${fecha}"
                                                                }
                                                            }`)                                            
                                                        $(`#chat-screen-${idChat}`).append(`
                                                        <div class="col-8 align-self-end border rounded mt-2 coment">
                                                            <p class="h-25 mr-3 coment">
                                                                <b style="font-size:0.8rem">YO:</b><small style="font-size:0.8rem">${fecha}</small><p>${$(this).val()}</p> 
                                                            </p>
                                                        </div>
                                                        `);
                                                        $(`#chat-screen-${idChat}`).animate({ scrollTop: Number.MAX_SAFE_INTEGER }, 1000);
                                                        $(this).val('');
                                                    }
                                                })
                                            }
                                        }) 
                                    }
                                }
                            });
                        })
                    }
                },
            }
        }
    });
    $('.user-img').css({
        'background-image' : 'url("<?=esc($user[0]['img_perfil'])?>")',
        'background-color': 'black',
        'width' : '300px',
        'height' : '300px',
        'background-size' : '100% 100%',
        'border-radius' : '50%'
    });
})
</script>
<main class="pc-body d-flex flex-column aling-items-center justify-content-center">
<div class="text-center user-header">
    <div class="user-img">

    </div>
    <div class="user-title">
        <h3>Usuario: <?=esc($user[0]['nombre'])?></h3>
        <h4 class="money">Fondos: <?=esc($user[0]['dinero'])?></h4>
    </div>
</div>
<!-- Button trigger modal -->
<?php foreach(esc($languaje['usermenu']) as $key=>$value):?>
    <?php if($key!='exit'):?>
<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#<?=$key?>">
    <?=$value?>
</button>
    <?php endif;?>

<!-- Modal -->
<?php if($key=='play'):?>
    <div class="modal fade" id="<?=$key?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel"><?=$value?></h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div>
                <h3>Selecciona como quieres jugar</h3>
                <div class="d-flex flex-colum">
                    <button class="btn">Online</button>
                    <button class="btn">Con amigo</button>
                </div>
            </div>
        </div>
        </div>
    </div>
</div>
<?php endif;?>
<?php if($key=='viewprofile'):?>
    <div class="modal fade" id="<?=$key?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel"><?=$value?></h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form data-library-func="form-0" action="<?=base_url('master/user/user/userprofile')?>" class="d-flex flex-column">
                <div>
                    <label class="form-label" for="<?=esc($languaje)['profile']['playername']?>"><?=esc($languaje)['profile']['playername']?></label>
                    <input data-get type="text" class="form-control" id="<?=esc($languaje)['profile']['playername']?>" name="nombre" value="<?=esc($user)[0]['nombre']?>">
                </div>
                <div>
                    <label class="form-label" for="<?=esc($languaje)['profile']['password']?>"><?=esc($languaje)['profile']['password']?></label>
                    <input data-get type="password" class="form-control" id="<?=esc($languaje)['profile']['password']?>" name="contrasena" value="" placeholder="********">
                </div>
                <div>
                    <label class="form-label" for="<?=esc($languaje)['profile']['image']?>"><?=esc($languaje)['profile']['image']?></label>
                    <input data-get type="file" class="form-control" id="<?=esc($languaje)['profile']['image']?>" name="img_perfil">
                </div>
                <div>
                    <label class="form-label" for="<?=esc($languaje)['profile']['email']?>"><?=esc($languaje)['profile']['email']?></label>
                    <input data-get type="mail" class="form-control" id="<?=esc($languaje)['profile']['email']?>" name="direccion" value="<?=esc($user)[0]['direccion']?>">
                </div>
                <div class="mt-4 d-flex justify-content-around">
                    <div class="col-4">
                        <button type="button" class="btn btn-warning" data-send> Actualizar Datos </button>
                    </div>
                    <div class="col-4">
                        <button id="delete-acount" data-library-func="modal-0" data-id="<?=esc($user)[0]['id']?>" type="button" class="btn btn-danger"> Borrar cuenta </button>
                    </div>
                </div>
            </form>
        </div>
        </div>
    </div>
</div>
<?php endif;?>
<?php if($key=='buybooks'):?>
    <div class="modal fade" id="<?=$key?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel"><?=$value?></h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <p class="money"></p>
            <table data-library-func="datatable-0" class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Titulo</th>
                        <th>Precio</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
        </div>
    </div>
</div>
<?php endif;?>
<?php if($key=='buildarguments'):?>
    <div class="modal fade" id="<?=$key?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel"><?=$value?></h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="row">
                <h5 class="text-center col-11">Listado de mazos creados</h5>
                <button data-library-func="modal-1" class="btn btn-primary col-1">+</button>
            </div>
            <div class="w-100">
                <table data-library-func="datatable-3">
                     <thead>
                         <tr>
                             <th>Nombre</th>
                             <th>Acciones</th>
                         </tr>
                     </thead>
                     <tbody>
     
                     </tbody>
                </table>
            </div>
        </div>
        </div>
    </div>
</div>
<?php endif;?>
<?php if($key=='friendlist'):?>
    <div class="modal fade" id="<?=$key?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel"><?=$value?></h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="container-fluid row">
                <div class="col-md-6 col-sm-12">
                    <h5>Usuarios del juego</h5>
                    <table data-library-func="datatable-1" class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
        
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6 col-sm-12">
                    <h5>Amigos</h5>
                    <table  data-library-func="datatable-4" class="table">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Acciones</th>
                                <th>En línea</th>
                        </thead>
                        <tbody>
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        </div>
    </div>
</div>
<?php endif;?>
<?php if($key=='readbook'):?>
    <div class="modal fade" id="<?=$key?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel"><?=$value?></h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
        <table data-library-func="datatable-2" class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Titulo</th>
                        <th>Autor</th>
                        <th>Apellidos</th>
                        <th>Disciplina</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
        </div>
    </div>
</div>
<?php endif;?>
<?php if($key == 'getmorecash'):?>
    <div class="modal fade" id="<?=$key?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel"><?=$value?></h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            ¿Cuanto vas a pagar?
        </div>
        </div>
    </div>
</div>
<?php endif;?>
<?php if($key=='exit'):?>
    <a class="btn" href="<?=base_url('/master/user/user/logout')?>"><?=$value?></a>
<?php endif;?>
<?php endforeach;?>

</main>
