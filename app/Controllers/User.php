<?php

namespace App\Controllers;
use App\Controllers\IViews;
use App\Helpers\Languaje;

class User implements IViews {

    private $request;
    private $post;
    private $get;
    private $session;
    private $languaje;
    private $files;

    public function __construct()
    {
        $this->request = \Config\Services::request();
        $this->post = $this->request->getPost();
        $this->get = $this->request->getGet();
        $this->files = $this->request->getFiles();
        $this->session = \Config\Services::session();
        $this->languaje = json_decode((new Languaje())->init(), true);
    }

    public function loadview(){
        if(!empty($this->session->get('user'))){
            $this->customview(['path'=>'user', 'user'=>$this->session->get('user'), 'languaje' => $this->languaje]);
        }else{
            $this->customview(['path'=>'landing', 'languaje' => $this->languaje]);
        }
    }

    public function logout(){
        $this->session->set('user', []);
        $this->customview(['path'=>'landing', 'languaje' => $this->languaje]);
    }

    /**
     * Funciones dentro de esto:
     *  1º Ver datos
     *  2º Editar datos
     *  3º Borrar Usuario
     *  4º Comprar libros
     *  5º Obtener Cartas
     *  6º Ver cartas obtenidas
     *  7º Obtener libros
     *  8º Listar amigos
     *  9º Añadir amigos
     *  10º Matchmaking o formas de emparejamiento
     *  11º Listar mazos
     *  12º Hacer mazo:
     *      12.1: Crear mazo virgen sin cartas
     *      12.2: Añadir cartas
     *      12.3: Editar cartas mazo
     */

    public function userprofile(){
        $updateableData = array_filter($this->post, function($element){
            if($element!=''){
               return $element; 
            }
        });
        if(!empty($this->files)){
            $updateableData['img_perfil'] = '';
            $randName = $this->files['img_perfil']->getRandomName();
            $this->files['img_perfil']->move(FCPATH .'/user'.'/', $randName);
            $updateableData['img_perfil'] = base_url('/user'.'/'.$randName);
        }        
        $id = $this->session->get('user')[0]['id'];
        model('Jugador')->secureUpdate($updateableData, $id);
        $this->session->set('user', []);
        $this->session->set('user', model('Jugador')
            ->where('id', $id)
            ->get()
            ->getResultArray());
        echo json_encode(['status'=>200, 'msg'=>'Datos actualizados', 'updatedata'=>$updateableData]);
        return;
    } 

    public function edituser(){

    }

    public function deleteuser(){

    }

    public function buybook(){

    }

    public function getcards(){

    }

    public function cardlist(){

    }

    public function addbook(){

    }

    public function friendlist(){

    }

    public function play(){

    }

    public function sendmsg(){

    }

    public function recivemsg(){

    }

    public function createdeck(){

    }

    public function customview($params)
    {
        if($params['path']=='landing'){
            echo view('templates/header', $params)
                .view('mainviews/landing')
                .view('templates/footer');
        }else{
            echo view('templates/header', $params)
                .view('mainviews/menu', $params)
                .view('templates/footer', $params);
        }
    }

}

?>