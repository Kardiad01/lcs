<main class="pc-body d-flex flex-column aling-items-center justify-content-center">

<div class="text-center user-header">
    <div class="user-img">

    </div>
    <div class="user-title">
        <h3>Usuario: <?=esc($user[0]['nombre'])?></h3>
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
    <div class="modal-dialog">
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
            <form data-form="form" action="<?=base_url('master/user/user/userprofile')?>" class="d-flex flex-column">
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
                <div class="mt-4 col-12">
                    <button type="button" class="btn btn-warning" data-send> Actualizar Datos </button>
                </div>
            </form>
        </div>
        </div>
    </div>
</div>
<?php endif;?>
<?php if($key=='buybooks'):?>
    <div class="modal fade" id="<?=$key?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel"><?=$value?></h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <?= $key ?>
        </div>
        </div>
    </div>
</div>
<?php endif;?>
<?php if($key=='buildarguments'):?>
    <div class="modal fade" id="<?=$key?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel"><?=$value?></h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <?= $key ?>
        </div>
        </div>
    </div>
</div>
<?php endif;?>
<?php if($key=='friendlist'):?>
    <div class="modal fade" id="<?=$key?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel"><?=$value?></h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <?=$key?>
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
<script>
$(document).ready(()=>{
    const app = new Profile({
        form:{
            name : 'form',
            config: {
                get: 'data-get',
                method: 'post',
                format: 'text',
                send: 'data-send',
                ajax: true,
                reload: false,
                redirect: false,
                debug: true
            }
        },
        
    });
    $('.user-img').css({
        'background-image' : 'url("<?=esc($user[0]['img_perfil'])?>")',
        'width' : '300px',
        'height' : '300px',
        'background-size' : '100% 100%',
        'border-radius' : '50%'
    });
})
</script>