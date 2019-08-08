<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
* @Route("/api/clube")
*/
class ClubeController extends Controller
{

    /**
     * @Route("/all", name="all_clube", options={"expose"=true})
     */
    public function getClube(){

        $IDCDE = 1; //ID do Clube Principal do Programa (CDE)


        $clubeRep = $this->getDoctrine()->getRepository('AppBundle:Clube'); 
        $clubes = $clubeRep->findBy(array('ID_Clube'=>$IDCDE));

        $response = new JsonResponse();
        $responseArr = array();
        $responseArr['status'] = 'ok';
        $responseArr['data'] = array();

        foreach($clubes as $clube) {

            $info = array();
            $info['Nome'] = $clube->getNome();
            $info['Abrv'] = $clube->getAbrv();
            $info['N_FPF'] = $clube->getNFPF();
            $info['Associacao'] = $clube->getAssociacao();
            $info['Fundacao'] = $clube->getFundacao()->format('d-m-Y');
            $info['Presidente'] = $clube->getPresidente();
            $info['Estadio'] = $clube->getEstadio();
            $info['Cidade'] = $clube->getCidade();
            $info['Pais'] = $clube->getPais();
            $info['Foto'] = $clube->getFoto();

           
            $responseArr['data'][] = $info;

        }

        $response->setData($responseArr);

        return $response;


    }

    


    /**
     * @Route("/editarDadosClube", name="editarDadosClube", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
    public function editarDadosClube(Request $request){
        
        $dados = json_decode($request->getContent(),true);
        $IDCDE = 1; //ID do Clube Principal - CDE

        //get objeto a ser editado
        $em = $this->getDoctrine()->getManager();
        $clube = $em->getRepository('AppBundle:Clube')->find($IDCDE);

        //dados a ser inseridos
        $clube->setNome(isset($dados['Nome']) ? $dados['Nome'] : null );
        $clube->setAbrv(isset($dados['Abrv']) ? $dados['Abrv'] : null );
        $clube->setNFPF(isset($dados['N_FPF']) ? $dados['N_FPF'] : null );
        $clube->setAssociacao(isset($dados['Associacao']) ? $dados['Associacao'] : null );
        $dataFundacao = isset($dados['Fundacao']) ? new \DateTime($dados['Fundacao']) : null ;
        $clube->setFundacao($dataFundacao);
        $clube->setPresidente(isset($dados['Presidente']) ? $dados['Presidente'] : null );
        $clube->setEstadio(isset($dados['Estadio']) ? $dados['Estadio'] : null );
        $clube->setCidade(isset($dados['Cidade']) ? $dados['Cidade'] : null );
        $clube->setPais(isset($dados['Pais']) ? $dados['Pais'] : null );
  

        //VALIDAÇÕES---------------

        //validações pelos asserts na Entity
        $validator = $this->get('validator');
        $errors = $validator->validate($clube);

        if (count($errors) > 0) {

            $json['errors'] = array();

            foreach ($errors as $key => $value) {
                //devolução dos erros
                $errors = (string) $value->getMessage();
                $json['errors'][] = $errors;           
            }

            $json['status'] = 'error';
        }
        else {
            //inserir na base de dados

            $em->persist($clube);

            $em->flush();

            $json['status'] = 'ok';
        }

        //json response
        $json['dados'] = $dados;

        return new JsonResponse($json);

    }




}