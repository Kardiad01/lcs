<main>
    <article class="news">
        <h3><?=esc($languaje)['news']['n1']?></h3>
        <?php foreach(esc($languaje)['news'] as $key=>$value) :
            if($key!='n1') :
            ?>
            <div class="new">
               <img class="new-img" src="<?=base_url('assets/img/BackHead.webp')?>" alt="">
               <div class="new-body">
                  <p>
                    <?=$value?>
                  </p>
               </div> 
            </div>
            <?php endif;?>
        <?php endforeach;?>
    </article>
    <article class="presentation">
        <h2 class="text-center mt-3"> <?=esc($languaje)['ourgame']['head']?></h2>
        <section>
            <div class="section-image">
                <img src="<?=base_url('assets/img/otherbackground.png')?>">
            </div>
            <div class="section-body">
                <h3><?=esc($languaje)['ourgame']['o1']?></h3>
                <p><?=esc($languaje)['ourgame']['os1']?></p>
            </div>
        </section>
        <section>
            <div class="section-body">
                <h3><?=esc($languaje)['ourgame']['o2']?></h3>
                <p><?=esc($languaje)['ourgame']['os2']?></p>
            </div>
            <div class="section-image">
                <img src="<?=base_url('assets/img/otherbackground.png')?>">
            </div>
        </section>
        <section>
            <div class="section-image">
                <img src="<?=base_url('assets/img/otherbackground.png')?>">
            </div>
            <div class="section-body">
                <h3><?=esc($languaje)['ourgame']['o2']?></h3>
                <p><?=esc($languaje)['ourgame']['os2']?></p>
            </div>
        </section>
    </article>
    <article class="cards-of-game">
        <h3> <?=esc($languaje)['ourcards']['head']?></h3>
        <section>
            <div>

            </div>
        </section>
    </article>
</main>
<script>
    const app = new Profile({
        carrousel:{
            config: {
                width: '100vw',
                height: '500px',
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
                    dom.on( 'pagination:mounted', function ( data ) {
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
                    } );
                }
            }
        }
    });
</script>