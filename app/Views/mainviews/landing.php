<main>
   <?php echo html_entity_decode(str_replace('RANDCARD', base_url('/assets/img/cartas/'.rand(1, 48).'.png'), esc($languaje)['main']))?>  
</main>
<script>
    $(document).ready(()=>{
        const windowSize = {
            width: $(window).width(),
            height: $(window).height()
        }
        const app = new App({
            carrousel:{
                0: {
                    config: {
                        width:  windowSize.width,
                        height: windowSize.height/2.5,
                        autoplay: true,
                        type   : 'loop',
                        rewind : true,
                        //añadir clase para poner un fondo o imagen a la flecha
                        classes: {
                                arrows: 'splide__arrows',
                                arrow : 'splide__arrow',
                                prev  : 'splide__arrow--prev',
                                next  : 'splide__arrow--next',
                        },
                        others: (dom)=>{
                            /*dom.on( 'pagination:mounted', function ( data ) {
                                //this line paint div container dots
                                data.list.classList.add( 'splide__pagination' );
                                data.items.forEach( function ( item ) {
                                    //this line paint dots
                                    item.button.textContent = item.page + 1 ;
                                } );
                            } );
                            dom.on( 'autoplay:playing', function ( rate ) {
                                //console.log( rate ); // 0-1
                            } );
                            dom.on( 'mounted move', function () {
                                var end  = dom.Components.Controller.getEnd() + 1;
                                var rate = Math.min( ( dom.index + 1 ) / end, 1 );
                                bar.style.width = String( 100 * rate ) + '%';
                            } );*/
                        }
                    }
                }
            },
            event:{
                lang : {
                    name : "Combo que te permite cambiar de lenguaje de la landing",
                    config : {
                        event : 'change',
                        call : (e)=>{
                            window.location.href = "<?=base_url()?>?lang="+e.target.value;
                        }
                    }
                }
            }                
        });
    })
</script>