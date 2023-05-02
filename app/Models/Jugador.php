<?php

namespace App\Models;
use App\Models\AModel;
use Exception;

class Jugador extends AModel{
    
    protected $db;

    public function __construct()
    {
        $this->init(get_class($this));
        $this->db = $this->db = \Config\Database::connect();
    }

    public function conceptsbyuser($id_user, $id_book){
        return $this->selectCount('conceptos_jugador.id_concepto')
        ->join('conceptos_jugador', 'conceptos_jugador.id_jugador=jugador.id')
        ->join('concepto_libros', 'concepto_libros.id_concepto=conceptos_jugador.id_concepto')
        ->where('concepto_libros.id_libro', $id_book)
        ->where('conceptos_jugador.id_jugador', $id_user)
        ->get()
        ->getResultArray();
    }

    public function userconcepts($session){
        $data =  $this->select('conceptos_jugador.id_concepto')
            ->join('conceptos_jugador', 'jugador.id=conceptos_jugador.id_jugador')
            ->where('jugador.id', $session['id'])->get()->getResultArray();
        return array_map(function($elements){
            return $elements['id_concepto'];
        }, $data);
    }

    public function secureUpdate($params, $id){
        $model = $this->where('id', $id);
        foreach($params as $key=>$value){
            $model->set($key, $value);

        }
        $model->update();
    }    

    public function getDeleteData($id){
        return $this->select('contrasena, img_perfil')
            ->where('id', $id)
            ->get()->getResultArray();
    }


    public function getpaginatedfriends($requiredParamsToDT, $session){
        $results = [];
        $paginatedBooks = $this->select('id, nombre, enlinea')
            ->like('nombre', $requiredParamsToDT['busqueda'])
            ->orderBy($requiredParamsToDT['ordenacion'], $requiredParamsToDT['dir_ord'])
            ->limit($requiredParamsToDT['inicio'], $requiredParamsToDT['longitud'])
            ->where('id!='.$session['id'])
            ->get()->getResultArray();
        foreach($paginatedBooks as $value){
            $value['acciones'] = '<button class="btn btn-success" data-friend data-user-id="'.$session['id'].'"  data-id="' . $value['id'] . '">Añadir amigo</button>';
            $results[] = $value;
        }
        return $results;
    }

    public function listofmasteredbook($id_user, $id_book){
        $masteredBooks = array_map(function($elements){
            return $elements['id_libro'];
        }, $this->select('masterizados.id_libro')
            ->join('masterizados', 'jugador.id=masterizados.id_jugador')
            ->where('id_jugador', $id_user)
            ->get()->getResultArray());
        if(in_array($id_book, $masteredBooks)){
            return true;
        }else{
            return false;
        }
    }


    public function rejectnewfriend($id_user){
        $this->db->table('amigos')->set('checkeado', 1)->where('id_solicitado', $id_user)->update();
    }

    public function aceptnewfriend($id_user){
        $this->db->table('amigos')->set('checkeado', 1)->set('confirmado', 1)->where('id_solicitado', $id_user)->update();
    }

    public function masteredbook($id_user, $id_book){
        $this->db->table('masterizados')->insert([
            'id_libro' => $id_book,
            'id_jugador' => $id_user
        ]);
    }

    public function makefriends($params){
        $this->db->table('amigos')->insert($params);
    }

    public function friendrequest($id){
        $id_request = $this->db->table('amigos')
            ->select('amigos.id_solicitado')
            ->where('amigos.id_solicitante', $id)
            ->where('checkeado', 0)
            ->get()->getResultArray();
        $data = [];
        foreach($id_request as $value){
            $data[] = $this->select()->where('id', $value)->get()->getResultArray();
        }
        return $data;
    }

    public function friendbyuser($id_usuario){
        return $this->db->table('amigos')
            ->selectCount('amigos.id_solicitado')
            ->where("amigos.id_solicitante = $id_usuario or amigos.id_solicitado = $id_usuario")
            ->where('amigos.confirmado', 1)->get()->getResultArray()[0]['id_solicitado'];
    }

    public function friendlist($params, $id_usuario){
        //esta consulta tiene que ir de otra manera
        return $this->select('id, nombre, enlinea')
            ->like('nombre', $params['busqueda'])
            ->join('amigos', 'amigos.id_solicitante=jugador.id')
            ->orderBy($params['ordenacion'], $params['dir_ord'])
            ->limit($params['inicio'], $params['longitud'])
            ->where('id', $id_usuario)
            ->where('confirmado', 1)
            ->get()->getResultArray();
    }

    public function deletefriend($id_jugador, $id_user){
        $this->db->table('amigos')
            ->where("amigos.id_solicitante = $id_jugador and amigos.id_solicitado = $id_user")
            ->orWhere("amigos.id_solicitante = $id_user and amigos.id_solicitado = $id_jugador")
            ->where('amigos.confirmado', 1)
            ->delete();
    }

}

?>