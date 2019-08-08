<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\DBAL\Exception\ForeignKeyConstraintViolationException;

use AppBundle\Entity\Clube;
use AppBundle\Entity\Epoca;
use AppBundle\Entity\Escalao;
use AppBundle\Entity\Modalidade;
use AppBundle\Entity\Pagamento;
use AppBundle\Entity\ModoPagamento;
use Exception;

/**
* @Route("/api/parametros")
*/
class ParametrosController extends Controller
{
    /**
     * @Route("/all", name="all_parametros", options={"expose"=true})
     */
    public function getParametros(){

        $response = new JsonResponse();
        $responseArr = array();
        $responseArr['status'] = 'ok';

         // Escalões - Select //
        $escaloesRep = $this->getDoctrine()->getRepository('AppBundle:Escalao');
        $escaloes = $escaloesRep->findAll();

        $responseArr['escaloes'] = array();

        foreach($escaloes as $escalao) {

            $esc = array();
            $esc['IDEscalao'] = $escalao->getIDescalao();
            $esc['Nome'] = $escalao->getNome();
            $esc['EscMod'] = $escalao->getModalidades()->getNome();
            $esc['EscModID'] = $escalao->getModalidades()->getIDModalidade();
            $esc['Epoca'] = $escalao->getEpoca()->getNome();
            $esc['EpocaID'] = $escalao->getEpoca()->getIDEpoca();
            $esc['DataInicial'] = $escalao->getDataInicial()->format('d-m-Y');
            $esc['DataFinal'] = $escalao->getDataFinal()->format('d-m-Y');

            $responseArr['escaloes'][] = $esc;

        }

        // Modalidades - Select //
        $modalRep = $this->getDoctrine()->getRepository('AppBundle:Modalidade');
        $modalidades = $modalRep->findAll();

        $responseArr['modalidades'] = array();

        foreach($modalidades as $modalidade) {

            $mod = array();
            $mod['IDMod'] = $modalidade->getIDModalidade();
            $mod['Nome'] = $modalidade->getNome();

            $responseArr['modalidades'][] = $mod;

        }


        //Clubes - Select
        $clubesRep = $this->getDoctrine()->getRepository('AppBundle:Clube');
        $clubes = $clubesRep->findAll();

        $responseArr['clubes'] = array();

        foreach($clubes as $clube) {

            $cl = array();
            $cl['IDClube'] = $clube->getIDClube();
            $cl['Nome'] = $clube->getNome();
            $cl['Abrv'] = $clube->getAbrv();
            $cl['Cidade'] = $clube->getCidade();
            $cl['Estadio'] = $clube->getEstadio();

            $responseArr['clubes'][] = $cl;

        }

        // Epocas - Select //
        $epocasRep = $this->getDoctrine()->getRepository('AppBundle:Epoca');
        $epocas = $epocasRep->findAll();

        $responseArr['epocas'] = array();

        foreach($epocas as $epoca) {

            $esc = array();
            $esc['IDEpoca'] = $epoca->getIDEpoca();
            $esc['Nome'] = $epoca->getNome();
            $esc['DataInicio'] = $epoca->getDataInicio()->format('d-m-Y');
            $esc['DataFim'] = $epoca->getDataFim()->format('d-m-Y');

            $responseArr['epocas'][] = $esc;

        }


        $response->setData($responseArr);

        return $response;

    }

