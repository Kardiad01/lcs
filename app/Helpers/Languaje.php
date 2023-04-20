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
            'os2' => $translatedData[17]
            ],
        'ourcards' =>[
            'head' => $translatedData[18]
            ],
        'forms' => [
            'username' => $translatedData[19],
            'password' => $translatedData[20],
            'email' => $translatedData[22],
            'repeatpassword' => $translatedData[24],
            'forgotpassword' => $translatedData[25],
            'recoveraccount' => $translatedData[26],
            'entermail' => $translatedData[27],
            'login' => $translatedData[28],
            'registratonemail' => $translatedData[29],
            ],
        'usermenu' =>[
            'play' => $translatedData[29],
            'viewprofile' => $translatedData[30],
            'buybooks' => $translatedData[31],
            'buildarguments' => $translatedData[32],
            'friendlist' => $translatedData[33],
            'exit' => $translatedData[34]
            ],
        'profile' => [
            'playername' => $translatedData[35],
            'password' => $translatedData[36],
            'image' => $translatedData[37],
            'email' => $translatedData[38],
            'played' => $translatedData[39],
            'win' => $translatedData[40],
            'lose' => $translatedData[41],
        ]
        ];
        return json_encode($landingData);
    }

}

?>