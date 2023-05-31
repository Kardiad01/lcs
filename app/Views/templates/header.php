<!DOCTYPE html>
<html lang="es">
<head>
    <base href="<?php echo base_url('lcs/lcs/public', false);?>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <?php if(esc($path)=='login' || esc($path)=='singin'):?>
    <?php endif;?>
    <?php if(esc($path)=='user' || esc($path)=='videogame'):?>
        <script src="<?= base_url('/assets/js/custom/helper.js', true)?>"></script>
    <?php endif;?>
    <!--Css varios y css de librerías-->
    <link rel="stylesheet" href="<?=base_url('/assets/js/libs/fontawesome/css/all.css', true)?>">
    <link rel="stylesheet" href="<?=base_url('/assets/js/libs/splider/dist/css/splide.min.css', true);?>">
    <link rel="stylesheet" href="<?=base_url('/assets/js/libs/bootstrap/css/bootstrap.css', true);?>">
    <link rel="stylesheet" href="<?=base_url('/assets/js/libs/toastr/toastr.css', true);?>">
    <link rel="stylesheet" href="<?=base_url('/assets/js/libs/datatable/datatables.min.css', true);?>">
    <link rel="stylesheet" href="<?=base_url('/assets/css/animate.css', true);?>"/>
    <!--JavaScript y cosas de librerías-->
    <script src="<?=base_url('/assets/js/libs/jquery/jquery.js', true);?>"></script>
    <script src="<?=base_url('/assets/js/libs/datatable/datatables.min.js', true);?>"></script>
    <script src="<?=base_url('/assets/js/libs/bootbox/bootbox.js', true);?>"></script>
    <script src="<?=base_url('/assets/js/libs/moment/moment.js', true);?>"></script>
    <script src="<?=base_url('/assets/js/libs/toastr/toastr.js', true);?>"></script>
    <script src="<?=base_url('/assets/js/libs/bootstrap/js/bootstrap.js', true);?>"></script>
    <script src="<?=base_url('/assets/js/libs/anime/lib/anime.min.js', true);?>"></script>
    <script src="<?=base_url('/assets/js/libs/splider/dist/js/splide.min.js', true);?>"></script>
    <script src="<?=base_url('/assets/js/libs/components/component.js', true);?>"></script>
    <script src="<?=base_url('/assets/js/libs/components/profile.js', true);?>"></script>
    <script>
         $('table').css({
            "width": '100%',
            "min-width" : '300px',
            "max-width" : '1000px',
        });
    </script>
    <link rel="stylesheet" href="<?=base_url('/assets/css/styles.css', true);?>">
</head>
<body class="<?php 
    if(esc($path)=='landing'){
        echo 'body';
    }else if(esc($path)=='login' || esc($path)=='singin' || esc($path)=='mailtorecovery' || esc($path)=='restartpassword'){
        echo 'sign';
    }else if(esc($path)=='user'){
        echo 'user';
    }else if(esc($path)=='videogame'){
        echo 'game';
    }else if(esc($path)=='deckbuilder'){
        echo 'deck';
    }?>">
    <?php if(esc($path)!='user' && esc($path)!='deckbuilder'):?>
    <header>
    <nav class="navbar navbar-expand-md">
        <h2>
            <a class="navbar-brand brand-lcs" href="<?=(esc($path)=='user')?base_url('master/user/user/loadview', false):base_url('master/landing', false)?>?lang=es">LCS</a>
        </h2>
        <button class="navbar-toggler mr-5" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav w-100">
            <?php if(esc($path)!='user' && esc($path)!='videogame'):?>
                <?=html_entity_decode(esc($languaje)['combotoform'])?>
                <?php elseif(esc($path)=='videogame'):?>
                    <div class="d-flex flex-column m-auto">
                        <p id="puntosretante" style="width:200px">Puntos Jugador 1 : 0</p>
                        <p id="puntosretado" style="width:200px">Puntos Jugador 2 : 0</p>
                    </div>
                    <div class="d-flex flex-column m-auto">
                        <p id="manaretante" style="width:200px">Mana Jugador 1 : 10</p>
                        <p id="manaretado" style="width:200px">Mana Jugador 2 : 10</p>
                    </div>
                    <div>
                        <p id="turno"></p>
                    </div>
                    <div>
                        <button data-library-func="event-finturno" class="btn btn-info">Fin turno</button>
                    </div>
                <?php endif;?>
            </ul>
        </div>
    </nav>
        <?php if(esc($path)=='landing'):?>
            <?=html_entity_decode(esc($languaje)['combotocarousel'])?>
        <?php endif;?>
    <?php endif;?>
</header>