    /**
     * @Route("/novoClube", name="insertClube", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
    public function insertClube(Request $request){

        $dados = json_decode($request->getContent(),true);

        //dados a ser inseridos
        $clube = new Clube();
        $clube->setNome(isset($dados['Nome']) ? $dados['Nome'] : null );
        $clube->setAbrv(isset($dados['Abrv']) ? $dados['Abrv'] : null );
        $clube->setCidade(isset($dados['Cidade']) ? $dados['Cidade'] : null );
        $clube->setEstadio(isset($dados['Estadio']) ? $dados['Estadio'] : null );

        //VALIDAÇÕES---------------

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
            $em = $this->getDoctrine()->getManager();

            $em->persist($clube);

            $em->flush();

            $json['status'] = 'ok';
        }


        //-------------------------

        // campos restantes para apresentação na tabela
        $dados['IDClube'] = $clube->getIDClube();

        //json response
        $json['ent'] = 'clubes';
        $json['dados'] = $dados;

        return new JsonResponse($json);

    }

    /**
     * @Route("/editarClube", name="editClube", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
    public function editClube(Request $request){

        $dados = json_decode($request->getContent(),true);

        //get objeto a ser editado
        $em = $this->getDoctrine()->getManager();
        $clube = $em->getRepository('AppBundle:Clube')->find($dados['IDClube']);

        //dados a ser inseridos
        $clube->setNome(isset($dados['Nome']) ? $dados['Nome'] : null );
        $clube->setAbrv(isset($dados['Abrv']) ? $dados['Abrv'] : null );
        $clube->setCidade(isset($dados['Cidade']) ? $dados['Cidade'] : null );
        $clube->setEstadio(isset($dados['Estadio']) ? $dados['Estadio'] : null );

        //VALIDAÇÕES---------------

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


        $json['ent'] = 'clubes';
        $json['dados'] = $dados;

        return new JsonResponse($json);

    }

    /**
     * @Route("/apagarClube", name="deleteClube", options={"expose"=true})
     */
    public function deleteClube(Request $request){

        $dados = json_decode($request->getContent(),true);

        $em = $this->getDoctrine()->getManager();

        $clube = $em->getRepository('AppBundle:Clube')->find($dados['IDClube']);

        $json['status'] = 'ok';

        try {
            $em->remove($clube);
            $em->flush();
        } catch (\Exception $e) {
            //echo 'Exceção capturada: ',  $e->getMessage(), "\n";
            $json['errors'][] = "O clube contém dados relacionados. Remova-os e tente novamente.";
            $json['status'] = 'error';
        }

        $json['ent'] = 'clubes';
        $json['dados'] = $dados;

        return new JsonResponse($json);

    }


