<?php if(esc($path)=='landing'):?>
<footer>
    <div class="languaje">
        <select class="form-select">
        <?php $idiomas = glob(FCPATH.'/assets/languajedata/*.txt'); 
        $currentLanguaje = strtolower(esc($languaje)['meta']['meta']);
        echo $currentLanguaje;
        foreach($idiomas as $idioma):
            preg_match('/\/\w+\./', $idioma, $res);
            $lang =  preg_replace('/(\.|\/)/', '', $res[0]);
            ?>
            <option <?=($lang==strtolower($currentLanguaje))?'selected':''?>><?=$lang?></option>
        <?php endforeach; ?>
        </select>
    </div>
    <div class="company">
        <div class="pegi">
            <!--PEGI Y ESAS MIERDAS-->
            <div>
                <img src="<?=base_url('assets/img/pegi7.jpg')?>" alt="">
            </div>
            <div>
                <img src="<?=base_url('assets/img/pegigamblin.jpg')?>" alt="">
            </div>
            <div>
                <img src="<?=base_url('assets/img/pegionline.jpg')?>" alt="">
            </div>
            <div>
                <img src="<?=base_url('assets/img/pegiteens.jpg')?>" alt="">
            </div>
        </div>
        <div class="contact">
            <!--UBICACIÓN DE LA EMPRESA Y COSAS-->
            <h4>Sobre nosotros</h4>
            <p><i class="fa-solid fa-building"></i>&nbsp;<small>Sokrates Entertaiment S.L</small></p>
            <p><i class="fa-solid fa-envelopes-bulk"></i>&nbsp;<small>lcscustomerservice@oulook.com</small></p>
        </div>
    </div>
</footer>
<?php endif;?>
</body>
</html>