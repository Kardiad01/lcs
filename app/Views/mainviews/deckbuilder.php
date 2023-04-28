<script>
    $(document).ready(()=>{
        const app = new App(
            {
                datatable: {
                    conceptos : {
                        name : 'Datatable que muestra los conceptos',
                        config : {
                            responsive: true,
                            procesing : true,
                            serverSide : true,
                            ajax :{
                                method : "POST",
                                url :  "<?=base_url('/master/user/user/cardlist')?>"                                
                            } ,
                            columnDefs: [
                                {
                                    targets: 0,
                                    data : 'nombre',
                                    responsivePriority : 1,
                                    render : function (data, type, row, meta){
                                        return row.nombre
                                    }
                                },
                                {
                                    targets: 1,
                                    data : 'costo',
                                    render : function (data, type, row, meta){                               
                                        return data.replace('@t', ' min')
                                    }
                                },
                                {
                                    targets: 2,
                                    data: 'descripcion',
                                    render : function (data, type, row, meta){
                                        return row.descripcion
                                    }
                                },
                                {
                                    targets: 3,
                                    data: 'tipo',
                                    render : function (data, type, row, meta){                                
                                        return row.tipo
                                    }
                                },
                                {
                                    targets: 4,
                                    data: 'acciones',
                                    responsivePriority : 2,
                                    render : function (data, type, row, meta){                                
                                        return row.acciones
                                    }
                                },
                            ],
                            fnDrawCallback: function(e){                                    
                                
                                $('[data-add]').unbind('click');
                                $('[data-read]').unbind('click');
                                const id = window.location.search.replace('?id=', '');
                                const data = $(app.webMap.datatable.conceptos.dom).dataTable().api().ajax.json().data;
                                let mazoLocal = JSON.parse(window.localStorage.getItem('deck-'+id));
                                $('[data-add]').click(function(e){                                    
                                    let id_carta = $(this).data('id');
                                    const element = data.find((ele)=>{
                                        if(ele.id == id_carta) return ele;
                                    })
                                    if(!mazoLocal.cartas.some(ele=>ele.id==id_carta) && mazoLocal.cartas.length<20){
                                        mazoLocal.cartas.push(element);
                                        $('#cardlist').html('');
                                        mazoLocal.cartas.forEach((ele)=>{
                                            $('#cardlist').append(`
                                                <tr>
                                                    <td>${ele.nombre}</td>
                                                    <td>
                                                        <button class="btn btn-danger" data-id-carta="${ele.id}"><i class="fa-solid fa-minus"></i></button>
                                                    </td>
                                                </tr>
                                            `)
                                        })
                                    }else if(mazoLocal.cartas.some(ele=>ele.id==id_carta)){
                                        toastr.warning("", "Carta repetida");
                                    }else if(mazoLocal.cartas.length==20){
                                        toastr.warning("", "Ya tienes el tope");
                                    }
                                    window.localStorage.setItem('deck-'+id, '');
                                    window.localStorage.setItem('deck-'+id, JSON.stringify(mazoLocal));
                                    $('[data-id-carta]').unbind('click');
                                    $('[data-id-carta]').click(function(){
                                        mazoLocal.cartas = mazoLocal.cartas.map(el=>(el.id!=$(this).data('idCarta'))?el:null).filter(ele=>ele!=null);
                                        window.localStorage.setItem('deck-'+id, '');
                                        window.localStorage.setItem('deck-'+id, JSON.stringify(mazoLocal));
                                        $(this).parent().parent().remove();
                                        $('#cardcount').html(mazoLocal.cartas.length+'/20');
                                        $(app.webMap.datatable.conceptos.dom).dataTable().api().ajax.reload()
                                    })
                                    $('#cardcount').html(mazoLocal.cartas.length+'/20');
                                    $(app.webMap.datatable.conceptos.dom).dataTable().api().ajax.reload()
                                })
                                $('[data-read]').click(function(){                                                                        
                                    const text = data.find((ele)=>{
                                        if(ele.id == $(this).data('id')) return ele;
                                    })
                                    bootbox.alert({
                                        title : text.nombre,
                                        message : text.texto_aparicion
                                    })
                                })
                            },
                            fnInitComplete: function(){
                                const id = window.location.search.replace('?id=', '');
                                $.ajax({
                                    type: "POST",
                                    url: "<?=base_url('master/user/user/loaddeck')?>",
                                    data: {
                                        id_deck: id
                                    },
                                    dataType: "JSON",
                                    success: function (response) {
                                        if(response.data.length==0){
                                            //mazo no creado crear la copia
                                            let json = {};
                                            window.localStorage.getItem('deck-'+id)?? window.localStorage.setItem('deck-'+id, '{"cartas" : []}')
                                            mazoLocal = JSON.parse(window.localStorage.getItem('deck-'+id));
                                            $('#cardcount').html(mazoLocal.cartas.length+'/20');
                                            if(mazoLocal.cartas.length>0){
                                                mazoLocal.cartas.forEach((el)=>{
                                                    $('#cardlist').append(`
                                                    <tr>
                                                        <td>${el.nombre}</td>
                                                        <td>
                                                            <button class="btn btn-danger" data-id-carta="${el.id}"><i class="fa-solid fa-minus"></i></button>
                                                        </td>
                                                    </tr>
                                                `)
                                                })
                                            }
                                        }else{
                                            response.data.forEach((ele)=>{
                                                $('#cardlist').append(`
                                                    <tr>
                                                        <td>${ele.nombre}</td>
                                                        <td>
                                                            <button class="btn btn-danger" data-id-carta="${ele.id}""><i class="fa-solid fa-minus"></i></button>
                                                        </td>
                                                    </tr>
                                                `)
                                            })
                                            const tempJson = {
                                                cartas : response.data
                                            }
                                            window.localStorage.setItem('deck-'+id, JSON.stringify(tempJson));
                                            mazoLocal = JSON.parse(window.localStorage.getItem('deck-'+id));
                                            $('#cardcount').html(mazoLocal.cartas.length+'/20');
                                        }
                                        $('[data-id-carta]').click(function(){
                                            mazoLocal.cartas = mazoLocal.cartas.map(el=>(el.id!=$(this).data('idCarta'))?el:null).filter(ele=>ele!=null);
                                            window.localStorage.setItem('deck-'+id, '');
                                            window.localStorage.setItem('deck-'+id, JSON.stringify(mazoLocal));
                                            $(this).parent().parent().remove();
                                            $('#cardcount').html(mazoLocal.cartas.length+'/20');
                                            $(app.webMap.datatable.conceptos.dom).dataTable().api().ajax.reload()
                                        })                                       
                                        $('#senddeck').unbind('click');
                                        $('#senddeck').click(()=>{
                                            mazoLocal = JSON.parse(window.localStorage.getItem('deck-'+id))                                    
                                            $.ajax({
                                                type: "POST",
                                                url: "<?=base_url('master/user/user/addcardstodeck')?>",
                                                data: {
                                                    cards : mazoLocal.cartas,
                                                    id_deck : id
                                                },
                                                dataType: "JSON",
                                                success: function (response) {
                                                    window.localStorage.removeItem('deck-'+id)
                                                    if(response.status==200){
                                                        toastr.success('', response.msg);
                                                        setTimeout(()=>{
                                                            window.close();
                                                        },1000);
                                                    }else{
                                                        toastr.error('', response.msg)
                                                    }
                                                }
                                            });
                                        })
                                        $(app.webMap.datatable.conceptos.dom).dataTable().api().ajax.reload()
                                    }
                                });
                            }
                        }
                    }
                }
            }
        );
    })
</script>
<h1 class="text-center">
    <?=esc($deck[0]['nombre'])?>
</h1>
<div class="container-fluid d-flex flex-row deckbuilder mt-2 border">
        <div class="col-8">
            <h2>Cartas</h2>
            <table data-library-func="datatable-conceptos" class="table">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Costo</th>
                        <th>Efecto</th>
                        <th>Tipo</th>
                        <th>Añadir</th>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>                
            </table>
        </div>
        <div class="col-4 text-center border seleccion">
            <div>
                <h2>Seleccionadas</h2>
                <p id="cardcount">0/20</p>
            </div>
            <div class="listado">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="cardlist">
                       
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="acciones">
        <button id="senddeck" class="btn btn-success">Guardar Cambios</button>
    </div>