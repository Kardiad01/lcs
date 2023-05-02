<?php 

namespace App\Helpers;
use Ratchet\Server\IoServer;
use App\Helpers\WebSocket;

class Chat {

    private $server;

    public function __construct()
    {
        
        $this->server = IoServer::factory(
            new WebSocket()
        );
    }

}

?>