<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use AppBundle\Security\ChangePassword;

use AppBundle\Entity\Utilizador;
use AppBundle\Entity\TipoUtilizador;

/**
* @Route("/api/utilizadores")
*/
class UtilizadoresController extends Controller
{

    /**
     * @Route("/all", name="all_utilizadores", options={"expose"=true})
     */
    public function getUtilizadores(){

        $usersRep = $this->getDoctrine()->getRepository('AppBundle:Utilizador'); 
        $users = $usersRep->findAll();

        $response = new JsonResponse();
        $responseArr = array();
        $responseArr['status'] = 'ok';
        $responseArr['data'] = array();

        foreach($users as $user) {

            $u = array();
            $u['ID'] = $user->getIDutilizador();
            $u['Nome'] = $user->getNome();
            $u['Email'] = $user->getEmail();
            $u['TipoUser'] = $user->getTipoUtilizador()->getNome();
            $u['TipoUserID'] = $user->getTipoUtilizador()->getIDTipoU();
           
            $responseArr['data'][] = $u;

        }

        $userNome = $this->get('security.token_storage')->getToken()->getUser()->getNome();
        $userRole = $this->get('security.token_storage')->getToken()->getRoles()[0]->getRole();
        $responseArr['userRole'] = $userRole;
        $responseArr['userNome'] = $userNome;

        $response->setData($responseArr);

        return $response;


    }

    /**
     * @Route("/utilizador", name="getUser", options={"expose"=true})
     */
    public function getUser(){

        //buscar o id do user loginado
        $userID = $this->get('security.token_storage')->getToken()->getUser()->getIDutilizador();

        $usersRep = $this->getDoctrine()->getRepository('AppBundle:Utilizador'); 
        $user = $usersRep->find($userID);

        $response = new JsonResponse();
        $responseArr = array();
        $responseArr['status'] = 'ok';
        $responseArr['data'] = array();

        $u = array();
        $u['ID'] = $user->getIDutilizador();
        $u['Nome'] = $user->getNome();
        $u['Email'] = $user->getEmail();
        $u['TipoUserID'] = $user->getTipoUtilizador()->getIDTipoU();


        $userNome = $this->get('security.token_storage')->getToken()->getUser()->getNome();
        $userRole = $this->get('security.token_storage')->getToken()->getRoles()[0]->getRole();
           
        $responseArr['data'][] = $u;
        $responseArr['userRole'] = $userRole;
        $responseArr['userNome'] = $userNome;

        $response->setData($responseArr);

        return $response;


    }