    /**
     * @Route("/novaEpoca", name="insertEpoca", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
    public function insertEpoca(Request $request){

        $dados = json_decode($request->getContent(),true);
        $outrosErros = [];

        //datetime format
        $dataInicio = isset($dados['DataInicio']) ? new \DateTime($dados['DataInicio']) : null ;
        $dataFim = isset($dados['DataFim']) ? new \DateTime($dados['DataFim']) : null ;

        //dados a ser inseridos
        $epoca = new Epoca();
        $epoca->setNome(isset($dados['Nome']) ? $dados['Nome'] : null );
        $epoca->setDataInicio($dataInicio);
        $epoca->setDataFim($dataFim);

        //VALIDAÇÕES---------------

        //verifica se a data inicial < data final
        if( $dataInicio < $dataFim ){
            $epoca->setDataInicio($dataInicio);
            $epoca->setDataFim($dataFim);
        }
        else{
            $outrosErros[] = "A data de início tem de ser inferior à data de fim da época.";
        }

        //validações pelos asserts na Entity
        $validator = $this->get('validator');
        $errors = $validator->validate($epoca);

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

            $em->persist($epoca);

            $em->flush();

            $json['status'] = 'ok';
        }


        //-------------------------

        // campos restantes para apresentação na tabela
        $dados['IDEpoca'] = $epoca->getIDEpoca();

        //json response
        $json['ent'] = 'epocas';
        $json['dados'] = $dados;

        return new JsonResponse($json);

    }

    /**
     * @Route("/editarEpoca", name="editEpoca", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
    public function editEpoca(Request $request){

        $dados = json_decode($request->getContent(),true);
        $outrosErros = [];

        //get objeto a ser editado
        $em = $this->getDoctrine()->getManager();
        $epoca = $em->getRepository('AppBundle:Epoca')->find($dados['IDEpoca']);

        //datetime format
        $dataInicio = isset($dados['DataInicio']) ? new \DateTime($dados['DataInicio']) : null ;
        $dataFim = isset($dados['DataFim']) ? new \DateTime($dados['DataFim']) : null ;

        //dados a ser inseridos
        $epoca->setNome(isset($dados['Nome']) ? $dados['Nome'] : null );


        //VALIDAÇÕES---------------

        //verifica se a data inicial < data final
        if( $dataInicio < $dataFim ){
            $epoca->setDataInicio($dataInicio);
            $epoca->setDataFim($dataFim);
        }
        else{
            $outrosErros[] = "A data de início tem de ser inferior à data de fim da época.";
        }

        //validações pelos asserts na Entity
        $validator = $this->get('validator');
        $errors = $validator->validate($epoca);

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

            $em->persist($epoca);

            $em->flush();

            $json['status'] = 'ok';
        }

        //-------------------------

        $json['ent'] = 'epocas';
        $json['dados'] = $dados;

        return new JsonResponse($json);

    }

    /**
     * @Route("/apagarEpoca", name="deleteEpoca", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
    public function deleteEpoca(Request $request){

        $dados = json_decode($request->getContent(),true);

        $em = $this->getDoctrine()->getManager();

        $epoca = $em->getRepository('AppBundle:Epoca')->find($dados['IDEpoca']);

        $json['status'] = 'ok';

        try {
            $em->remove($epoca);
            $em->flush();
        } catch (\Exception $e) {
            //echo 'Exceção capturada: ',  $e->getMessage(), "\n";
            $json['errors'][] = "A época contém dados relacionados. Remova-os e tente novamente.";
            $json['status'] = 'error';
        }

        $json['ent'] = 'epocas';
        $json['dados'] = $dados;

        return new JsonResponse($json);

    }

    /**
     * @Route("/getEpoca/{id}", name="getEpoca", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
     public function getEpoca($id){

       $em = $this->getDoctrine()->getManager();

       $entityEpoca = $em->getRepository('AppBundle:Epoca')->find($id);

       $epoca = array();

       $epoca['IDEpoca'] = $entityEpoca->getIDEpoca();
       $epoca['Nome'] = $entityEpoca->getNome();
       $epoca['DataInicio'] = $entityEpoca->getDataInicio()->format('d-m-Y');
       $epoca['DataFim'] = $entityEpoca->getDataFim()->format('d-m-Y');

       $epoca['ModosPagamento'] = array();

       foreach($entityEpoca->getModosPagamento() as $modo){
         $m['IDModo'] = $modo->getIDModoPagamento();
         $m['Descricao'] = $modo->getDescricao();
         $m['Activo'] = $modo->getActivo();
         $m['Pagamentos'] = array();

         foreach($modo->getPagamentos() as $pagamento){
           $p['ID_Pagamento'] = $pagamento->getIDPagamento();
           $p['Descricao'] = $pagamento->getDescricao();
           $p['Valor'] = $pagamento->getValor();
           $p['ValorPosLimite'] = $pagamento->getValorPosLimite();
           $p['DataLimite'] = $pagamento->getDataLimite()->format('d-m-Y');
           $p['Benificio'] = $pagamento->getBenificio();
           $p['DescricaoBenificio'] = $pagamento->getDescricaoBenificio();

           $m['Pagamentos'][] = $p;
         }

         $epoca['ModosPagamento'][] = $m;
       }


       return new JsonResponse(array('status' => 'ok', 'epoca' => $epoca));
     }

     /**
      * @Route("/addModoPagamento", name="addModoPagamento", options={"expose"=true})
      * @Security("has_role('ROLE_ADMIN')")
      */
     public function addModoPagamento(Request $request){
       $dados = json_decode($request->getContent(),true);

       $em = $this->getDoctrine()->getManager();
       $epoca = $em->getRepository('AppBundle:Epoca')->find($dados['REF_Epoca']);

       $modo = new ModoPagamento();

       $modo->setDescricao($dados['Descricao']);
       $modo->setEpoca($epoca);
       $modo->setActivo(false);

       $em->persist($modo);
       $em->flush();

       return new JsonResponse(array('status'=>'ok', 'modo' => array('IDModo' => $modo->getIDModoPagamento(),'REF_Epoca' => $modo->getEpoca()->getIDEpoca(), 'Descricao' => $modo->getDescricao(), 'Pagamentos' => [] )));
     }

