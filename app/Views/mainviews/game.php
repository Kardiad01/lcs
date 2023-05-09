<!-- mediaquery para que se vea de lado en teléfono móvil-->
<style>
    @media screen and (max-width: 780px) and ( orientation: portrait ) {
        .game {
            display: none;
        }
        .advise{
            display: block;
        }   
    }
    .dataTables_wrapper{
        width: 100%;
        margin: 0;
    }
    table{
        margin: 0;
        width: 500px;
    }
    th{
        width: 100%;
        height: 5vh;
    }
    tbody, thead{
        width: 100%;
    }
</style>
<script>
    $(document).ready(()=>{
        const app = new App({
            event : {
                eljuego:{
                    name : 'EL websocket del juego que estará en otro servidor',
                    config : {
                        event: 'websocket',
                        trigger: document,
                        url : 'http://localhost:8282',
                        config: [],
                        open: (ev)=>{
                            console.log('QUE CORRE LA PARTIDA!!!')
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
                                                $.ajax({
                                                    type: "POST",
                                                    url: "<?=base_url('master/user/user/getcardsbydeck')?>",
                                                    data: {
                                                        id_deck : mazo
                                                    },
                                                    dataType: "JSON",
                                                    success: function (response) {
                                                        console.log(response)
                                                    }
                                                });
                                                const regexp = new RegExp('\=.+?\&', 'g')
                                                const room_code = window.location.search.match(regexp)[0].replace('&', '').replace('=', '');
                                                app.webMap.event.eljuego.class.config.event.socket.send(`{"type":"start", "deck":"${mazo}", "user":"<?=esc($user)[0]['id']?>", "room":"${room_code}"}`)
                                            }else{
                                                window.location.reload();
                                            }
                                        }
                                    }
                                }
                            });
                        },
                        message: (ev)=>{
                            console.log(ev)
                        },
                        close : (ev)=>{
                            console.log(ev)
                        },
                        error : (ev)=>{
                            console.log(ev)
                        }
                    }
                },
            }
        });
        console.log(app);
    })   
</script>
<!--Start videgoame-->
<main>
    <!-- Start chat and log-->
    <aside>
        <!--Start chat-->
        <div class="chat">
            <h6 class="py-3">Chat</h6>
            <!--Start chat screen-->
            <div class="chat-screen">

            </div>
            <div class="chat-box">
                <input type="text" class="form-control">
            </div>
            <!--End chat screen-->
        </div>
        <!--End chat-->
        <!--Start log-->
        <div class="log">
            <h6 class="py-3">Log</h6>
            <!--Aquí se van a poner p y un estilo de log no muy visible-->
        </div>
        <!--End chat-->
    </aside>
    <!-- End chat and log-->

    <!-- Start game-->
    <article>
        <!--Start opponent hand-->
        <div class="opponent-hand">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
        <!--End opponent hand-->
        <!--Start board-->
        <div class="board">
            <!--Start opponent board-->
            <div class="opponent-board">
                <!--Start concept place-->
                <div class="concept-place">
                    
                </div>
                <!--End concept place-->
                
                <!--Start answer-->
                <div class="answer-place">
    
                </div>
                <!--End answer-->

                <!--Start deck-->
                <div class="deck-place">
    
                </div>
                <!--End deck-->
            </div>
            <!--End opponent board-->
             <!--Start player board-->
             <div class="player-board">
                <!--Start concept place-->
                <div class="concept-place">
                    
                </div>
                <!--End concept place-->
                
                <!--Start answer-->
                <div class="answer-place">
    
                </div>
                <!--End answer-->

                <!--Start deck-->
                <div class="deck-place">
    
                </div>
                <!--End deck-->
            </div>
            <!--End player board-->
        </div>
        <!--End board-->
        <!--Start player hand-->
        <div class="player-hand">
            <div>
                <h6 class="py-1">Nombre Carta</h6>
                <div class="img">

                </div>
                <div class="content">
                    <p>Win Condition escuela</p>
                    <p>Efecto carta</p>
                </div>
            </div>
            <div>

            </div>
            <div>

            </div>
            <div>

            </div>
            <div>

            </div>
        </div>
        <!--End player hand-->
    </article>
    <!-- End game-->
</main>
<!--End videgoame-->