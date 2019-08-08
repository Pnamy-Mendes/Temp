<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;

//use AppBundle\Entity\Utilizador;
//use AppBundle\Entity\TipoUtilizador;

/**
* @Route("/api/login")
*/
class loginController extends Controller
{

    /**
     * @Route("/validateLogin", name="validateLogin", options={"expose"=true})
     */
    public function validateLogin(Request $request){
        $dados = json_decode($request->getContent(),true);
        $outrosErros = [];

        //get objeto Tipo Utilizador
        //$tipoUserRep = $this->getDoctrine()->getRepository('AppBundle:TipoUtilizador');
        //$tipo = $tipoUserRep->find($dados['TipoUserID']);

        //get objeto a ser editado
        $em = $this->getDoctrine()->getManager();
        $user = $em->getRepository('AppBundle:Utilizador')->findBy(
            array('Email' => $dados['email'], 'Password' => $dados['password'])
        );

            //caso o user tenha escolhido mudar a password
        if(!$user){
            $outrosErros[] = "O email ou a password estão erradas.";
        }

        //verificação do status - caso error ou ok
        if (!empty($outrosErros)) {

            $json['errors'] = $outrosErros;

            $json['status'] = 'error';
        }
        else {

            $json['status'] = 'ok';
        }

        //json response
        $json['dados'] = $dados;

        return new JsonResponse($json);

    }




}
