<?php

namespace App\Helpers;

use Exception;

class Mail {

    private $user;
    private $pass;
    private $host;
    private $port;
    private $protocol;
    private $mailer;
    private $cypto;
    private $to;
    private $issue;
    private $message;
    private $typeMsg;
    private $messageTempate;
    private $data;
    private $config = [];

    public function __construct(array $params)
    {
        $this->user = env('mailUser');
        $this->pass = env('pass');
        $this->host = env('host');
        $this->port = env('port');
        $this->cypto = env('crypto');
        $this->protocol = env('protocol');

        $this->mailer = \Config\Services::email();
        try{
            list($this->to, $this->issue, $this->message, $this->data) = $params;
        }catch(Exception $e){   
            throw $e;
        }
        if($this->message!=''){
            $this->message = parse_url($this->message);
        }
        if(!isset($this->message['scheme'])){
            $this->typeMsg = 'text';
            $this->message = $this->message['path'];
        }
        if(isset($this->message['scheme']) && $this->message['scheme']=='C'){
            $this->typeMsg = 'html';
            $this->messageTempate = $this->message['scheme'].':\\\\'.$this->message['path'];
        }
    }

    private function writeMessage(){
        if(is_array($this->message)){
            $this->message = '';
        }
        if($this->messageTempate!=''){
            $this->message = file_get_contents($this->messageTempate);
        }
        foreach($this->data as $key=>$value){
            $this->message = str_replace('{{'.strtoupper($key).'}}', $value, $this->message);
        }
    }

    private function sendMessage(){
        $this->config = [
                'SMTPHost' => $this->host,
                'SMTPUser' => $this->user,
                'SMTPPass' => $this->pass,
                'SMTPPort' => $this->port,
                'SMTPCrypto' => $this->cypto,
                'protocol' => $this->protocol,
                'mailType' => $this->typeMsg,
                'fromEmail' => $this->user,
                'fromName' => 'Recuperación de contraseña'
        ];
        $this->mailer->initialize($this->config);
        $this->mailer->setFrom($this->user, 'Las Cartas De Sofía');
        $this->mailer->setTo($this->to);
        $this->mailer->setSubject($this->issue);
        $this->mailer->setMessage($this->message);
        return $this->mailer->send();
    }

    public function allInOne(){
        $this->writeMessage();
        return $this->sendMessage();
    }

}


?>