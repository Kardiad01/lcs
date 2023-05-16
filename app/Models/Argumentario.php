<?php

namespace App\Models;
use App\Models\AModel;

class Argumentario extends AModel{

    protected $db;

    public function __construct()
    {
        define('DECKLIMIT', 20);
        $this->init(get_class($this));
        $this->db = $this->db = \Config\Database::connect();
    }

    public function limitofdeck($id_user){
        $usertotaldecks = $this->selectCount('argumentario.id')
            ->where('id_jugador', $id_user)
            ->get()->getResultArray()[0];
        if($usertotaldecks == DECKLIMIT){
            return false;
        }
        return true;
    }

    public function addnewdeck($id_user, $deck_name){
        $data = [
            'id_jugador' => $id_user['id'],
            'nombre' => $deck_name
        ];
        $id_deck = $this->insert($data, true);
        //$id_deck = $this->getInsertID();
        return $this->select()
            ->where('id_jugador', $id_user['id'])
            ->get()
            ->getResultArray();
    }

    public function getalldecksofaplayer($id_user){
        return $this->select('id, nombre')
            ->where('id_jugador', $id_user)
            ->get()->getResultArray();
    }

    public function getdeckbyid($id){
        return $this->select()
            ->where('id', $id)
            ->get()->getResultArray();
    }

    public function insertdeck($id_deck, $cards){
        foreach($cards as $card){
            $this->db->table('argumentario_conceptos')->insert([
                'id_argumentario' => $id_deck,
                'id_concepto' => $card
            ]);
        }
        $this->where('id', $id_deck)->set('jugable', 1)->update();
    }

    public function deletedeck($id_deck){
        $this->db->table('argumentario_conceptos')
            ->where('id_argumentario', $id_deck)
            ->delete();
    }
    
    public function deckwithcards($id_deck){        
        return $this->db->table('argumentario_conceptos')
            ->select()
            ->where('id_argumentario', $id_deck)
            ->get()->getResultArray();
    }

    public function availabledecksbyplayer($id_user){
        return $this->select('id, nombre')
            ->where('id_jugador', $id_user)
            ->where('jugable', 1)
            ->get()->getResultArray();
    }
}

?>