     /**
      * @Route("/editarModoPagamento", name="editarModoPagamento", options={"expose"=true})
      * @Security("has_role('ROLE_ADMIN')")
      */
     public function editarModoPagamento(Request $request){
       $dados = json_decode($request->getContent(),true);

       $em = $this->getDoctrine()->getManager();
       $modo = $em->getRepository('AppBundle:ModoPagamento')->find($dados['IDModo']);

       $modo->setDescricao($dados['Descricao']);
       $modo->setActivo($dados['Activo']);

       $em->persist($modo);
       $em->flush();
       return new JsonResponse(array('status'=>'ok'));
     }

     /**
      * @Route("/removeModoPagamento", name="removeModoPagamento", options={"expose"=true})
      * @Security("has_role('ROLE_ADMIN')")
      */
     public function removeModoPagamento(Request $request){

       $dados = json_decode($request -> getContent(), true);

       $em = $this->getDoctrine()->getManager();
       $modo = $em->getRepository('AppBundle:ModoPagamento')->find($dados['IDModo']);

       try{

         $em -> remove ($modo);
         $em -> flush();

         return new JsonResponse(array('status'=>'ok'));
       }catch(ForeignKeyConstraintViolationException $fkex){
         return new JsonResponse(array('status'=>'error', 'errors' => 'fk_exception'));
       }catch(Exception $ex){
         return new JsonResponse(array('status'=>'error', 'errors' => $ex->getMessage()));
       }


       return new JsonResponse(array('status' => 'ok'));
     }

     /**
      * @Route("/addPagamento", name="addPagamento", options={"expose"=true})
      * @Security("has_role('ROLE_ADMIN')")
      */
     public function addPagamento(Request $request){
       $dados = json_decode($request->getContent(),true);

       $em = $this->getDoctrine()->getManager();
       $modo = $em->getRepository('AppBundle:ModoPagamento')->find($dados['REF_ModoPagamento']);

       $pagamento = new Pagamento();
       $pagamento->setDescricao($dados['Descricao']);
       $pagamento->setValor($dados['Valor']);
       $pagamento->setDataLimite(new \DateTime($dados['DataLimite']));
       $pagamento->setValorPosLimite($dados['ValorPosLimite']);
       $pagamento->setBenificio($dados['Benificio']);
       $pagamento->setDescricaoBenificio($dados['DescricaoBenificio']);
       $pagamento->setModoPagamento($modo);

       $em->persist($pagamento);

       $em->flush();

       return new JsonResponse(array('status' => 'ok'));
     }

     /**
      * @Route("/editarPagamento", name="editarPagamento", options={"expose"=true})
      * @Security("has_role('ROLE_ADMIN')")
      */
      public function editarPagamento(Request $request){
        $dados = json_decode($request->getContent(),true);

        $em = $this->getDoctrine()->getManager();
        $pagamento = $em->getRepository('AppBundle:Pagamento')->find($dados['ID_Pagamento']);

        $pagamento->setDescricao($dados['Descricao']);
        $pagamento->setValor($dados['Valor']);
        $pagamento->setDataLimite(new \DateTime($dados['DataLimite']));
        $pagamento->setValorPosLimite($dados['ValorPosLimite']);
        $pagamento->setBenificio(isset($dados['Benificio']) ? true : false);
        $pagamento->setDescricaoBenificio(isset($dados['Benificio']) ? $dados['DescricaoBenificio'] : "");

        $em->persist($pagamento);

        if ($dados['alterarPagamentosEntidade']){

          $pagamentosEntidade = $em->getRepository('AppBundle:PagamentoEntidade')->findBy(array('Pagamento' =>$dados['ID_Pagamento'] ));

          foreach($pagamentosEntidade as $pe){
            if (!$pe->getPago()){
              $pe->setDescricao($dados['Descricao']);
              $pe->setValor($dados['Valor']);
              $pe->setDataLimite(new \DateTime($dados['DataLimite']));
              $pe->setValorPosLimite($dados['ValorPosLimite']);
              $pe->setBenificio(isset($dados['Benificio']) ? true : false);
              $pe->setDescricaoBenificio(isset($dados['Benificio']) ? $dados['DescricaoBenificio'] : "");

              $em->persist($pe);
            }
          }
        }

        $em->flush();

        return new JsonResponse(array('status' => 'ok'));
      }


