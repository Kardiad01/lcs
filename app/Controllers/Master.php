<?php

namespace App\Controllers;

class Master extends BaseController
{
    public function index()
    {
        /*echo '<pre>';
        print_r($this->request);
        echo '</pre>';
        var_dump($this->request->getUri()->getSegments());*/
        return view('templates/header').view('mainviews/landing').view('templates/footer');
    }
    public function user(){

    }
    public function game(){
        
    }
}
