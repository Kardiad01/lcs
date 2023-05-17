<?php

namespace App\Models;

class Debate extends AModel{

    public function __construct()
    {
        $this->init(get_class($this));
    }

    public function roomexists($roomCode){
        $exists = false;
        (count($this->select()
        ->where('recurso', $roomCode)
        ->where('jugable', 1)
        ->get()
        ->getResultArray())>0)? $exists = true: $exists = false;
        return $exists;
    }

}

?>