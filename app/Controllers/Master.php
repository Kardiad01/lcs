<?php

namespace App\Controllers;

class Master extends BaseController
{
    public function landing()
    {   
        if(class_exists($this->class)){
            $class = new $this->class();
            $method = $this->method;
            if(method_exists($class, $this->method)){
                $class->$method();
            }
        }else{
            return view('templates/header', ['path'=>'landing', 'languaje'=>$this->languaje])
                    .view('mainviews/landing', ['path'=>'landing', 'languaje'=>$this->languaje])
                    .view('templates/footer', ['path'=>'landing', 'languaje'=>$this->languaje]);
        }
    }
    public function user(){
        if(class_exists($this->class)){
            $class = new $this->class();
            $method = $this->method;
            if(method_exists($class, $this->method)){
                $class->$method();
            }
        }else{
            return view('templates/header', ['path'=>'landing', 'languaje'=>$this->languaje])
                    .view('mainviews/landing', ['path'=>'landing', 'languaje'=>$this->languaje])
                    .view('templates/footer', ['path'=>'landing', 'languaje'=>$this->languaje]);
        }
    }

    public function game(){
        if(model('Debate')->roomexists($this->get['play'])){
            return view('templates/header', ['path'=>'videogame', 'user'=>$this->session->get('user'), 'languaje'=>$this->languaje])
                    .view('mainviews/game', ['path'=>'videogame', 'user'=>$this->session->get('user'), 'languaje'=>$this->languaje])
                    .view('templates/footer', ['path'=>'videogame', 'user'=>$this->session->get('user'), 'languaje'=>$this->languaje]);
        }else{
            echo 'La partida no existe o ha expirado';
        }
    }

    /*public function dev(){
        //shhh this is a sicret XD
        if($_SERVER['HTTP_HOST']=='localhost'){
            echo '<pre>';
            print_r($this->languaje);
            echo '</pre>';
        }else{
            echo 'no puedes pasar espacio prohibido';
        }
    }*/
}
