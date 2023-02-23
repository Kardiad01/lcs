/**
 * Menú hamburguesa cutre como él solo
 */
let ventana = window.self.innerWidth;
const opciones = document.getElementById('opciones');
const burgerBtn = document.getElementById('burger');
const aparicion = () =>{
    ventana = window.self.innerWidth;
    if(ventana<780){
        opciones.classList.remove('opciones');
        opciones.classList.add('d-none');
        burgerBtn.classList.remove('d-none')
        burgerBtn.classList.add('btnBurger');
        
    }else{
        opciones.classList.remove('d-none');
        opciones.classList.add('opciones');
        if(opciones.getAttribute('class').includes('opcionesBurger')){
            opciones.classList.remove('opcionesBurger');
            opciones.classList.add('opciones')
        }
        burgerBtn.classList.remove('btnBurger')
        burgerBtn.classList.add('d-none')
    }
}
burgerBtn.addEventListener('click', ()=>{
    opciones.classList.toggle('d-none');
    opciones.classList.toggle('opcionesBurger');
});
window.addEventListener('resize', aparicion);
aparicion();
/**
 * Cambios de idioma gestionados con js porque me apetecía
 */
document.getElementById('img').addEventListener('click', ()=>{
    const idioma = document.children[0].getAttribute('lang');
    console.log(idioma);
    if(idioma === 'en'){
        window.location.href='index.eng.html';
    }else{
        window.location.href='index.html';
    }
})

document.getElementById('lang').addEventListener('change', (event)=>{
    const idioma = document.getElementById('lang').value;
    const linku = window.location.href.substring(window.location.href.lastIndexOf('/')+1, window.location.href.length);
    const currentIdioma = document.children[0].getAttribute('lang');
    console.log(currentIdioma);
    console.log(linku);
    console.log(idioma);
    if(idioma!=currentIdioma && idioma!=''){
        if(idioma=='es'){
            window.location.href=linku.substring(0, linku.indexOf('.'))+'.html';
        }
        if(idioma=='en'){
            window.location.href=linku.substring(0, linku.indexOf('.'))+'.eng.html';
        }
    }
});
/**
 * Carrousel
 */
let timer = null;
let next = 0;
const funcionIntervalo = (total) =>{
    timer = setInterval(()=>{
        for(let x=0; x<total; x++){
            cosas[x].classList.remove('active');
        }
        next++;
        if(next>=total){
            next = 0;
        }
        if(next<0){
            next =0;
        }
        cosas[next].classList.add('active');
    }, 4000);
};
const cosas = document.querySelectorAll('.carousel-img-buttons');
const sig = document.querySelector('.buton-right');
const ant = document.querySelector('.buton-left');
let pulsado = false;
sig.addEventListener('click', ()=>{
    for(let x=0; x<cosas.length; x++){
        cosas[x].classList.remove('active');
    }
    next++;
    console.log('sig');
    cosas[next].classList.add('active');
    clearInterval(timer);
    pulsado=true;
    if(pulsado){
        setTimeout(()=>{
            funcionIntervalo(cosas.length);
            pulsado=false;
        }, 1000)
    }
})
ant.addEventListener('click', ()=>{
    for(let x=0; x<cosas.length; x++){
        cosas[x].classList.remove('active');
    }
    next--;
    console.log('ant');
    cosas[next].classList.add('active');
    clearInterval(timer);
    pulsado=true;
    if(pulsado){
        setTimeout(()=>{
            funcionIntervalo(cosas.length);
            pulsado=false;
        }, 1000)
    }
})
funcionIntervalo(cosas.length);

/**
 * Cartas vueltas
 */

const cartas = document.querySelector('.posicionar').children;
console.log(cartas);
for(let x=0; x<cartas.length; x++){
    cartas[x].addEventListener('mousemove', (event)=>{
        console.log(event);
        const pX = event.clientX;
        const pY = event.clientY;
        cartas[x].style.transform = `translate(${event.movementX}px, ${event.movementY}px) rotate(${event.movementX}deg)`;
        console.log('x: '+pX, 'y: '+pY);

    })
    cartas[x].addEventListener('mouseout', ()=>{
        cartas[x].style.transform = `rotate(0deg)`;
    })
    cartas[x].addEventListener('click', ()=>{
        const idioma = document.children[0].getAttribute('lang');
        if(cartas[x].children.length==0){
            cartas[x].innerHTML = (idioma==='es')?`
                <div class="carta-vuelta">
                  <h5 class="carta-titulo text-center mt-2">
                    La Duda Metódica
                  </h5>
                  <div class="carta-imagen">
    
                  </div>
                  <!--Mediaquery para el tamaño del texto-->
                  <div class="carta-efecto">
                    <p>
                      Cada vez que el rival juegue un concepto
                      Recibirá 1 punto menos de convicción.
                    </p>
                  </div>
                  <div class="carta-footer">
                    <small>Juego propiedad de Jafet Núñez</small>
                    <small>&copy;</small>
                  </div>
                </div>
                `:`
                <div class="carta-vuelta">
              <h5 class="carta-titulo text-center mt-2">
                Methodic doubt
              </h5>
              <div class="carta-imagen">

              </div>
              <div class="carta-efecto">
                <p>
                  Every time that your oponent plays a 
                  concept your oponent loses 1 point of convicition
                </p>
              </div>
              <div class="carta-footer">
                <small>Game in porperty of Jafet Núñez</small>
                <small>&copy;</small>
              </div>
            </div>
                `;
        }else{
            cartas[x].innerHTML = ``;
        }
    })
}