<!-- mediaquery para que se vea de lado en teléfono móvil-->
<style>
    @media screen and (max-width: 500px) and ( orientation: portrait ) {
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
                            const beacon = {
                                type : 'finpartida',
                                room : room_code
                            }
                            const data = JSON.parse(ev.data);
                            console.log(data.type, data);
                            if(data.type=='finpartida'){
                                renderCartas(data, app, "<?=esc($user)[0]['id']?>");                                
                                ev.target.send(JSON.stringify(beacon));
                                //Cuando se acabe se reconocerá al usuario que ha ganado y saldrá
                                //Una modal con el mensaje que corresponda.
                                if(data.ganador === 'empate'){
                                    alert("empate");
                                    //ajax que mande resultado y borre o cambie a finalizada
                                    $.ajax({
                                        type: "POST",
                                        url: "<?=base_url('master/user/user/endgame')?>",
                                        data: {
                                            room : room_code,
                                        },
                                        dataType: "JSON",
                                        success: function (response) {
                                            
                                        }
                                    });
                                    window.close();
                                    return;
                                }
                                if(data.ganador!='' && data.ganador=="<?=esc($user)[0]['id']?>"){
                                    alert('HAS GANADOOOOO!!');
                                    //ajas que mande resultado
                                    $.ajax({
                                        type: "POST",
                                        url: "<?=base_url('master/user/user/endgame')?>",
                                        data: {
                                            room : room_code,
                                        },
                                        dataType: "JSON",
                                        success: function (response) {
                                            
                                        }
                                    });
                                    window.close();
                                    return;
                                }
                                if(data.ganador!='' && data.ganador!="<?=esc($user)[0]['id']?>"){
                                    alert('HAS PERDIDO OTRA VEZ SERÁÁÁÁÁÁ!');
                                    $.ajax({
                                        type: "POST",
                                        url: "<?=base_url('master/user/user/endgame')?>",
                                        data: {
                                            room : room_code,
                                        },
                                        dataType: "JSON",
                                        success: function (response) {
                                            
                                        }
                                    });
                                    window.close();
                                    return;
                                }
                            }
                            if(data.type=='init'){
                                selectorDeck("<?=base_url('/master/user/user/decksreadytoplaybyuser')?>" ,"<?=base_url('master/user/user/loaddeck')?>",  "<?=esc($user)[0]['id']?>", app);   
                            }
                            if(data.type=='ready'){      
                                toastr.info(`Turno de: ${("<?=esc($user)[0]['id']?>"===data.propietario_turno)?'tuyo':'rival'}`);
                                if($('.player-board').find('.concept-place').children().length==0){
                                    data.mano.forEach((ele)=>{
                                        startMatch(ele, app, <?=esc($user)[0]['id']?>, data.propietario_turno, room_code);
                                    })                                
                                }
                            }
                            if(data.type=='concepto'){
                                renderCartas(data, app, "<?=esc($user)[0]['id']?>");
                                /*vender como feature el jugar rápido y que no haya tiempo para responder, 
                                no hay avisos para tontos o lo sueltas o te olvidas*/
                            }
                            if(data.type=='replica' || data.type=='contrareplica' || data.type=='finturno'){
                                renderCartas(data,app, "<?=esc($user)[0]['id']?>");
                            }
                            if(data.type=='finturno'){
                                renderCartas(data,app, "<?=esc($user)[0]['id']?>");
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
                finturno : {
                    name : 'Botón que sirve para pasar de turno',
                    config : {
                        event : 'click',
                        trigger : null,
                        call : (e)=>{
                            const endTurn = {
                                type: 'finturno',
                                room: room_code,
                                id_jugador : "<?=esc($user)[0]['id']?>"
                            };
                            app.webMap.event.eljuego.class.config.event.socket.send(JSON.stringify(endTurn));
                        }   
                    }
                }
            }
        });
        console.log(app);
    })   
    /**
     * dejo comentado lo que sería el chat y el log por si no llego a tiempo
     * <!-- Start chat and log-->
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
     <!--End concept place-->
                
                <!--Start answer-->
                <div class="answer-place">
    
                </div>
                <!--End answer-->

                <!--Start deck-->
                <div class="deck-place">
    
                </div>
                <!--End deck-->
                 <!--End concept place-->
                
                <!--Start answer-->
                <div class="answer-place">
    
                </div>
                <!--End answer-->

                <!--Start deck-->
                <div class="deck-place">
    
                </div>
                <!--End deck-->
     */
</script>
<!--Start videgoame-->
<main>
    
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
            </div>
            <!--End opponent board-->
             <!--Start player board-->
             <div class="player-board">
                <!--Start concept place-->
                <div class="concept-place">
                    
                </div>
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