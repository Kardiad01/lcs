<?php

namespace App\Controllers;
use App\Controllers\IViews;
use App\Helpers\Languaje;
use Exception;

class User implements IViews {

    private $request;
    private $post;
    private $get;
    private $session;
    private $languaje;
    private $files;
    private $salt = '78mMbozkN?r.'; //acuerdate que tienes que hacer un .env para poner la salt esta

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
        model('Jugador')->set('enlinea', 0)->where('id', $this->session->get('user')[0]['id'])->update();
        $this->session->set('user', []);
        $this->customview(['path'=>'landing', 'languaje' => $this->languaje]);
    }

    public function playfriendsop(){
        $roomName = md5(password_hash($this->salt.'_'.$this->post['id_opponent'].$this->session->get('user')[0]['id'], PASSWORD_BCRYPT));
        $dataRoom = model('Jugador')->newgamewithfriend([
            'id_jugador_retante' => $this->post['id_opponent'],
            'id_jugador_retado' => $this->session->get('user')[0]['id'],
            'recurso' => $roomName
        ]);
        echo json_encode(['status'=>200, 'data'=>$dataRoom]);
    }

    public function endgame(){
        model('Debate')->where('recurso', $this->post['room'])->set('jugable', 0)->update();
    }

    //User methods

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
        if($this->session->get('user')[0]['img_perfil']!=''){
            unlink(str_replace(base_url(), FCPATH,$this->session->get('user')[0]['img_perfil']));
        }
        model('Jugador')->secureUpdate($updateableData, $id);
        $this->session->set('user', []);
        $this->session->set('user', model('Jugador')
            ->where('id', $id)
            ->get()
            ->getResultArray());
        echo json_encode(['status'=>200, 'msg'=>'Datos actualizados', 'updatedata'=>$updateableData]);
        return;
    } 

    public function deleteuser(){
        $userdataDelete = model('Jugador')->getDeleteData($this->post['id']);
        if(password_verify($this->post['password'], $userdataDelete[0]['contrasena'])){
            unlink(str_replace(base_url(), FCPATH, $userdataDelete[0]['img_perfil']));
            model('Jugador')->where('id', $this->post['id'])->delete();
            echo json_encode(['status'=>200]);
        }else{
            echo json_encode(['status'=>404]);
        }
    }
  

    //Cards buying methods

    
    public function listbook(){
        $columns = ['id', 'titulo', 'precio'];
        $requiredParamsToDT = [
            'columnas' => $columns,
            'ordenacion' =>$columns[$this->post['order'][0]['column']],
            'total_registros' => model('Libro')->countAll(),
            'dir_ord' => $this->post['order'][0]['dir'],
            'inicio' => $this->post['start'],
            'longitud' => $this->post['length'],
            'busqueda' => $this->post['search']['value'] ?? ''
        ];
        echo json_encode([
            'draw' => intval($this->post['draw']),
            'recordsTotal' => $requiredParamsToDT['total_registros'],
            'recordsFiltered' => $requiredParamsToDT['total_registros'],
            'data'=>model('Libro')->getpaginatedbooks($requiredParamsToDT, $this->session->get('user')[0])
        ]);
    }

    public function buybook(){
        //Crear trigger para automatizar la resta de la compra del libro cuando se compra
        $precio = model('Libro')->select('precio')->where('id', $this->post['id_book'])->get()->getResultArray()[0]['precio'];
        $dinero = $this->session->get('user')[0]['dinero'];
        if($dinero>=$precio){
            model('Libro')->addbooktoplayer($this->post);
            $this->session->set('user', model('Jugador')
                ->where('id', $this->post['id_user'])
                ->get()
                ->getResultArray());
            echo json_encode(['status'=>200, 'data'=>$this->session->get('user')[0]['dinero']]);
        }else{
            echo json_encode(['status'=>202]);
        }
    }

    public function booklist(){
        $columns = ['id', 'titulo', 'disciplina', 'nombre', 'apellidos', 'acciones'];
        $requiredParamsToDT = [
            'columnas' => $columns,
            'ordenacion' =>$columns[$this->post['order'][0]['column']],
            'total_registros' => model('Libro')->countAll(),
            'dir_ord' => $this->post['order'][0]['dir'],
            'inicio' => $this->post['start'],
            'longitud' => $this->post['length'],
            'busqueda' => $this->post['search']['value'] ?? ''
        ];
        echo json_encode([
            'draw' => intval($this->post['draw']),
            'recordsTotal' => $requiredParamsToDT['total_registros'],
            'recordsFiltered' => $requiredParamsToDT['total_registros'],
            'data'=>model('Libro')->playerbookslist($requiredParamsToDT, $this->session->get('user')[0])
        ]);    
    } 

    public function readbook(){
        $findConcepts = model('Conceptos')->addconceptbyidbook($this->session->get('user')[0], $this->post['id_book']);
        $learntbook = model('Jugador')->conceptsbyuser($this->session->get('user')[0]['id'], $this->post['id_book']);
        $conceptsbybook = model('Libro')->conceptsinthisbook($this->post['id_book']);
        if(model('Jugador')->listofmasteredbook($this->session->get('user')[0]['id'], $this->post['id_book'])){
            echo json_encode(['status'=>202, 'msg'=>'Ya has aprendido todo lo que puede darte ese libro']);
            return; 
        }
        if($learntbook==$conceptsbybook){
            model('Jugador')->masteredbook($this->session->get('user')[0]['id'], $this->post['id_book']);
            echo json_encode(['status'=>202, 'msg'=>'Ya has aprendido todo lo que puede darte ese libro']);
            return;
        }
        if(gettype($findConcepts) == 'boolean'){
            echo json_encode(['status'=>201, 'msg'=>'ya tienes ese concepto']);
            return;
        }
        echo json_encode(['status'=>200, 'data'=>$findConcepts]);
    }

   //Friendlist methods

   public function firendstosocket(){
       echo json_encode(model('Jugador')->firendstosocket($this->session->get('user')[0]['id']));
   }

   public function lookingforfriends(){
        $columns = ['id', 'nombre', 'enlinea'];
        $requiredParamsToDT = [
            'columnas' => $columns,
            'ordenacion' =>$columns[$this->post['order'][0]['column']],
            'total_registros' => model('Jugador')->countAll(),
            'dir_ord' => $this->post['order'][0]['dir'],
            'inicio' => $this->post['start'],
            'longitud' => $this->post['length'],
            'busqueda' => $this->post['search']['value'] ?? ''
        ];
        echo json_encode([
            'draw' => intval($this->post['draw']),
            'recordsTotal' => $requiredParamsToDT['total_registros'],
            'recordsFiltered' => $requiredParamsToDT['total_registros'],
            'data'=>model('Jugador')->getpaginatedfriends($requiredParamsToDT, $this->session->get('user')[0])
        ]);
    }

    public function addfriend(){
        try{
            $theyarefriends = model('Jugador')->theyarefriends([
                'id_user' => $this->session->get('user')[0]['id'],
                'id_otheruser' => $this->post['id_solicitante']
            ]);
            if(!$theyarefriends){
                model('Jugador')->makefriends([
                    'id_solicitado' => $this->session->get('user')[0]['id'],
                    'id_solicitante' => $this->post['id_solicitante']
                ]);
                echo json_encode(['status'=>200, 'msg'=>'solicitud enviada', 'data'=>$this->post['id_solicitante']]);
            }else{
                echo json_encode(['status'=>201, 'msg'=>'ya son amigos']);
            }
        }catch(Exception $e){
            echo json_encode(['status'=>500, 'msg'=>'algo salió mal']);
        }
    }

    public function friendrequest(){      
            echo json_encode(['status'=>200, 'data'=>model('Jugador')->friendrequest($this->session->get('user')[0]['id'])]);
    }

    public function deletefriend(){
        try{
            model('Jugador')->deletefriend($this->post['id_player'], $this->session->get('user')[0]['id']);
            echo json_encode(['status'=>200, 'msg'=>'amigo borrado con éxito', 'data'=>$this->post['id_player']]);
        }catch(Exception $e){
            echo json_encode(['status'=>500, 'msg'=>'no se pudo eliminar amigo']);
        }
    }


    public function aceptnewfriend(){
        try{
            $theyarefriends = model('Jugador')->theyarefriends([
                'id_user' => $this->session->get('user')[0]['id'],
                'id_otheruser' => $this->post['id_player']
            ]);
            if(!$theyarefriends){
                model('Jugador')->aceptnewfriend($this->post['id_player']);
                echo json_encode(['status'=>200, 'msg'=>'Amigo añadido con éxito']);
            }else{
                echo json_encode(['status'=>201, 'msg'=>'Ya sois amigos']);
            }
        }catch(Exception $e){
            echo json_encode(['status'=>500, 'msg'=>'Un error ha ocurrido']);
        }
    }

    public function rejectnewfriend(){
        try{
            model('Jugador')->rejectnewfriend($this->post['id_player']);
            echo json_encode(['status'=>200, 'msg'=>'Solicitud rechazada con éxito']);
        }catch(Exception $e){
            echo json_encode(['status'=>500, 'msg'=>'Un error ha ocurrido']);
        }
    }

    public function friendlist(){
        echo json_encode([
            'data'=>model('Jugador')->friendlist($this->session->get('user')[0]['id'])
        ]);
    }

    public function historicchat(){
        try{
            $chat = model('Jugador')->chathistoric($this->session->get('user')[0]['id'], $this->post['id_otrousuario']);
            $html = '';
            foreach($chat as $coment){
                if($coment['id_hablante']==$this->session->get('user')[0]['id']){
                    $html .= '
                    <div class="col-8 align-self-end border rounded mt-2 coment">
                        <p class="h-25 mr-3 coment">
                            <b style="font-size:0.8rem">YO:</b><small style="font-size:0.8rem">'.$coment['fecha'].'</small><p>'.$coment['mensaje'].'</p> 
                        </p>
                    </div>
                    ';
                }else{
                    $html .='
                        <div class="col-8 align-self-start border rounded mt-2 coment">
                            <p class="h-25 ml-3 coment">
                                <b style="font-size:0.8rem">'.$coment['nombre'].'</b><small style="font-size:0.8rem">'.$coment['fecha'].'</small><p>'.$coment['mensaje'].'</p>
                            </p>
                        </div>
                    ';
                }
            }
            echo json_encode(['status' => 200, 'data' => $chat, 'html' => $html]);
        }catch(Exception $e){
            echo json_encode(['status'=>500]);
            throw $e;
        }
    }

    public function onlinefriends(){
        echo json_encode(['status'=>200, 'data'=> model('Jugador')->onlinefriends($this->session->get('user')[0]['id'])]);
    }

    //Deck builder methods

    public function createdeck(){
        if(model('Argumentario')->limitofdeck($this->session->get('user')[0]['id'])){
            echo json_encode(['status'=>200, 'data'=>model('Argumentario')->addnewdeck($this->session->get('user')[0], $this->post['deck_name'])]);
            return;
        }else{
            echo json_encode(['status'=>201, 'msg'=>'has creado el límite máximo de mazos']);
            return;
        }
    }

    public function loaddeck(){
        if(!empty($this->session->get('user'))){
            echo json_encode(['data'=>model('Conceptos')->getcardsbydeck($this->post['id_deck'],$this->session->get('user')[0]['id'])]);
        }
    }

    public function deletedeck(){
        model('Argumentario')
            ->where('id', $this->post['id_deck'])
            ->delete();
        echo json_encode(['status'=>200, 'data'=>model('Argumentario')->getalldecksofaplayer($this->session->get('user')[0]['id'])]);
    }

    public function decklist(){
        echo json_encode(['data'=>model('Argumentario')->getalldecksofaplayer($this->session->get('user')[0]['id'])]);
    }

    public function addcardstodeck(){ 
        if(!isset($this->post['cards']) && !is_array($this->post['cards'])){
            echo json_encode(['status'=>201, 'msg'=>'no se permiten mazos con 0 cartas']);
            return;
        }
        if(count($this->post['cards'])!=20){
            echo json_encode(['status'=>201, 'msg'=>'ese mazo no tiene 20 cartas']);
            return;
        }
        if(count( model('Argumentario')->deckwithcards($this->post['id_deck']))>0){
            model('Argumentario')->deletedeck($this->post['id_deck']);
            model('Argumentario')->insertdeck($this->post['id_deck'], array_map(fn($el)=>$el['id'], $this->post['cards']));
            echo json_encode(['status'=>200, 'msg'=>'se han reemplazado las cartas del mazo']);
            return;
        }else{
            model('Argumentario')->insertdeck($this->post['id_deck'], array_map(fn($el)=>$el['id'], $this->post['cards']));
            echo json_encode(['status'=>200, 'msg'=>'se han insertado las nuevas cartas del mazo']);
        }
    }

    public function deckbuilder(){
        if(!empty($this->session->get('user'))){
            echo view('templates/header', ['path'=>'deckbuilder', 'user'=>$this->session->get('user'), 'languaje' => $this->languaje, 'deck'=>model('Argumentario')->getdeckbyid($this->get['id'])])
                .view('mainviews/deckbuilder');
        }else{
            echo 'buen intento chaval';
        }
    }

    public function cardlist(){
        $columns = ['nombre', 'costo', 'descripcion', 'tipo', 'acciones'];
        $requiredParamsToDT = [
            'columnas' => $columns,
            'ordenacion' =>$columns[$this->post['order'][0]['column']],
            'total_registros' => model('Conceptos')->conceptsbyuser($this->session->get('user')[0]['id']),
            'dir_ord' => $this->post['order'][0]['dir'],
            'inicio' => $this->post['start'],
            'longitud' => $this->post['length'],
            'busqueda' => $this->post['search']['value'] ?? ''
        ];
        echo json_encode([
            'draw' => intval($this->post['draw']),
            'recordsTotal' => $requiredParamsToDT['total_registros'],
            'recordsFiltered' => $requiredParamsToDT['total_registros'],
            'inicio'=> $requiredParamsToDT['inicio'],
            'final' => $this->post['length'],
            'data'=>model('Conceptos')->paginatedconcepts($requiredParamsToDT, $this->session->get('user')[0]['id'])
        ]);  
    }

    public function decksreadytoplaybyuser(){
        if(!empty($this->session->get('user'))){
            echo json_encode(['data'=>model('Argumentario')->availabledecksbyplayer($this->session->get('user')[0]['id'])]);
        }
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