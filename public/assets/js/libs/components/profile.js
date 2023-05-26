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
        this._init();
    }

    /**
     * @method _init este método lanza los componentes y los instancia, registrándolo en la misma aplicación. Es decir, dentro de arraySources guarda un objeto source, el cual contendrá:
     * {
     *   dom : elemento del dom
     *   class : componente de la librería
     *   config : puesta desde el constructor.
     * 
     * }
     */
    _init(){
        [...this.funcionalDom].forEach((element)=>{
            let key = element.dataset.libraryFunc.split('-')[0];
            let position = element.dataset.libraryFunc.split('-')[1];
            if(!Object.hasOwn(this.webMap, key)){
                this.webMap[key] = {}
            }
            let component = new Component(key, element, this.sources[key][position].config);
            this.webMap[key][position] = {
                dom : element,
                class : component,
                component : `${key}-${position}`
            };
            this.arraySources.push(this.webMap[key][position]);
        });
        if(Object.hasOwn(this.sources, 'event')){
            Object.keys(this.sources.event).forEach((element)=>{
                if(Object.hasOwn(this.sources.event[element]), 'trigger'){
                    if(this.sources.event[element].config.trigger === document || this.sources.event[element].config.trigger === window){
                        this.webMap['event'] = {};
                        this.webMap['event'][element] = {};
                        let component = new Component('event', this.sources.event[element].config.trigger, this.sources['event'][element].config)
                        this.webMap['event'][element] = {
                            dom : this.sources.event[element].config.trigger,
                            class : component,
                            component : 'event'
                        }
                    }              
                }
                if((this.sources.event[element].config.event === 'observer'  || this.sources.event[element].config.event === 'websocket') 
                    && this.sources.event[element].config.trigger !== document && this.sources.event[element].config.trigger !== window){              
                    this.webMap['event'] = {};
                    this.webMap['event'][element] = {};
                    let component = new Component('event', this.sources.event[element].config.trigger, this.sources['event'][element].config)
                    this.webMap['event'][element] = {
                        dom : this.sources.event[element].config.trigger,
                        class : component,
                        component : 'event'
                    }
                }
            })
        }
    }

    /**
     * @method addComponent este método permite la inserción de un nuevo componente, intentando reutilizar los sources previamente cargados
     * o configuraciones previas. En caso de que no haya, se interpretará que se ha dado de alta como uno nuevo 
     * @param component String con el componente que va a ser.
     * @param position String de la posición que va a ocupar en la configuración
     * @param domElement HTMLOBJECT objeto del html que se va a parsear.
     * @param configRegister este parámetro es opcional y serviría para cargar la configuración si ya existe de algo. Si se quiere añadir nuevo
     * pues... se añade la config en otro maravilloso JSON  para hacer un JSON de JSONES 😂😂😂
     */
    addComponent(domElement, configRegister){
        domElement ?? false;
        if(!domElement){
            console.error('You need introduce a dom element with this structure: data-library-func="key-position". \n Where key = name of component and position = number o name that you give in your JSON');
            return;
        }
        if(typeof configRegister === "object"){
            let key = domElement.dataset.libraryFunc.split('-')[0];
            let position = domElement.dataset.libraryFunc.split('-')[1];
            if(!Object.hasOwn(this.webMap, key)){
                this.webMap[key] = {}
            }
            let component = new Component(key, domElement, configRegister[key][position].config);
            this.webMap[key][position] = {
                dom : domElement,
                class : component,
                component : `${key}-${position}`
            };
            this.arraySources.push(this.webMap[key][position]);
        }else{
            let key = configRegister.split('-')[0];
            let position = configRegister.split('-')[1];
            if(!Object.hasOwn(this.webMap, key)){
                this.webMap[key] = {}
            }
            let component = new Component(key, domElement, this.sources[key][position].config);
            this.webMap[key][position] = {
                dom : domElement,
                class : component,
                component : `${key}-${position}`
            };
            this.arraySources.push(this.webMap[key][position]);
        }
    }

}