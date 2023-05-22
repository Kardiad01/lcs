<?php

namespace App\Models;
use App\Models\AModel;
use Exception;

class Libro extends AModel{

    protected $db;

    public function __construct()
    {
        $this->db = \Config\Database::connect();
        $this->init(get_class($this));
    }

    public function getpaginatedbooks($requiredParamsToDT, $session){
        $results = [];
        $listOfPlayerBooks = $this->db->table('jugador_libros')
            ->select('id_libro')
            ->where('id_jugador', $session['id']);
        $paginatedBooks = $this->select('id, titulo, precio')
            ->whereNotIn('id', $listOfPlayerBooks)
            ->like('titulo', $requiredParamsToDT['busqueda'])
            ->orderBy($requiredParamsToDT['ordenacion'], $requiredParamsToDT['dir_ord'])
            ->limit($requiredParamsToDT['inicio'], $requiredParamsToDT['longitud'])
            ->get()->getResultArray();
        foreach($paginatedBooks as $value){
            $value['acciones'] = '<button class="btn btn-success" data-buy data-user-id="'.$session['id'].'"  data-id="' . $value['id'] . '"><i class="fa-solid fa-money-bill"></i></button>';
            $results[] = $value;
        }
        return $results;
    }

    public function addbooktoplayer($params){
        try{
            $this->db->table('jugador_libros')->insert([
                'id_libro' => $params['id_book'],
                'id_jugador' => $params['id_user'],
            ]);
            return true;
        }catch(Exception $e){
            return false;
        }
    }

    public function playerbookslist($requiredParamsToDT, $session){
        $results = [];
        $listOfPlayerBooks =  $this->db->table('jugador_libros')
        ->select('libro.id, libro.titulo, disciplina.nombre as disciplina , autor.nombre as autor , autor.apellidos as apellidos')
        ->join('libro', 'libro.id=jugador_libros.id_libro')
        ->join('disciplina', 'disciplina.id=libro.id_disciplina')
        ->join('autor', 'autor.id=libro.id_autor')
        ->where('id_jugador', $session['id'])
        ->like('titulo', $requiredParamsToDT['busqueda'])
        ->orderBy($requiredParamsToDT['ordenacion'], $requiredParamsToDT['dir_ord'])
        ->limit($requiredParamsToDT['inicio'], $requiredParamsToDT['longitud'])
        ->get()->getResultArray();
        foreach($listOfPlayerBooks as $value){
            $value['acciones'] = '<button class="btn btn-success" data-read data-user-id="'.$session['id'].'"  data-id="' . $value['id'] . '">Leer</button>';
            $results[] = $value;
        }
        return $results;
    }

    public function conceptsinthisbook($id_book){
        return $this->selectCount('concepto_libros.id_concepto')
            ->join('concepto_libros', 'libro.id=concepto_libros.id_libro')
            ->where('libro.id', $id_book)
            ->get()->getResultArray();
    }

}

?>