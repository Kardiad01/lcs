<?php

namespace App\Models;

class Conceptos extends AModel{

    protected $db;

    public function __construct()
    {
        $this->db = \Config\Database::connect();
        $this->init(get_class($this));
    }

    public function conceptsbyuser($id_user){
        return $this->selectCount('conceptos.id')
        ->join('conceptos_jugador', 'conceptos_jugador.id_concepto=conceptos.id')
        ->where('id_jugador', $id_user)->get()->getResultArray()[0]['id'];
    }

    public function addconceptbyidbook($session, $post){
        $id_concept = $this->randrandcard($post);
        $userconceptsown = model('Jugador')->userconcepts($session);
        if(!in_array($id_concept, $userconceptsown)){
            //Insert
            $this->db->table('conceptos_jugador')->insert([
                'id_concepto' => $id_concept,
                'id_jugador' => $session['id']
            ]);
            return $this->select('nombre, tipo, descripcion, texto_aparicion')
                ->where('id', $id_concept)
                ->get()
                ->getResultArray();
        }
        return false;
    }

    public function paginatedconcepts($requiredParamsToDT, $id_user){
        $results = [];
        $listconcepts =  $this->select('conceptos.id, conceptos.nombre, conceptos.costo, conceptos.descripcion , conceptos.texto_aparicion, conceptos.tipo')
        ->join('conceptos_jugador', 'conceptos_jugador.id_concepto=conceptos.id')
        ->where('id_jugador', $id_user)
        ->like('nombre', $requiredParamsToDT['busqueda'])
        ->orderBy($requiredParamsToDT['ordenacion'], $requiredParamsToDT['dir_ord'])
        ->limit($requiredParamsToDT['inicio'], $requiredParamsToDT['longitud'])
        ->get()->getResultArray();
        foreach($listconcepts as $value){
            $value['acciones'] = '<button class="btn btn-success" data-add data-id="' . $value['id'] . '"><i class="fa-solid fa-plus"></i></button>
            <button class="btn btn-info" data-read data-id="' . $value['id'] . '"><i class="fa-solid fa-book"></i></button>';
            $results[] = $value;
        }
        return $results;
    }

    public function getcardsbydeck($id_deck, $id_user){
        return $this->select('conceptos.nombre, conceptos.id')
            ->join('argumentario_conceptos', 'conceptos.id=argumentario_conceptos.id_concepto')
            ->join('argumentario', 'argumentario_conceptos.id_argumentario=argumentario.id')
            ->where('argumentario_conceptos.id_argumentario', $id_deck)
            ->where('argumentario.id_jugador', $id_user)
            ->get()->getResultArray();
            
    }

    private function randrandcard($book_id){
        $pool = [];
        $pool = $this->select('concepto_libros.id_concepto')
            ->join('concepto_libros', 'conceptos.id=concepto_libros.id_concepto')
            ->where('concepto_libros.id_libro', $book_id)
            ->get()->getResultArray();
        $selectedRandCard=rand(0, count($pool)-1);
        return $pool[$selectedRandCard]['id_concepto'];
    }

}

?>