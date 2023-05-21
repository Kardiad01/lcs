<?php

namespace App\Helpers;

class Languaje{

    private $languajeAvailable = [];
    private $langTo = '';
    private $baseLang = 'es';
    public $seed;

    public function __construct($lang = null)
    {
        ($lang==null)? $this->langTo = $this->baseLang : $this->langTo = strtolower($lang);
        $this->languajeAvailable = array_map(function($element){
            preg_match('/\w+\./', $element, $match);
            return str_replace('.', '', $match);
        }, glob(FCPATH."\assets\languajedata\\*.html"));
        $this->seed = $this->getSeed();
    }

    public function init(){
        $document = $this->getWrittedHtml();
        if($this->isLangAvailable()){
            return $this->getHtml($this->langTo);
        }else{
            $this->generateLanguaje($document);
            return $this->getHtml($this->langTo);
        }

    }

    private function getHtml(){
        $base = explode('|ñ|', file_get_contents(FCPATH."\assets\languajedata\\$this->langTo.html"));
        $correctLangToWeb = [
            'meta' => $base[0],
            'welcome' => $base[1],
            'combotoform'=>$base[2],
            'combotocarousel' => $base[3],
            'main' => $base[4],
        ];
        return $correctLangToWeb;
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

    public function generateLanguaje($html){
        $translator = new \DeepL\Translator(env('traductorKey'));
        $result = $translator->translateText($html, $this->baseLang, ($this->langTo==='en')?$this->langTo.'-GB':$this->langTo, ['tag_handling'=>'html']);
        file_put_contents(FCPATH."\assets\languajedata\\".$this->langTo.".html", $result);
    }

    private function getSeed(){
        $translatedData = explode('|', file_get_contents(FCPATH."\assets\languajedata\\es.txt"));
        $seed = [
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
                'n4' => $translatedData[11],
                'n5' => $translatedData[12]
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
                'head' => $translatedData[20],
                'legend' => [
                    'mana' => [
                        base_url('/assets/img/assets_cartas/costo_mana.png'),
                        $translatedData[49]
                    ],
                    'name' => [
                        base_url('/assets/img/assets_cartas/tape.png'),
                        $translatedData[50]
                    ],
                    'contra' => [
                        base_url('/assets/img/assets_cartas/puntos_perdida.png'),
                        $translatedData[51]
                    ],
                    'beneficio' => [
                        base_url('/assets/img/assets_cartas/puntos_beneficio.png'),
                        $translatedData[52]
                    ],
                    'tipo_carta' => [
                        base_url('/assets/img/assets_cartas/tape_top.png'),
                        $translatedData[53]
                    ],
                    'otros_efectos' => [
                        base_url('/assets/img/assets_cartas/paper_shadow.png'),
                        $translatedData[54]
                    ]
                ]
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
            ]
        ];
        return $seed;
    }

    private function getWrittedHtml(){
        $html = [];
        $seed = $this->getSeed();
        $newsLoop = '';
        foreach($seed['news'] as $key=>$new){
            if($key!='n1'){
                $newsLoop.= "<div class=\"new\">
                <img class=\"new-img\" src=\"".base_url('assets/img/BackHead.webp')."\">
                <div class=\"new-body\">
                   <p>
                     $new
                   </p>
                </div> 
             </div>";
            }
        }
        $legendLoop = "";
        foreach($seed['ourcards']['legend'] as $legend){
            $legendLoop.="<p><img src=\"$legend[0]\" width=\"50px\" height=\"50px\">$legend[1]</p>";
        }
        $template = "<h3>".$seed['news']['n1']."</h3>
        <article class=\"news\">
           {{NEWS}}
        </article>
        <h3 class=\"text-center mt-3\">".$seed['ourgame']['head']."</h3>
        <article class=\"presentation\">
            <section>
                <div class=\"section-image\">
                    <img src=\"".base_url('assets/img/otherbackground.png')."\">
                </div>
                <div class=\"section-body\">
                    <h3>".$seed['ourgame']['o1']."</h3>
                    <p>".$seed['ourgame']['os1']."</p>
                </div>
            </section>
            <section>
                <div class=\"section-body\">
                    <h3>".$seed['ourgame']['o2']."</h3>
                    <p>".$seed['ourgame']['os2']."</p>
                </div>
                <div class=\"section-image\">
                    <img src=\"".base_url('assets/img/otherbackground.png')."\">
                </div>
            </section>
            <section>
                <div class=\"section-image\">
                    <img src=\"".base_url('assets/img/otherbackground.png')."\">
                </div>
                <div class=\"section-body\">
                    <h3>".$seed['ourgame']['o3']."</h3>
                    <p>".$seed['ourgame']['os3']."</p>
                </div>
            </section>
        </article>
        <h3> ".$seed['ourcards']['head']."</h3>
        <article class=\"cards-of-game\">
            <section>
                <div class=\"d-flex flex-column flex-md-row jsutify-content-center aling-items-center\">
                    <div class=\"col-md-6 col-12 m-auto text-center\">
                        <img src=\"RANDCARD\" class=\"card-image\">
                    </div>
                    <div class=\"col-md-6 col-12 m-auto mt-5\">
                       {{LEGENDLOOP}}
                    </div>
                </div>
            </section>
        </article>";
        $template = str_replace('{{NEWS}}', $newsLoop, $template);
        $template = str_replace('{{LEGENDLOOP}}', $legendLoop, $template); 
        $html = [
            'meta' => $this->langTo,
            'welcome' => $seed['header']['header'],
            'combotoform' => "
                <li>
                    <a href=\"".base_url('master/landing/login/loadview')."?lang=".$seed['meta']['meta']."\">".$seed['nav']['alta']."</a>
                </li>
                <li>
                    <a href=\"".base_url('master/landing/login/singin')."?lang=".$seed['meta']['meta']."\">".$seed['nav']['login']."</a>
                </li> 
            ",
            'combotocarousel' => "
            <div class=\"welcome\">
                    <p>
                        ".$seed['header']['header']."
                    </p>
                </div>
                <div class=\"carrousel\">
                    <div class=\"splide\" data-library-func=\"carrousel-0\">
                        <div class=\"splide__track\">
                            <ul class=\"splide__list\">
                                <li class=\"splide__slide component\" data-splide-hash=\"slide01\">
                                    <img width=\"100%\" height=\"100%\" src=\"".base_url('/assets/img/carrousel1.jpg')."\">
                                    <div>
                                        <p style=\"color:white\">
                                            ".$seed['carousel']['c1']."
                                        </p>
                                    </div>
                                </li>
                                <li class=\"splide__slide component\" data-splide-hash=\"slide02\">
                                    <img width=\"100%\" height=\"100%\" src=\"".base_url('/assets/img/carrousel2.jpg')."\">
                                    <div>
                                        <p style=\"color:white\">
                                            ".$seed['carousel']['c2']."
                                        </p>
                                    </div>
                                </li>
                                <li class=\"splide__slide component\" data-splide-hash=\"slide03\">
                                    <img width=\"100%\" height=\"100%\" src=\"".base_url('/assets/img/carrousel3.jpg')."\">
                                    <div>
                                        <p style=\"color:white\">
                                            ".$seed['carousel']['c3']."
                                        </p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class=\"splide__progress\">
                                <div class=\"splide__progress__bar\">
                            </div>
                        </div>
                    </div>
                </div>
            ",
            'main' => $template
        ];
        $htmlStringified = implode('|ñ|', $html);
        return $htmlStringified;
    }

}

?>