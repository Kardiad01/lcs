<?php

namespace App\Models;
use CodeIgniter\Model;

abstract class AModel extends Model{
    protected $table;
    protected $primaryKey = 'id' ;

    protected $useAutoIncrement = true;

    protected $returnType     = 'array';
    protected $useSoftDeletes = false;

    protected $allowedFields = [];
    
    public function init($table){
        $this->table = explode('\\', $table)[2];
        $colums = $this->query('SHOW COLUMNS FROM '.$this->table)->getResultArray();
        foreach($colums as $field){
            if($field['Field']!=$this->primaryKey){
                array_push($this->allowedFields, $field['Field']);
            }
        }
    }

}

?>