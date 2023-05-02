<?php

namespace App\Helpers;

class Languaje{

    private $languajeAvailable = [];
    private $langTo = '';
    private $baseLang = 'es';

    public function __construct($lang = null)
    {
        ($lang==null)? $this->langTo = $this->baseLang : $this->langTo = $lang;
        $this->languajeAvailable = array_map(function($element){
            preg_match('/\w+\./', $element, $match);
            return str_replace('.', '', $match);
        }, glob(FCPATH."\assets\languajedata\\*.txt"));
    }

    public function init(){
        if($this->isLangAvailable()){
            return $this->getLanguaje();
        }else{
            $this->generateLanguaje();
            return $this->getLanguaje();
        }
    }

    private function isLangAvailable(){
        $lang = $this->langTo;
        $langs = array_filter($this->languajeAvailable, function($element) use($lang){
            if($element[0] == $lang){
                return $element;
            }
         });
        if(!empty($langs)){
            return true;
        }
        return false;
    }

    public function generateLanguaje(){
        $translator = new \DeepL\Translator(env('traductorKey'));
        $result = $translator->translateText(file_get_contents(FCPATH.'\assets\languajedata\es.txt'), $this->baseLang, 'en-GB');
        file_put_contents(FCPATH."\assets\languajedata\\".$this->langTo.".txt", $result);
    }

    public function getLanguaje(){
        $recoverText = file_get_contents(FCPATH."\assets\languajedata\\".$this->langTo.".txt");
        $translatedData = preg_split('/(\||\:\s)/', $recoverText);
        $landingData = [
        'meta' => [
            'meta' => $translatedData[0]
            ],
        'nav'=>[
            'alta' => $translatedData[2],
            'login' => $translatedData[1]
            ],
        'header' => [
            'header' => $translatedData[3]
            ],
        'carousel' =>[
            'c1' => $translatedData[4],
            'c2' => $translatedData[5],
            'c3' => $translatedData[6]
            ],
        'news' =>[
            'head' => $translatedData[7],
            'n1' => $translatedData[8],
            'n2' => $translatedData[9],
            'n3' => $translatedData[10],
            ],
        'ourgame' =>[
            'head' => $translatedData[13],
            'o1' => $translatedData[14],
            'os1' => $translatedData[15],
            'o2' => $translatedData[16],
            'os2' => $translatedData[17],
            'o3' => $translatedData[18],
            'os3' => $translatedData[19],
            ],
        'ourcards' =>[
            'head' => $translatedData[20]
            ],
        'forms' => [
            'username' => $translatedData[21],
            'password' => $translatedData[22],
            'email' => $translatedData[24],
            'repeatpassword' => $translatedData[26],
            'forgotpassword' => $translatedData[27],
            'recoveraccount' => $translatedData[28],
            'entermail' => $translatedData[29],
            'login' => $translatedData[30],
            'registratonemail' => $translatedData[31],
            ],
        'usermenu' =>[
            'play' => $translatedData[31],
            'viewprofile' => $translatedData[32],
            'buybooks' => $translatedData[33],
            'buildarguments' => $translatedData[34],
            'friendlist' => $translatedData[35],
            'readbook' => $translatedData[36] ,
            'getmorecash' => $translatedData[48],
            'exit' => $translatedData[37]
            ],
        'profile' => [
            'playername' => $translatedData[38],
            'password' => $translatedData[39],
            'image' => $translatedData[40],
            'email' => $translatedData[41],
            'played' => $translatedData[42],
            'win' => $translatedData[43],
            'lose' => $translatedData[44],
        ],
        'play' => [
            'title' => $translatedData[45],
            'online' => $translatedData[46],
            'friends' => $translatedData[47]
        ],
        'buybooks' => [
            
        ]
        ];
        return json_encode($landingData);
    }

}

?>