    /**
     * @Route("/novoUtilizador", name="insertUser", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
    public function insertUser(Request $request){

        $dados = json_decode($request->getContent(),true);
        $outrosErros = [];

        //tipo Utilizador - dados da checkbox
        $tipoU = isset($dados['TipoUserID']) ? $dados['TipoUserID'] : 2 ;

        //get objeto Tipo Utilizador
        $tipoUserRep = $this->getDoctrine()->getRepository('AppBundle:TipoUtilizador');
        $tipo = $tipoUserRep->find($tipoU);
            

        //dados a ser inseridos
        $user = new Utilizador();
        $user->setNome(isset($dados['Nome']) ? $dados['Nome'] : null );
        $user->setEmail(isset($dados['Email']) ? $dados['Email'] : null );
        $user->setTipoUtilizador($tipo);

        

        //VALIDAÇÕES---------------

        //validações da password 
        //verifica se as passwords coincidem
        if( $dados['pass']==$dados['cfpass'] ){
            if(strlen($dados['pass'])>=8 AND strlen($dados['pass'])<=16){
                $user->setPassword($dados['pass']);
            }else{
                $user->setPassword(null);
                $outrosErros[] = "A password têm que ter entre 8 a 16 caracteres.";
            }
        }
        else{
            $user->setPassword(null);
            $outrosErros[] = "As passwords não coincidem.";
        }

        //validações pelos asserts na Entity
        $validator = $this->get('validator');
        $errors = $validator->validate($user);

        if ((count($errors) > 0) OR (!empty($outrosErros))) {

            $json['errors'] = array();

            foreach ($errors as $key => $value) {
                //devolução dos erros
                $errors = (string) $value->getMessage();
                $json['errors'][] = $errors;           
            }

            if(!empty($outrosErros)){
                $json['errors'] = array_merge($json['errors'], $outrosErros);
            }

            $json['status'] = 'error';

        }
        else {
            //inserir na base de dados
            $em = $this->getDoctrine()->getManager();

            //codificar password
            $encoder = $this->container->get('security.password_encoder');
            $encoded = $encoder->encodePassword($user, $dados['pass']);
            $user->setPassword($encoded);

            $em->persist($user);

            $em->flush();

            $json['status'] = 'ok';
        }


        //-------------------------

        // campos restantes para apresentação na tabela
        $dados['ID'] = $user->getIDutilizador();
        $dados['TipoUser'] = $tipo->getNome();

        $userNome = $this->get('security.token_storage')->getToken()->getUser()->getNome();
        $userRole = $this->get('security.token_storage')->getToken()->getRoles()[0]->getRole();

        $json['userNome'] = $userNome;
        $json['userRole'] = $userRole;

        //json response dos dados
        $json['dados'] = $dados;

        return new JsonResponse($json);

    }

    /**
     * @Route("/editarUtilizador", name="editUser", options={"expose"=true})
     */
    public function editUser(Request $request){
        
        $dados = json_decode($request->getContent(),true);
        $outrosErros = [];

        //get objeto Tipo Utilizador
        $tipoUserRep = $this->getDoctrine()->getRepository('AppBundle:TipoUtilizador');
        $tipo = $tipoUserRep->find($dados['TipoUserID']);

        //get objeto a ser editado
        $em = $this->getDoctrine()->getManager();
        $user = $em->getRepository('AppBundle:Utilizador')->find($dados['ID']);

        //dados a ser inseridos
        $user->setNome(isset($dados['Nome']) ? $dados['Nome'] : null );
        $user->setTipoUtilizador($tipo);
        $user->setEmail(isset($dados['Email']) ? $dados['Email'] : null );            

        //VALIDAÇÕES---------------

        //caso o user tenha escolhido mudar a password 
        if( isset($dados['newpass']) ){
            //verifica se as passwords coincidem
            if( $dados['newpass']==$dados['cfnewpass'] ){
                
                if(strlen($dados['newpass'])>=8 AND strlen($dados['newpass'])<=16){
                    if(isset($dados['oldpass'])){
                        $verificarPass = new ChangePassword(); 
                        $verificarPass->setOldPassword($dados['oldpass']); 
                    }
                }else{
                    $user->setPassword(null);
                    $verificarPass = null;
                    $outrosErros[] = "A password têm que ter entre 8 a 16 caracteres.";
                }
                //verifica se a password antiga é realmente a que o utilizador inseriu
                
            }else{
                $user->setPassword(null);
                $verificarPass = null;
                $outrosErros[] = "As passwords não coincidem.";
            }       
        }

        //validações pelos asserts na Entity
        $validator = $this->get('validator');
        $errors = $validator->validate($user);
        if(isset($dados['oldpass']) and $verificarPass!=null){
            $errorsPass = $validator->validate($verificarPass);
        }else{$errorsPass=[];}

        if ( (count($errors) > 0) OR (!empty($outrosErros)) OR (count($errorsPass) > 0) ) {

            $json['errors'] = array();

            foreach ($errors as $key => $value) {
                //devolução dos erros
                $errors = (string) $value->getMessage();
                $json['errors'][] = $errors;           
            }

            foreach ($errorsPass as $key => $value) {
                //devolução dos erros
                $errorsPass = (string) $value->getMessage();
                $json['errors'][] = $errorsPass;           
            }

            if(!empty($outrosErros)){
                $json['errors'] = array_merge($json['errors'], $outrosErros);
            }

            $json['status'] = 'error';
        }
        else {

            if( isset($dados['newpass']) ){
                //codificar password
                $encoder = $this->container->get('security.password_encoder');
                $encoded = $encoder->encodePassword($user, $dados['newpass']);
                $user->setPassword($encoded);
            }

            //inserir na base de dados
            $em->persist($user);

            $em->flush();

            $json['status'] = 'ok';
        }

        // campos restantes para apresentação na tabela
        $dados['TipoUser'] = $tipo->getNome();

        $userNome = $this->get('security.token_storage')->getToken()->getUser()->getNome();
        $userRole = $this->get('security.token_storage')->getToken()->getRoles()[0]->getRole();

        $json['userNome'] = $userNome;
        $json['userRole'] = $userRole;

        //json response
        $json['dados'] = $dados;

        return new JsonResponse($json);

    }

    /**
     * @Route("/apagarUtilizador", name="deleteUser", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
    public function deleteUser(Request $request){
        
        $dados = json_decode($request->getContent(),true);

        $em = $this->getDoctrine()->getManager();

        $user = $em->getRepository('AppBundle:Utilizador')->find($dados['ID']);

        $em->remove($user);

        $em->flush();

        $userNome = $this->get('security.token_storage')->getToken()->getUser()->getNome();
        $userRole = $this->get('security.token_storage')->getToken()->getRoles()[0]->getRole();

        $json['userNome'] = $userNome;
        $json['userRole'] = $userRole;

        //json response
        $json['dados'] = $dados;
        $json['status'] = 'ok';

        return new JsonResponse($json);

    }


    /**
     * @Route("/getUserDados", name="getUserDados", options={"expose"=true})
     */
    public function getUserDados(){

        //get o nome do user
        $userNome = $this->get('security.token_storage')->getToken()->getUser()->getNome();
        $userRole = $this->get('security.token_storage')->getToken()->getRoles()[0]->getRole();

        $json['userNome'] = $userNome;
        $json['userRole'] = $userRole;

        return new JsonResponse($json);
    }



    
}