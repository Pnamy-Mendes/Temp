<?php

/* security/login.html.twig */
class __TwigTemplate_3636da7f2dec03f144cb1195a649b19dd005dcd0f209891571386503099608f9 extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = array(
        );
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        // line 1
        echo "<!-- This page only links -->
<head>
    <link href=\"img/logoNew2D.png\" rel=\"shortcut icon\">
    <link rel=\"stylesheet\" href=\"";
        // line 4
        echo twig_escape_filter($this->env, $this->env->getExtension('asset')->getAssetUrl("css/login.css"), "html", null, true);
        echo "\">
    <link rel=\"stylesheet\" href=\"";
        // line 5
        echo twig_escape_filter($this->env, $this->env->getExtension('asset')->getAssetUrl("css/bootstrap.css"), "html", null, true);
        echo "\"> 
    <link rel=\"stylesheet\" href=\"";
        // line 6
        echo twig_escape_filter($this->env, $this->env->getExtension('asset')->getAssetUrl("css/responsive.css"), "html", null, true);
        echo "\"> 

</head>
<!-- -->

        <div id=\"wrapper\">
            <div id=\"login\" class=\"animate form\">
                <section class=\"login_content row\">
                    <form class=\"col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3 col-sm-10 col-sm-offset-1\" action=\"";
        // line 14
        echo $this->env->getExtension('routing')->getPath("login");
        echo "\" method=\"post\">
                        
                        <img src=\"img/logoNew2.png\" class=\"logoLogin col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3\">

                        <!--<img src=\"img/t3.png\" height=\"30\"><br><br>-->
                        <!--<h1>Login</h1>-->
                        
                        <input class=\"inputLogin col-lg-12 col-md-12 col-sm-12\" spellcheck=\"false\" type=\"email\" placeholder=\"Email\" required name=\"_username\" value=\"";
        // line 21
        echo twig_escape_filter($this->env, (isset($context["last_username"]) ? $context["last_username"] : null), "html", null, true);
        echo " \" >
                    
                        <input class=\"inputLogin col-lg-12 col-md-12 col-sm-12\" type=\"password\"  required name=\"_password\" placeholder=\"Password\"/>
                    
                        <button class=\"col-lg-12 col-md-12 col-sm-12\" id=\"buttonlogin\" type=\"submit\" >
                            ";
        // line 26
        if ((isset($context["error"]) ? $context["error"] : null)) {
            echo " Dados inválidos. Tentar Novamente.";
        } else {
            echo " ENTRAR ";
        }
        // line 27
        echo "                        </button>
                        

                        <div class=\"clearfix\"></div>
                        <div class=\"separator\">
                            <br>
                            <div class=\"footerLogin\">
                                <p>DashSoccer ©2016</p>
                                <p>Todos os direitos reservados. </p>
                            </div>
                        </div>
                    </form>
                    <!-- form -->
                </section>
                <!-- content -->
            </div>
        </div>
    </div>
";
    }

    public function getTemplateName()
    {
        return "security/login.html.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  67 => 27,  61 => 26,  53 => 21,  43 => 14,  32 => 6,  28 => 5,  24 => 4,  19 => 1,);
    }
}
/* <!-- This page only links -->*/
/* <head>*/
/*     <link href="img/logoNew2D.png" rel="shortcut icon">*/
/*     <link rel="stylesheet" href="{{ asset('css/login.css') }}">*/
/*     <link rel="stylesheet" href="{{ asset('css/bootstrap.css') }}"> */
/*     <link rel="stylesheet" href="{{ asset('css/responsive.css') }}"> */
/* */
/* </head>*/
/* <!-- -->*/
/* */
/*         <div id="wrapper">*/
/*             <div id="login" class="animate form">*/
/*                 <section class="login_content row">*/
/*                     <form class="col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3 col-sm-10 col-sm-offset-1" action="{{ path('login') }}" method="post">*/
/*                         */
/*                         <img src="img/logoNew2.png" class="logoLogin col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3">*/
/* */
/*                         <!--<img src="img/t3.png" height="30"><br><br>-->*/
/*                         <!--<h1>Login</h1>-->*/
/*                         */
/*                         <input class="inputLogin col-lg-12 col-md-12 col-sm-12" spellcheck="false" type="email" placeholder="Email" required name="_username" value="{{ last_username }} " >*/
/*                     */
/*                         <input class="inputLogin col-lg-12 col-md-12 col-sm-12" type="password"  required name="_password" placeholder="Password"/>*/
/*                     */
/*                         <button class="col-lg-12 col-md-12 col-sm-12" id="buttonlogin" type="submit" >*/
/*                             {% if error %} Dados inválidos. Tentar Novamente.{% else %} ENTRAR {% endif %}*/
/*                         </button>*/
/*                         */
/* */
/*                         <div class="clearfix"></div>*/
/*                         <div class="separator">*/
/*                             <br>*/
/*                             <div class="footerLogin">*/
/*                                 <p>DashSoccer ©2016</p>*/
/*                                 <p>Todos os direitos reservados. </p>*/
/*                             </div>*/
/*                         </div>*/
/*                     </form>*/
/*                     <!-- form -->*/
/*                 </section>*/
/*                 <!-- content -->*/
/*             </div>*/
/*         </div>*/
/*     </div>*/
/* */
