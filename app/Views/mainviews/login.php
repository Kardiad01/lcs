<main>
<?php if(esc($path)=='login'):?>
    <article class="external-reverse-image">

    </article>
        <article class="form" action="<?=base_url('master/landing/login/login', false)?>" method="post" data-library-func="form-0">
            <div class="form-head">
                <h2>Login</h2>
            </div>
            <div class="form-body">
                <label for="user" class="form-label">Usuario</label>
                <input type="text" class="form-control" id="user" name="user" placeholder="Usuario" data-get>
                <label for="pass" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="pass" name="pass" placeholder="Contraseña" data-get>
            </div>
            <a href="<?=base_url('/master/landing/login/mailtorecovery', false)?>">Olvidaste tu contraseña?</a>
            <div class="form-footer">
                <div class="mt-2">
                    <button class="btn btn-colorized w-75" data-send>Log In</button>
                </div>
                <div class="form-oauth mt-3">
                    <button data-library-func="event-google"><img src="<?=base_url('/assets/img/G.jpg', true)?>" width="50px" height="50px" alt="accede con tu cuenta de Google"></button>
                </div>
            </div>
        </div>
    </article>
    <article class="external-image">

    </article>
<?php elseif(esc($path)=='singin'):?>
    <article class="external-reverse-image">

    </article>
    <article class="form" action="<?=base_url('/master/landing/login/adduser', false)?>" method="post" data-library-func="form-0">
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
                <button class="btn btn-colorized w-75" data-send>Sign In</button>
            </div class="form-oauth mt-3">
            	<button data-library-func="event-google"><img src="<?=base_url('/assets/img/G.jpg', true)?>" width="50px" height="50px" alt="Registrate con tu cuenta Google"></button>
	    </div>
        </div>
    </article>
    <article class="external-image">
        
    </article>
<?php elseif(esc($path)=='mailtorecovery'):?>
<article class="external-reverse-image">

</article>
<article class="form" action="<?=base_url('/master/landing/login/recovery', false)?>" method="post" data-library-func="form-0">
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
<article class="form" action="<?=base_url('/master/landing/login/newpassword?code='.$_GET['code'], false)?>" method="post" data-library-func="form-0">
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
<script type="module">
import { initializeApp } from "https://www.gstatic.com/firebasejs/9.22.1/firebase-app.js";
import { getAuth, signInWithPopup, GoogleAuthProvider } from "https://www.gstatic.com/firebasejs/9.22.1/firebase-auth.js";
import { handleCredentialResponse} from '/assets/js/custom/google.js';

$(document).ready(()=>{
    const app = new App({
        form:{
            0:{
                config: {
                    get: 'data-get',
                    method: 'post',
                    format: 'JSON',
                    send: 'data-send',
                    ajax: true,
                    reload: false,
                    redirect: true,
                    debug: false
                }
            }
        },
        event:{
            google:{
                name : "boton google que hace cosas",
                config: {
                    event : 'click',
                    call : (e)=>{
                        const firebaseConfig = {
                            apiKey: "AIzaSyBnjVphA0_LAH29WLmHAinfpVpbs3DcKN8",
                            authDomain: "lascartasdesofia-35e3a.firebaseapp.com",
                            projectId: "lascartasdesofia-35e3a",
                            storageBucket: "lascartasdesofia-35e3a.appspot.com",
                            messagingSenderId: "565984624674",
                            appId: "1:565984624674:web:5e8b5c60d15b968d618a7b",
                            measurementId: "G-VW03VZPWHD"
                        };
                        const appi = initializeApp(firebaseConfig);
                        const auth = getAuth(appi);
                        const gapi = new GoogleAuthProvider();
                        gapi.addScope('https://www.googleapis.com/auth/userinfo.profile');
                        //añadir boton google tope y mazo de cutre para que puedas loguear con google.
                        signInWithPopup(auth, gapi).then((result)=>{
                            const credential = GoogleAuthProvider.credentialFromResult(result);
                            const token = credential.idToken;
                            handleCredentialResponse(token)                            
                        }).catch((error)=>{
                            const errorCode = error.code;
                            const errorMessage = error.message;
                            console.error(errorCode + ':' + errorMessage)
                            // The email of the user's account used.
                            const email = error.customData.email;
                            // The AuthCredential type that was used.
                            const credential = GoogleAuthProvider.credentialFromError(error);
                        })
                    }
                }
            }
        }
    });
})
</script>

