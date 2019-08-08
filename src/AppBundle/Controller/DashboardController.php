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
* @Route("/api/dashboard")
*/
class DashboardController extends Controller
{

    
    /**
     * @Route("/dashboardTotais", name="dashboardTotais", options={"expose"=true})
     */
    public function dashboardTotais(){

        $tipoEntAtleta=1; //Entidade do tipo Atleta
        $tipoEntTreinador=2; //Entidade do tipo Treinador
        $tipoEntDiretor=3; //Entidade do tipo Diretor
        $tipoEntOutro=4; //Entidade do tipo Outro Staff

        $ModalidadeFutebol=1; //ID da Modalidade: Futebol
        $ModalidadeNatacao=2; //ID da Modalidade: Natação
        $estadoAtivo=1; //ID referente ao Estado: Ativo

        //epocas Repositorio
        $epocasRep = $this->getDoctrine()->getRepository('AppBundle:Epoca');
        $epocaAtual =  DashboardController::getEpocaAtual($epocasRep); 

        //escaloes atuais Repositorio
        $escaloesRep = $this->getDoctrine()->getRepository('AppBundle:Escalao');
        $escaloes = $escaloesRep->findBy(array('Epoca' => $epocaAtual ));

        //inicializações
        $escalaoTotais = [];
        $f=0;
        $n=0;
        
        $response = new JsonResponse();
        $responseArr = array();
        $responseArr['status'] = 'ok';


        //TOTAIS RELATIVOS AOS ATLETAS ATIVOS--------------------------------------------------------
        $atletasRep = $this->getDoctrine()->getRepository('AppBundle:Entidade'); 
        $atletas = $atletasRep->findBy(array('TipoEnt' => $tipoEntAtleta, 'Estado' => $estadoAtivo));

        $responseArr['totalAtletas'] = count($atletas);

        foreach ($atletas as $atleta) {
            foreach ($atleta->getModalidades() as $modalidade) {
             
              if($modalidade->getIDModalidade() == $ModalidadeFutebol){
                $f++;
              }

              if($modalidade->getIDModalidade() == $ModalidadeNatacao){
                $n++;
              }

            }
              //enquadrar atleta num Escalao - segundo a Data de Nascimento----------
              $DataN = $atleta->getDataNasc();

              foreach($escaloes as $escalao) {
                  $dataInicial = $escalao->getDataInicial();
                  $dataFinal = $escalao->getDataFinal();

                  if( $DataN>=$dataInicial AND $DataN<=$dataFinal ){
                    $escalaoTotais[]= $escalao->getIDEscalao();
                  }
              }
              //-------------------------------
        }

        $responseArr['totalAtletasFutebol'] = $f;
        $responseArr['totalAtletasNatacao'] = $n;

        //---------------------------------------------------------------------------------------------

        //TOTAIS RELATIVOS AO STAFF ATIVO--------------------------------------------------------
        $staffRep = $this->getDoctrine()->getRepository('AppBundle:Entidade'); 
        $treinadores = $staffRep->findBy(array('TipoEnt' => $tipoEntTreinador, 'Estado' => $estadoAtivo));
        $diretores = $staffRep->findBy(array('TipoEnt' => $tipoEntDiretor, 'Estado' => $estadoAtivo));
        $outroStaff = $staffRep->findBy(array('TipoEnt' => $tipoEntOutro, 'Estado' => $estadoAtivo));

        $responseArr['totalTreinadores'] = count($treinadores);
        $responseArr['totalDiretores'] = count($diretores);
        $responseArr['totalOutroStaff'] = count($outroStaff);

        $responseArr['totalStaff'] = count($treinadores) + count($diretores) + count($outroStaff);

        //----------------------------------------------------------------------------------------


        //GRAFICO: Totais por escalão------------------------------------------------------------------
        foreach($escaloes as $escalao) {
            $id = $escalao->getIDEscalao();

            $EscalaoNOMES[] = $escalao->getNome();

            if( isset(array_count_values($escalaoTotais)[$id]) ){
                $totalAtletasEscalao[] = array_count_values($escalaoTotais)[$id];
            }else{
                $totalAtletasEscalao[] = 0;
            }

         }


        //treinadores
        $escalaoTotais = [];

        foreach ($treinadores as $treinador) {

            foreach ($treinador->getEscaloesResp() as $escResp) {

                $escalaoTotais[]= $escResp->getIDEscalao();
               
            }

        }

        foreach($escaloes as $escalao) {
            $id = $escalao->getIDEscalao();

            if( isset(array_count_values($escalaoTotais)[$id]) ){
                $totalTreinadoresEscalao[] = array_count_values($escalaoTotais)[$id];
            }else{
                $totalTreinadoresEscalao[] = 0;
            }

         }

         //diretores
        $escalaoTotais = [];
        $totalDiretoresEscalao = [];

        foreach ($diretores as $diretor) {

            foreach ($diretor->getEscaloesResp() as $escResp) {

                $escalaoTotais[]= $escResp->getIDEscalao();
               
            }

        }

        foreach($escaloes as $escalao) {
            $id = $escalao->getIDEscalao();

            if( isset(array_count_values($escalaoTotais)[$id]) ){
                $totalDiretoresEscalao[] = array_count_values($escalaoTotais)[$id];
            }else{
                $totalDiretoresEscalao[] = 0;
            }

         }

         //outro staff
        $escalaoTotais = [];
        $totalOutroStaffEscalao = [];

        foreach ($outroStaff as $outro) {

            foreach ($outro->getEscaloesResp() as $escResp) {

                $escalaoTotais[]= $escResp->getIDEscalao();
               
            }

        }

        foreach($escaloes as $escalao) {
            $id = $escalao->getIDEscalao();

            if( isset(array_count_values($escalaoTotais)[$id]) ){
                $totalOutroStaffEscalao[] = array_count_values($escalaoTotais)[$id];
            }else{
                $totalOutroStaffEscalao[] = 0;
            }

         }

         $responseArr['EscalaoNOMES'] = $EscalaoNOMES;
         $responseArr['totalAtletasEscalao'] = $totalAtletasEscalao;
         $responseArr['totalTreinadoresEscalao'] = $totalTreinadoresEscalao;
         $responseArr['totalDiretoresEscalao'] = $totalDiretoresEscalao;
         $responseArr['totalOutroStaffEscalao'] = $totalOutroStaffEscalao;

        //---------------------------------------------------------------------------------------------

        $response->setData($responseArr);

        return $response;


    }

    private static function getEpocaAtual($epocasRep){
 
        $epocas = $epocasRep->findAll();
        $today = new \DateTime("now");

        //buscar dados
        foreach($epocas as $epoca) {
            $ep = array();
            $ep['DataInicio'] = $epoca->getDataInicio();
            $ep['DataFim'] = $epoca->getDataFim();

            if($today >= $ep['DataInicio'] and $today <= $ep['DataFim']){
                return $epoca;
            }
        }

    }



}