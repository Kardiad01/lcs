<main>
<?php if(esc($path)=='login'):?>
    <article class="external-reverse-image">

    </article>
        <article class="form" action="<?=base_url('master/landing/login/login')?>" method="post" data-library-func="form-0">
            <div class="form-head">
                <h2>Login</h2>
            </div>
            <div class="form-body">
                <label for="user" class="form-label">Usuario</label>
                <input type="text" class="form-control" id="user" name="user" placeholder="Usuario" data-get>
                <label for="pass" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="pass" name="pass" placeholder="Contraseña" data-get>
            </div>
            <a href="<?=base_url('/master/landing/login/mailtorecovery')?>">Olvidaste tu contraseña?</a>
            <div class="form-footer">
                <div class="mt-2">
                    <button class="btn btn-colorized w-75" data-send>Log In</button>
                </div>
                <div>
                <p class="form-oauth mt-3">
                    <p id="g_id_onload"
                        data-client_id="1022634642221-ka80kvh3bluekv4noo7ntl2n2ti2mkmm.apps.googleusercontent.com"
                        data-context="signin"
                        data-ux_mode="popup"
                        data-callback="handleCredentialResponse"
                        data-nonce=""
                        data-auto_prompt="false"
                        class="d-none">
                    </p>

                    <p class="g_id_signin"
                        data-type="icon"
                        data-shape="circle"
                        data-theme="filled_black"
                        data-text="signin_with"
                        data-size="large">
                    </p>
                </p>
            </div>
        </div>
    </article>
    <article class="external-image">

    </article>
<?php elseif(esc($path)=='singin'):?>
    <article class="external-reverse-image">

    </article>
    <article class="form" action="<?=base_url('/master/landing/login/adduser')?>" method="post" data-library-func="form-0">
        <div class="form-head">
            <h2>Sing In</h2>
        </div>
        <div class="form-body">
            <label for="user" class="form-label">Usuario</label>
            <input type="text" class="form-control" id="user" name="user" placeholder="Usuario" data-get>
            <label for="mail" class="form-label">Correo</label>
            <input type="mail" class="form-control" id="mail" name="mail" placeholder="correo" data-get>
            <label for="pass" class="form-label">Contraseña</label>
            <input type="password" class="form-control" id="pass" name="pass" placeholder="Contraseña" data-get>
            <label for="pass1" class="form-label">Repite Contraseña</label>
            <input type="password" class="form-control" id="pass1" name="pass1" placeholder="Repite Contraseña" data-get>
        </div>
        <div class="form-footer mt-3">
            <div>
                <button class="btn btn-colorized w-75" data-send>Log In</button>
            </div>
            <div class="form-oauth mt-3">
                    <p id="g_id_onload"
                        data-client_id="1022634642221-ka80kvh3bluekv4noo7ntl2n2ti2mkmm.apps.googleusercontent.com"
                        data-context="signup"
                        data-ux_mode="popup"
                        data-callback="handleCredentialResponse"
                        data-nonce=""
                        data-auto_prompt="false"
                        class="d-none">
                    </p>

                    <p class="g_id_signin"
                        data-type="icon"
                        data-shape="circle"
                        data-theme="filled_black"
                        data-text="signin_with"
                        data-size="large">
                    </p>
                </p>
            </div>
        </div>
    </article>
    <article class="external-image">
        
    </article>
<?php elseif(esc($path)=='mailtorecovery'):?>
<article class="external-reverse-image">

</article>
<article class="form" action="<?=base_url('/master/landing/login/recovery')?>" method="post" data-library-func="form-0">
    <div class="form-head">
        <h2>Recupera tu cuenta</h2>
    </div>
    <div class="form-body py-5">
        <label for="mail" class="form-label">Introduce tu correo</label>
        <input type="mail" class="form-control" id="mail" name="mail" placeholder="Correo de registro" data-get>
    </div>
    <div class="form-footer py-5">
        <div>
            <button class="btn btn-colorized w-75" data-send>Recuperar Cuenta</button>
        </div>
    </div>
</article>
<article class="external-image">

</article>
<?php elseif(esc($path)=='restartpassword'):?>
<article class="external-reverse-image">

</article>
<article class="form" action="<?=base_url('/master/landing/login/newpassword?code='.$_GET['code'])?>" method="post" data-library-func="form-0">
    <div class="form-head">
        <h2>Cambia tu contraseña</h2>
    </div>
    <div class="form-body">
        <label for="pass" class="form-label">Nueva contraseña</label>
        <input type="password" class="form-control" id="pass" name="pass" placeholder="Contraseña" data-get>
        <label for="pass1" class="form-label">Repite nueva contraseña</label>
        <input type="password" class="form-control" id="pass1" name="pass1" placeholder="Contraseña" data-get>
    </div>
    <div class="form-footer">
        <div>
            <button class="btn btn-colorized w-75" data-send>Actualizar Contraseña</button>
        </div>
    </div>
</article>
<article class="external-image">

</article>
<?php endif;?>
</main>
<script>
$(document).ready(()=>{
    const app = new App({
        form:{
            0:{
                config: {
                    get: 'data-get',
                    method: 'post',
                    format: 'json',
                    send: 'data-send',
                    ajax: true,
                    reload: false,
                    redirect: true,
                    debug: true
                }
            }
        },
    });
})
</script>

