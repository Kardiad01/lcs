/**
 * @class Profile esta clase tiene por finalidad cargar todos los componentes de la página y guardarlos dentro de ella misma
 * @attribute webMap sería para escalar los recursos o componentes de la página, es decir, de decir que componentes existen
 * @attribute sources en este objeto se guardan las configuraciones que nosotros le decimos a la página.
 * @attribute arraySources en este array se guarda todo lo referente a los componentes de la página como una clase.
 * @constructor requiere de la configuración a añadir, la misma clase se encarga de obtener el dom completo. A parte de obtener las partes de código a la que le queramos dar de alta en este sistema.
 * para ello usamos un data-use para componentes que suponen otra librería como datatables, calendarios... en el form simplemente se ha generadao una forma de envío de cualquier formulario que está 
 * automatizado para que si desde back le llega un parámetro de mensaje sería puesto con toastr, y por otra parte se puede obtener una respuesta estandar de Operación completada en caso de que no le
 * quieras poner mensaje custom.
 *  
*/
class Profile {
    webMap = {
        func : {

        },
        form : {

        }
    };
    sources;
    data;
    arraySources = [];
    constructor(sources){
        //Esto es para encontrar aquellas cosas que tiene que usar nuestros componentes.
        this.webMap.func = document.querySelectorAll("[data-use]");
        this.webMap.form = document.querySelectorAll("[data-form]");
        this.sources = sources;
        if(Object.keys(sources).length!=0){
            this.sources = sources;
            this.init();
        }else{
            console.error("You need a json with a configuration and types of data to use");
        }
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
        this.webMap.func.forEach(element => {
            this.arraySources.push({
                dom : element,
                sources: this.sources[element.localName],
                class : new Component(element.dataset.use, element, this.sources[element.dataset.use].config)
            });
        });
        this.webMap.form.forEach(element => {
            console.log(this.sources[element.dataset.form])
            this.arraySources.push({
                dom : element,
                sources: this.sources[element.localName],
                class : new Component(element.dataset.form, element, this.sources[element.dataset.form].config),
            });
        })
    }

}