     /**
      * @Route("/removePagamento", name="removePagamento", options={"expose"=true})
      * @Security("has_role('ROLE_ADMIN')")
      */
     public function removePagamento(Request $request){
       $dados = json_decode($request->getContent(),true);

       $em = $this->getDoctrine()->getManager();
       $pagamento = $em->getRepository('AppBundle:Pagamento')->find($dados['ID_Pagamento']);

       try{
         $em->remove($pagamento);
         $em->flush();
         return new JsonResponse(array('status'=>'ok'));
       }catch(ForeignKeyConstraintViolationException $fkex){
         return new JsonResponse(array('status'=>'error', 'errors' => 'fk_exception'));
       }catch(Exception $ex){
         return new JsonResponse(array('status'=>'error', 'errors' => $ex->getMessage()));
       }



     }


    /**
     * @Route("/novoEscalao", name="insertEscalao", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
    public function insertEscalao(Request $request){

        $dados = json_decode($request->getContent(),true);
        $outrosErros = [];

        //get objeto Modalidade
        $modalidadeRep = $this->getDoctrine()->getRepository('AppBundle:Modalidade');
        $modalidade = $modalidadeRep->find($dados['EscModID']);

        //get objeto Epoca
        $epocaRep = $this->getDoctrine()->getRepository('AppBundle:Epoca');
        $epoca = $epocaRep->find($dados['EpocaID']);

        //datetime
        $dataInicial = isset($dados['DataInicial']) ? new \DateTime($dados['DataInicial']) : null ;
        $dataFinal = isset($dados['DataFinal']) ? new \DateTime($dados['DataFinal']) : null ;

        //dados a ser inseridos
        $escalao = new Escalao();
        $escalao->setNome(isset($dados['Nome']) ? $dados['Nome'] : null );
        $escalao->setModalidades($modalidade);
        $escalao->setEpoca($epoca);
        $escalao->setDataInicial($dataInicial);
        $escalao->setDataFinal($dataFinal);

        //VALIDAÇÕES---------------

        if( $dataInicial >= $dataFinal ){
            $outrosErros[] = "A data inicial tem de ser inferior à data final do escalão.";
        }

        //validações pelos asserts na Entity
        $validator = $this->get('validator');
        $errors = $validator->validate($escalao);

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

            $em->persist($escalao);

            $em->flush();

            $json['status'] = 'ok';
        }

        //-------------------------

        // campos restantes para apresentação na tabela
        $dados['IDEscalao'] = $escalao->getIDescalao();
        $dados['EscMod'] = $modalidade->getNome();
        $dados['Epoca'] = $epoca->getNome();

        //json response
        $json['ent'] = 'escaloes';
        $json['dados'] = $dados;

        return new JsonResponse($json);

    }

    /**
     * @Route("/editarEscalao", name="editEscalao", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
    public function editEscalao(Request $request){

        $dados = json_decode($request->getContent(),true);
        $outrosErros = [];

        //get objeto a ser editado
        $em = $this->getDoctrine()->getManager();
        $escalao = $em->getRepository('AppBundle:Escalao')->find($dados['IDEscalao']);

        //get objeto Modalidade
        $modalidadeRep = $this->getDoctrine()->getRepository('AppBundle:Modalidade');
        $modalidade = $modalidadeRep->find($dados['EscModID']);

        //get objeto Epoca
        $epocaRep = $this->getDoctrine()->getRepository('AppBundle:Epoca');
        $epoca = $epocaRep->find($dados['EpocaID']);

        //datetime
        $dataInicial = isset($dados['DataInicial']) ? new \DateTime($dados['DataInicial']) : null ;
        $dataFinal = isset($dados['DataFinal']) ? new \DateTime($dados['DataFinal']) : null ;

       
        //dados a ser inseridos
        $escalao->setNome(isset($dados['Nome']) ? $dados['Nome'] : null );
        $escalao->setModalidades($modalidade);
        $escalao->setEpoca($epoca);
        $escalao->setDataInicial($dataInicial);
        $escalao->setDataFinal($dataFinal);
        //dados relativos ao equipamento
        $escalao->setEquipamentoNrMinimo(isset($dados['EquipamentoNrMinimo']) ? $dados['EquipamentoNrMinimo'] : null );
        $escalao->setEquipamentoNrMaximo(isset($dados['EquipamentoNrMaximo']) ? $dados['EquipamentoNrMaximo'] : null );
        
        //VALIDAÇÕES---------------
        if( $dataInicial >= $dataFinal ){
            $outrosErros[] = "A data inicial tem de ser inferior à data final do escalão.";
        }

        //validações pelos asserts na Entity
        $validator = $this->get('validator');
        $errors = $validator->validate($escalao);

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

            $em->persist($escalao);

            $em->flush();

            $json['status'] = 'ok';
        }

        //-------------------------

        $json['ent'] = 'escaloes';
        $json['dados'] = $dados;

        return new JsonResponse($json);

    }

     /**
     * @Route("/apagarEscalao", name="deleteEscalao", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
    public function deleteEscalao(Request $request){

        $dados = json_decode($request->getContent(),true);

        $em = $this->getDoctrine()->getManager();

        $escalao = $em->getRepository('AppBundle:Escalao')->find($dados['IDEscalao']);

        $json['status'] = 'ok';

        try {
            $em->remove($escalao);
            $em->flush();
        } catch (\Exception $e) {
            //echo 'Exceção capturada: ',  $e->getMessage(), "\n";
            $json['errors'][] = "O escalão contém dados relacionados. Remova-os e tente novamente.";
            $json['status'] = 'error';
        }

        $json['ent'] = 'escaloes';
        $json['dados'] = $dados;

        return new JsonResponse($json);

    }

     /**
     * @Route("/novaModalidade", name="insertModalidade", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
    public function insertModalidade(Request $request){

        $dados = json_decode($request->getContent(),true);

        //dados a ser inseridos
        $modalidade = new Modalidade();
        $modalidade->setNome(isset($dados['Nome']) ? $dados['Nome'] : null );

        //VALIDAÇÕES---------------

        $validator = $this->get('validator');
        $errors = $validator->validate($modalidade);

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
            $em = $this->getDoctrine()->getManager();

            $em->persist($modalidade);

            $em->flush();

            $json['status'] = 'ok';
        }


        //-------------------------

        // campos restantes para apresentação na tabela
        $dados['IDMod'] = $modalidade->getIDModalidade();

        //json response
        $json['ent'] = 'modalidades';
        $json['dados'] = $dados;

        return new JsonResponse($json);

    }

    /**
     * @Route("/editarModalidade", name="editModalidade", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
    public function editModalidade(Request $request){

        $dados = json_decode($request->getContent(),true);

        //get objeto a ser editado
        $em = $this->getDoctrine()->getManager();
        $modalidade = $em->getRepository('AppBundle:Modalidade')->find($dados['IDMod']);

        //dados a ser inseridos
        $modalidade->setNome(isset($dados['Nome']) ? $dados['Nome'] : null );

        //VALIDAÇÕES---------------

        $validator = $this->get('validator');
        $errors = $validator->validate($modalidade);

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

            $em->persist($modalidade);

            $em->flush();

            $json['status'] = 'ok';
        }

        //-------------------------

        $json['ent'] = 'modalidades';
        $json['dados'] = $dados;

        return new JsonResponse($json);

    }

    /**
     * @Route("/apagarModalidade", name="deleteModalidade", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
    public function deleteModalidade(Request $request){

        $dados = json_decode($request->getContent(),true);

        $em = $this->getDoctrine()->getManager();

        $modalidade = $em->getRepository('AppBundle:Modalidade')->find($dados['IDMod']);

        $json['status'] = 'ok';

        try {
            $em->remove($modalidade);
            $em->flush();
        } catch (\Exception $e) {
            //echo 'Exceção capturada: ',  $e->getMessage(), "\n";
            $json['errors'][] = "A modalidade contém dados relacionados. Remova-os e tente novamente.";
            $json['status'] = 'error';
        }


        $json['ent'] = 'modalidades';
        $json['dados'] = $dados;

        return new JsonResponse($json);

    }


}
