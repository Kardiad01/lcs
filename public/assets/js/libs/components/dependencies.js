class Dependencies {
    status = [];
    head = '';
    constructor(){
        this.head = document.querySelector('head');
        this.init();
    }
    
    init = async()=>{
        try {
            const conn = await fetch(window.location.href+'/imports.json');
            const json = await conn.json();
            json.required.forEach(async(element) => {
                const files = element[Object.keys(element)[0]].files;
                await new Promise((res, rej)=>{
                    if(files.css!=''){
                        this.cssFile(res, rej, json.BasePath+files.css);
                    }
                    this.jsFile(res, rej, json.BasePath+files.js);
                }).then(res => console.log(res))
                .catch(rej=>console.error(rej))
            });
        } catch (error) {
            console.log(error)
        }  
        console.log(this.head) 
    }

    jsFile = async(res, rej, url)=>{
        const jsTag = document.createElement('script');
        jsTag.setAttribute('src', url);
        jsTag.addEventListener('load', ()=>{
            res('carga de '+url+' completada')
        })
        jsTag.addEventListener('error', ()=>{
            rej('error')
        })
        this.head.appendChild(jsTag);
    }

    cssFile = async(res, rej, url)=>{
       const cssTag = document.createElement('link');
       cssTag.setAttribute('src', url);
       cssTag.addEventListener('load', ()=>{
            res(carga)
       })
    }

}