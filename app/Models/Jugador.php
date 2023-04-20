<?php

namespace App\Models;
use App\Models\AModel;

class Jugador extends AModel{
    
    public function __construct()
    {
        $this->init(get_class($this));
    }

    public function secureUpdate($params, $id){
        $model = $this->where('id', $id);
        foreach($params as $key=>$value){
            $model->set($key, $value);

        }
        $model->update();
    }    

    /**
     * Consultas que se hacen sobre este modelo:
     * 1º Listado de libros que tiene un jugador
     * 2º Listado de amigos que tiene un jugador
     * 3º Listado de cartas que tiene un jugador
     * 4º Listado de mazos que tiene un jugador
     * Opcional: ¿Obtener info de partida?
     */

}

?>