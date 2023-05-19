<?php 

namespace App\Controllers;

use App\Helpers\Mail;
use App\Helpers\Languaje;

class Login implements IViews{

    private $request;
    private $post;
    private $get;
    private $session;
    private $languaje;

    public function __construct()
    {
        $this->request = \Config\Services::request();
        $this->post = $this->request->getPost();
        $this->get = $this->request->getGet();
        $this->session = \Config\Services::session();
        $this->languaje = (new Languaje($this->get['lang']))->init();
    }

    public function loadview(){
        $this->customview(['path' => 'login', 'languaje'=>$this->languaje]);
    }

    public function singin(){
        $this->customview(['path' => 'singin', 'languaje'=>$this->languaje]);
    }

    public function mailtorecovery(){
        $this->customview(['path' => 'mailtorecovery', 'languaje'=>$this->languaje]);
    }

    public function restartpassword(){
        $this->customview(['path' => 'restartpassword', 'languaje'=>$this->languaje]);
    }

    public function login(){
       $user = model('Jugador')
                    ->where('nombre', $this->post['user'])
                    ->get()
                    ->getResultArray();
       if(empty($user)){
            echo json_encode(['status'=>404, 'msg'=>'usuario no encontrado']);
            return;
       }
       if(!password_verify($this->post['pass'], $user[0]['contrasena'])){
            echo json_encode(['status' => 401, 'msg'=>'credenciales erróneas','post'=>$this->post, 'user'=>$user]);
            return;
       }
       $this->session->set('user', $user);
       model('Jugador')->set('enlinea', 1)->where('id', $user[0]['id'])->update();
       echo json_encode(['status'=>200, 'msg'=>'credenciales correctas', 'url'=>base_url('master/user/user/loadview')]);
    }

    public function googleoauthlogin(){
        $data = json_decode($this->post['data']);
        if(!$data->email_verified){
            return json_encode(['status'=>401, 'msg'=>'correo no verificado']);
        }
        $user = model('Jugador')
            ->where('direccion',$data->email)
            ->get()
            ->getResultArray();
        if(empty($user)){
            echo json_encode(['status'=>401, 'msg'=>'usuario no registrado, registrate','data'=>$data]);
            return;
        }else{
            $this->session->set('user', $user);
            model('Jugador')->set('enlinea', 1)->where('id', $user[0]['id'])->update();
            echo json_encode(['status'=>200, 'msg'=>'credenciales correctas', 'url'=>base_url('/master/user/user/loadview')]);
            return; 
        }
    }

    public function googleoauthsignin(){
        $data = json_decode($this->post['data']);
        if(!$data->email_verified){
            return json_encode(['status'=>401, 'msg'=>'correo no verificado']);
        }
        $user = model('Jugador')
            ->where('direccion',$data->email)
            ->get()
            ->getResultArray();
        if(!empty($user)){
            echo json_encode(['status'=>401, 'msg'=>'usuario registrado, logeate']);
            return;
        }else{
            model('Jugador')->insert([
                'direccion' => $data->email,
                'id_google' => $data->sub,
                'nombre' => explode('@',$data->email)[0],
                'contrasena' => password_hash($data->sub, PASSWORD_DEFAULT)
            ]);
            (new Mail([$data->email, 
            'Tu contraseña actual', 
            ROOTPATH.'/public/assets/templates/password_info_es.html', 
            [
                'USER' => str_replace('$', '', explode('@',$data->email)[0]),
                'PASS' => str_replace('$', '', $data->sub),
            ]
            ]))->allInOne();
            $this->session->set('user', $user);
            echo json_encode(['status'=>200, 'msg'=>'usuario registrado', 'url'=>base_url('/master/user/user/loadview')]);
            return; 
        }
        return;
    }

    public function recovery(){
        $code = time();
        $userByMail = model('Jugador')->where('direccion', $this->post['mail'])->get()->getResultArray(); 
        model('Jugador')->where('direccion', $this->post['mail'])->set('codigo_recuperacion', $code)->update();
        if($this->post['mail']!='' && isset($this->post['mail']) && !empty($userByMail)){
            $result = (new Mail([$this->post['mail'], 
            'Recuperar contraseñas', 
            ROOTPATH.'/public/assets/templates/recovery_password_es.html', [
                'CODE' => $code,
                'URL' => base_url('master/landing/login/restartpassword?code='.time())
            ]]))->allInOne();
            if($result){
                echo json_encode(['status'=>200, 'msg'=>'Revisa tu correo']);
            }else{
                echo json_encode(['status'=>500, 'msg'=>'Algo no va bien']);
            }
        }else{
            echo json_encode(['status'=>300, 'msg'=>'Correo no válido']);
        }
    }

   public function newpassword(){
        $player = model('Jugador')->select()->where('codigo_recuperacion', $this->get['code'])->get()->getResultArray();
        if(empty($player)){
            echo json_encode(['status'=>404, 'msg'=>'Codigo no encontrado, repite la operacion']);
            return;
        }
        if($this->post['pass']=='' || $this->post['pass1']==''){
            echo json_encode(['status'=>202, 'msg'=>'Alguno de los campos está vacio']);
            return;
        }
        if($this->post['pass']!=$this->post['pass1']){
            echo json_encode(['status'=>201, 'msg'=>'Contraseñas no coinciden']);
            return;
        }
        $password = password_hash($this->post['pass'], PASSWORD_DEFAULT);
        model('Jugador')
            ->where('id', $player[0]['id'])
            ->set('contrasena', $password)
            ->set('codigo_recuperacion', null)
            ->update();
        echo json_encode(['status'=>200, 'msg'=>'Contraseña actualizada', 'post'=>$this->post, 'user'=>$player, 'pass'=>$password]);
   }

    public function adduser(){
        $model = model('Jugador');
        $test = $model->where('nombre', $this->post['user'])->get()->getResultArray();
        if($this->post['pass1']==$this->post['pass'] && count($test)==0){
            $data = [
                'nombre' => $this->post['user'],
                'contrasena' =>password_hash($this->post['pass'], PASSWORD_DEFAULT),
                'direccion' => $this->post['mail']
            ];
            $model->insert($data);
            echo json_encode(['status'=>200, 'msg'=> 'Usuario registrado en bbdd']);
        }else if($this->post['pass1']!=$this->post['pass']){
            echo json_encode(['status'=>203, 'msg' => 'Las contraseñas no coinciden']);
        }else if(count($test)>1){
            echo json_encode(['status'=>202, 'msg' => 'Ya hay un usuario con ese nombre']);
        }
    }
    
    public function customview($params)
    {
        echo view('templates/header', $params)
            .view('mainviews/login', $params)
            .view('templates/footer', $params);
    }
}

?>