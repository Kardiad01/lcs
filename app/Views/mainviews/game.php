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
        const regexp = new RegExp('\=.+?\&', 'g');
        const room_code = window.location.search.match(regexp)[0].replace('&', '').replace('=', '');
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
                            console.log('QUE CORRE LA PARTIDA!!!');
                            app.webMap.event.eljuego.class.config.event.socket.send(`{"type":"askstatus", "user":"<?=esc($user)[0]['id']?>", "room":"${room_code}"}`);
                        },
                        message: (ev)=>{
                            const data = JSON.parse(ev.data);
                            console.log(data)
                            if(data.type=='init'){
                                selectorDeck("<?=base_url('/master/user/user/decklist')?>" ,"<?=base_url('master/user/user/loaddeck')?>",  "<?=esc($user)[0]['id']?>", app);
                            }
                            if(data.type=='ready'){
                                data.data.forEach((ele)=>{
                                    $('.player-hand').append(`
                                    <div id="card${ele.id}">
                                        <h6 class="py-1">${ele.nombre}</h6>
                                        <div class="img">
                                            XDDDDDDDDDDDD
                                        </div>
                                        <div class="content">
                                            <p>
                                                <small>${ele.descripcion}</p>
                                            </p>
                                        </div>
                                    </div>
                                    `);
                                    console.log($(`card${ele.id}`));
                                    $(`#card${ele.id}`).on('contextmenu', function(e){
                                        e.preventDefault();
                                        bootbox.alert({
                                            title : `<h1>${ele.nombre}</h1>`,
                                            message : `
                                                <div>
                                                    <p>${ele.descripcion}</p>
                                                </div>
                                            `
                                        })
                                    })
                                    $(`#card${ele.id}`).on('click', function(e){
                                        app.webMap.event.eljuego.class.config.event.socket.send();
                                    })
                                })
                            }
                        },
                        close : (ev)=>{
                            window.close();
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
            
        </div>
        <!--End player hand-->
    </article>
    <!-- End game-->
</main>
<!--End videgoame-->