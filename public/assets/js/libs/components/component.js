/**
 * @Component esta clase lo que hace es generar el componente seleccionado por la clase Profile.
 */
class Component {
    domElement;
    component;
    data = {
        headers : {

        }
    };
    config = {
      date : {
         generate : this.date
     },
      modal: {
         generate : this.modal
      },
      datatable: {
         generate : this.datatable
      },
      form : {
        generate : this.dataExtract,
        send : this.send
      },
      buttonAjax : {
        generate : this.ajax,
      },
      carrousel: {
        generate : this.carrousel,
        others : this.others
      },
      animated : {
        generate : this.animated
      },
      button : {
        generate : this.button
      },
      event : {
        generate: this.event
      }
    };

    constructor(component, domElement, config){
         this.component = component;
         this.domElement = domElement;
         const datedObjects = Object.keys(this.config);
         datedObjects.forEach(object => {
             if(this.component == object){
                const pConfig = Object.keys(this.config[this.component]);
                pConfig.forEach(element=>{
                    this.config[this.component]['domElement'] = domElement;
                    this.config[this.component][element](config);
                })
             }
         });
    }

    event(config){
        if(config.trigger!=null){
            config.trigger.addEventListener(config.event, config.call);
        }else{
            this.domElement.addEventListener(config.event, config.call);
        }
        if(config.event == 'observer'){
            this['observe'] = {};
            this.observe = new MutationObserver(config.call);
            this.observe.observe(config.trigger, config.config);
        }
        if(config.event == 'websocket'){
            const urlregex = /(https:\/\/|http:\/\/)/g;
            this['socket'] = {};
            this.socket =  new WebSocket('ws:'+config.url.replace(urlregex, ''));
            this.socket.addEventListener('open', (e)=>{
                config.open(e)
            })
            this.socket.addEventListener('message', (e)=>{
                config.message(e)
            })
            this.socket.addEventListener('close', (e)=>{
                config.close(e)
            })
            this.socket.addEventListener('error', (e)=>{
                config.error(e)
            })
        }
    }

    //pendiente de mejorar
    ajax(config){
        $(this.domElement).on(config.event, async(e)=>{
            const form = new FormData();
            for(const formkey in config.data){
                form.append(formkey, config.data[formkey]);
            }
            const conn = await fetch(config.url, {
                method : config.method,
                body : form,
            });
            let res = '';
            if(config.type=='JSON') res = await conn.json(); 
            if(config.type=='text') res = await conn.text();
            if(config.type=='blob') res = await conn.blob();
            await config.success(res)();
            
        });
    }

    animated(config){
        anime(config)
    }

    others(config){
        config.others(this.instance);
    }
    
    carrousel(config){
        this['instance'] = '';
        this.instance = new Splide( this.domElement, config);
        this.instance.mount()
    }

    button(config){        
        $(this.domElement).on(config.event, config.callback);
    }
 
    date(config){
         $(this.domElement).flatpickr(config);
    }
 
    modal(config){
         $(this.domElement).on('click', function () {
            bootbox.dialog(config)
         });
    }
 
    datatable(config){
        $(this.domElement).DataTable(config);
    }
    
    dataExtract(config){
        if(config.ajax){
            const dElements = this.domElement.querySelectorAll(`[${config.get}]`);
            const sElement =  this.domElement.querySelector(`[${config.send}]`);
            if(this.domElement.tagName=='form'){
                this.data = {
                    formClass : new FormData(),
                    url : this.domElement.action,
                    type : this.domElement.enctype,
                    sender : sElement
                }
            }else{
                this.data = {
                    formClass : new FormData(),
                    url : this.domElement.attributes.action.textContent,
                    type: this.domElement.attributes.enctype,
                    sender: sElement
                }
            }
            dElements.forEach(element=>{
                if(element.type == 'file'){
                    const img = element.files[0];
                    if(img != undefined){
                        this.data.formClass.append(element.name, img);
                    }
                }else{
                    this.data.formClass.append(element.name, element.value);
                }
            });
        }
    }

    send(params){
        const s = ()=>{
            return params
        }
        $(this.data.sender).click(async()=>{
            this.generate(s());
       
            if(s().debug){
                for (const pair of this.data.formClass.entries()) {
                    console.log(`${pair[0]}, ${pair[1]}`);
                }
                console.log(s().method)
            }
            const conn = await fetch(this.data.url, {
                method: s().method,
                headers : this.data.headers,
                body: this.data.formClass
            });
            let resp = '';
            if(s().format!='text' && s().format!='blob'){
                resp = await conn.json();
            }else if(s().format=='text'){
                resp = await conn.text();
            }else if(s().format=='blob'){
                resp = await conn.blob();
            }else{
                return console.error('Format not defined or not valid')
            }
            
            if(s().debug){
                console.log(resp)
            }

            //Toastr msg
        
            if(resp.status == 200 && s().reload){
                window.location.reload();
            }else if(resp.status == 200 && !s().reload){
                if(Object.hasOwn(resp, 'msg')){
                    toastr.success("", resp.msg);
                }else{
                    toastr.success("", "Operación completada")
                }
            }else{
                if(Object.hasOwn(resp, 'msg')){
                    toastr.error("", resp.msg);
                }else{
                    toastr.error("", "Operación no completada")
                }
            }
            
            //redirect

            if(Object.hasOwn(resp, 'url') && s().redirect){
                window.location.replace(resp.url);
            }
        })
    }
}