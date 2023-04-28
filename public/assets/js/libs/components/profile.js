/**
 * @class App esta clase tiene por finalidad cargar todos los componentes de la página y guardarlos dentro de ella misma
 * @attribute webMap sería para escalar los recursos o componentes de la página, es decir, de decir que componentes existen
 * @attribute sources en este objeto se guardan las configuraciones que nosotros le decimos a la página.
 * @attribute arraySources en este array se guarda todo lo referente a los componentes de la página como una clase.
 * @constructor requiere de la configuración a añadir, la misma clase se encarga de obtener el dom completo. A parte de obtener las partes de código a la que le queramos dar de alta en este sistema.
 * para ello usamos un data-use para componentes que suponen otra librería como datatables, calendarios... en el form simplemente se ha generadao una forma de envío de cualquier formulario que está 
 * automatizado para que si desde back le llega un parámetro de mensaje sería puesto con toastr, y por otra parte se puede obtener una respuesta estandar de Operación completada en caso de que no le
 * quieras poner mensaje custom.
 *  
*/
class App {
    funcionalDom;
    webMap = {};
    sources;
    data;
    arraySources = [];
    constructor(sources){
        //Esto es para encontrar aquellas cosas que tiene que usar nuestros componentes.
        this.funcionalDom = document.querySelectorAll("[data-library-func]");
        this.sources = sources;
        this.init();
    }

    /**
     * @method init este método lanza los componentes y los instancia, registrándolo en la misma aplicación. Es decir, dentro de arraySources guarda un objeto source, el cual contendrá:
     * {
     *   dom : elemento del dom
     *   class : componente de la librería
     *   config : puesta desde el constructor.
     * 
     * }
     */
    init(){
        [...this.funcionalDom].forEach((element)=>{
            let key = element.dataset.libraryFunc.split('-')[0];
            let position = element.dataset.libraryFunc.split('-')[1];
            if(!Object.hasOwn(this.webMap, key)){
                this.webMap[key] = {}
            }
            let component = new Component(key, element, this.sources[key][position].config);
            this.webMap[key][position] = {
                dom : element,
                class : component  
            };
            this.arraySources.push(this.webMap[key][position]);
        });
        if(Object.hasOwn(this.sources, 'event')){
            Object.keys(this.sources.event).forEach((element)=>{
                if(Object.hasOwn(this.sources.event[element]), 'trigger'){
                    if(this.sources.event[element].config.trigger == document || this.sources.event[element].config.trigger == window){
                        this.webMap['event'] = {};
                        this.webMap['event'][element] = {};
                        let component = new Component('event', this.sources.event[element].config.trigger, this.sources['event'][element].config)
                        this.webMap['event'][element] = {
                            dom : this.sources.event[element].config.trigger,
                            class : component
                        }
                    }                   
                }
                if(this.sources.event[element].config.event == 'observer'){
                    this.webMap['event'] = {};
                    this.webMap['event'][element] = {};
                    let component = new Component('event', this.sources.event[element].config.trigger, this.sources['event'][element].config)
                    this.webMap['event'][element] = {
                        dom : this.sources.event[element].config.trigger,
                        class : component
                    }
                }

                if(this.sources.event[element].config.event == 'websocket'){
                    //pdte implementación
                }
            })
        }
    }

}