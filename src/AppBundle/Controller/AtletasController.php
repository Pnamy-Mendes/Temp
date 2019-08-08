<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;

use AppBundle\Entity\Entidade;
use AppBundle\Entity\Equipamento;
use AppBundle\Entity\Morada;
use AppBundle\Entity\EntidadeREL;
use AppBundle\Entity\DocumentoEntidade;
use AppBundle\Entity\ModoPagamentoEntidade;
use AppBundle\Entity\PagamentoEntidade;

use Exception;
use Symfony\Component\Validator\Constraints\Type;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\MinLength;
use Symfony\Component\Validator\Constraints\MaxLength;
use Symfony\Component\Validator\Constraints\Collection;
use Symfony\Component\Validator\Constraints\True;
use Symfony\Component\Validator\Constraints\NotNull;
use Symfony\Component\Validator\Constraints\Callback;

/**
 * @Route("/api/atletas")
 */
class AtletasController extends Controller
{
  /**
   * @Route("/all", name="all_atletas", options={"expose"=true})
   */
  public function getAtletas()
  {

    $tipoEntAtleta = 1; //Entidade do tipo Atleta
    $ID_GR = 1; //ID Posição Guarda-Redes
   
    $response = new JsonResponse();
    $responseArr = array();
    $responseArr['status'] = 'ok';

    $epocasRep = $this->getDoctrine()->getRepository('AppBundle:Epoca');
    $epocaAtual =  AtletasController::getEpocaAtual($epocasRep);



    // Escalões - Select //
    $escaloesRep = $this->getDoctrine()->getRepository('AppBundle:Escalao');
    $escaloes = $escaloesRep->findBy(array('Epoca' => $epocaAtual));

    $responseArr['escaloes'] = array();

    //buscar dados
    foreach ($escaloes as $escalao) {

      $esc = array();
      $esc['IDEscalao'] = $escalao->getIDescalao();
      $esc['Nome'] = $escalao->getNome();
      $esc['EscMod'] = $escalao->getModalidades()->getNome();

      $responseArr['escaloes'][] = $esc;
    }

    // Modalidades - Select //
    $modalRep = $this->getDoctrine()->getRepository('AppBundle:Modalidade');
    $modalidades = $modalRep->findAll();

    $responseArr['modalidades'] = array();

    //buscar dados
    foreach ($modalidades as $modalidade) {

      $mod = array();
      $mod['IDMod'] = $modalidade->getIDModalidade();
      $mod['Nome'] = $modalidade->getNome();

      $responseArr['modalidades'][] = $mod;
    }


    /* Atletas */
    $entidadeRep = $this->getDoctrine()->getRepository('AppBundle:Entidade');
    $entidades = $entidadeRep->findBy(array('TipoEnt' => $tipoEntAtleta));

    $responseArr['entidades'] = array();

    //buscar dados
    foreach ($entidades as $entidade) {

      $enti = array();
      $enti['ID'] = $entidade->getIDEntidade();
      $enti['Nome'] = $entidade->getNome();
      $enti['Estado'] = $entidade->getEstado();

      //get varias modalidades do atleta
      foreach ($entidade->getModalidades() as $modalidade) {
        $enti['Modalidade'][] =  $modalidade->getNome();
      }

      //buscar tutores
      $tutoresRep = $this->getDoctrine()->getRepository('AppBundle:EntidadeREL');
      $Tutores1 = $tutoresRep->findBy(array('ID_Entidade' => $enti['ID']), array('ID_EntidadeRel' => 'ASC'), 1);
      $Tutores2 = $tutoresRep->findBy(array('ID_Entidade' => $enti['ID']), array('ID_EntidadeRel' => 'DESC'), 1);


      foreach ($Tutores1 as $tutor1) {
        $enti['NomeTutor1'] = $tutor1->getIDEntidadeAssoc()->getNome();
        $enti['TelmTutor1'] = $tutor1->getIDEntidadeAssoc()->getTelm();
      }

      if ($Tutores2 !== $Tutores1) {
        foreach ($Tutores2 as $tutor2) {
          $enti['NomeTutor2'] = $tutor2->getIDEntidadeAssoc()->getNome();
          $enti['TelmTutor2'] = $tutor2->getIDEntidadeAssoc()->getTelm();
        }
      }

      //enquadrar atleta num Escalao - segundo a Data de Nascimento
      $DataN = $entidade->getDataNasc();
      if ($DataN) {
        $enti['DataNasc'] = $DataN->format('d-m-Y');
      }


      //escaloes
      $escs = $escaloesRep->findBy(array('Epoca' => $epocaAtual));

      foreach ($escs as $escalao) {
        $e['DataInicial'] = $escalao->getDataInicial();
        $e['DataFinal'] = $escalao->getDataFinal();

        if ($DataN >= $e['DataInicial'] and $DataN <= $e['DataFinal']) {
          $enti['Escalao'] = $escalao->getNome();
        }
      }


      $responseArr['entidades'][] = $enti;
    }


    $response->setData($responseArr);

    return $response;
  }

  




  /**
   * @Route("/get/{id}", name="all_atletaPerfil", options={"expose"=true})
   */
  public function getPerfilAtleta(Request $request, $id)
  {

    $ID_GR = 1; // Posição GR (para efeitos de equipamento)

    $entidadeRep = $this->getDoctrine()->getRepository('AppBundle:Entidade');
    $entidades = $entidadeRep->findBy(array('ID_Entidade' => $id));

    $response = new JsonResponse();
    $responseArr = array();
    $responseArr['status'] = 'ok';
    $responseArr['data'] = array();

    foreach ($entidades as $entidade) {

      $enti['ID'] = $entidade->getIDEntidade();
      $enti['NLicenca'] = $entidade->getnLicenca();
      $enti['Nome'] = $entidade->getNome();
      $enti['Telf'] = $entidade->getTelf();
      $enti['Telm'] = $entidade->getTelm();
      $enti['Email'] = $entidade->getEmail();
      $enti['Morada_Rua'] = $entidade->getMorada()->getRua();
      $enti['Morada_Numero'] = $entidade->getMorada()->getNumero();
      $enti['Morada_Andar'] = $entidade->getMorada()->getAndar();
      $enti['Morada_CodPostal4'] = $entidade->getMorada()->getCodPostal4();
      $enti['Morada_CodPostal3'] = $entidade->getMorada()->getCodPostal3();
      $enti['Morada_Localidade'] = $entidade->getMorada()->getLocalidade();
      $enti['Naturalidade'] = $entidade->getNaturalidade();

      $enti['Pais'] = $entidade->getPais();
      $dataN = $entidade->getDataNasc();
      if ($dataN) {
        $enti['DataNasc'] = $dataN->format('d-m-Y');
      }

      $enti['CC'] = $entidade->getCC();
      $enti['NIF'] = $entidade->getNIF();
      $enti['GSanguineo'] = $entidade->getGSanguineo();
      $enti['Habilitacoes'] = $entidade->getHabilitacoes();
      $enti['Doencas'] = $entidade->getDoencas();
      $enti['Profissao'] = $entidade->getProfissao();
      $ultimaAtualizacao = $entidade->getUltimaAtualizacao();
      if ($ultimaAtualizacao) {
        $enti['UltimaAtualizacao'] = $ultimaAtualizacao->format('d-m-Y');
      }
      $enti['FotoInscricao'] = $entidade->getFotoInscricao();
      //$enti['FotoCromos'] = $entidade->getFotoCromos();

      //referente à epoca
      $ep = $this->getDoctrine()->getRepository('AppBundle:Epoca');
      //encontrada a epoca atual com o id 5-> 2019/2020
      $idEpocaAtual=5;
      $epoca_encontrada = $ep->find( $idEpocaAtual);
      
      $equipamento= new Equipamento();
      $equipamento->setEpoca($epoca_encontrada);
      


      //get equipamento caso exista

      if ($entidade->getEquipamento() !== NULL) {
        $enti['Equipamento_ID'] = $entidade->getEquipamento()->getIDequipamento();
        $enti['Equipamento_Nome'] = $entidade->getEquipamento()->getNome();
        $enti['Equipamento_Numero'] = $entidade->getEquipamento()->getNumero();
        $enti['Equipamento_observacoes'] = $entidade->getEquipamento()->getObservacoes();
        // get epoca do atleta em questao
        $enti['Epoca'] = $entidade->getEquipamento()->getEpoca();

      
        //get tamanho caso exista
        $enti['Equipamento_TamanhoID'] = $entidade->getEquipamento()->getTamanho()->getIDTamanho();
        $enti['Equipamento_Tamanho'] = $entidade->getEquipamento()->getTamanho()->getNome();  
      }

      
      //get posição caso exista
      if ($entidade->getPosicaoPreferida() !== NULL) {
        $enti['IDPosicao'] = $entidade->getPosicaoPreferida()->getIDPosicao();
        $enti['Posicao'] = $entidade->getPosicaoPreferida()->getNome();
      }


      $enti['Estado'] = ($entidade->getEstado() == true ? "Ativo" : "Inativo");
      $enti['EstadoID'] = ($entidade->getEstado() == true ? 1 : 0);



      //$enti['Inscricao'] = $entidade->;
      //$enti['Cromos'] = $entidade->;

      //get varias modalidades do atleta
      foreach ($entidade->getModalidades() as $modalidade) {
        $enti['Modalidade'][] =  $modalidade->getNome();
        $enti['ModalidadeID'][] =  $modalidade->getIDModalidade();
      }

      //get documentos
      $enti['Documentos'] = [];
      $url = 'FILES/atletas/' . $entidade->getIDEntidade();

      foreach ($entidade->getDocumentos() as $doc) {
        $enti['Documentos'][] = array(
          'ID_documento' => $doc->getIDDocumento(),
          'ficheiro' => $doc->getFicheiro(),
          'ficheiro_url' => $url . '/' . $doc->getFicheiro(),
          'descricao' => $doc->getDescricao(),
          'tipo' => $doc->getTipoDocumento()->getDescricao()
        );
      }


      $enti['Epocas'] = [];

      //get modosPagamentoEntidade

      $this->getModosPagamentoEntidade($entidade, $enti['Epocas']);



      //enquadrar atleta num Escalao - segundo a Data de Nascimento
      $epocasRep = $this->getDoctrine()->getRepository('AppBundle:Epoca');
      $epocaAtual =  AtletasController::getEpocaAtual($epocasRep);
      $escaloesRep = $this->getDoctrine()->getRepository('AppBundle:Escalao');

      $enti['DataNasc'] = $entidade->getDataNasc()->format('d-m-Y');
      $DataN = $entidade->getDataNasc();

      //escaloes
      $escs = $escaloesRep->findBy(array('Epoca' => $epocaAtual));

      foreach ($escs as $escalao) {
        $e['DataInicial'] = $escalao->getDataInicial();
        $e['DataFinal'] = $escalao->getDataFinal();

        if ($DataN >= $e['DataInicial'] and $DataN <= $e['DataFinal']) {
          $enti['Escalao'] = $escalao->getNome();
        }
      }

      //Verificar se é Guarda Redes (para efeitos de equipamento)
      if ($entidade->getPosicaoPreferida() !== NULL) {
        $idPosicao = $entidade->getPosicaoPreferida()->getIDPosicao();
        $enti['GR'] = ($idPosicao == $ID_GR ? "SIM" : "NÃO");
      }


      // Get Info 2 Tutores //
      $tutoresRep = $this->getDoctrine()->getRepository('AppBundle:EntidadeREL');
      $Tutores1 = $tutoresRep->findBy(array('ID_Entidade' => $enti['ID']), array('ID_EntidadeRel' => 'ASC'), 1);
      $Tutores2 = $tutoresRep->findBy(array('ID_Entidade' => $enti['ID']), array('ID_EntidadeRel' => 'DESC'), 1);


      foreach ($Tutores1 as $Tutor1) {
        $enti['IDTutor1'] = $Tutor1->getIDEntidadeAssoc()->getIDEntidade();
        $enti['TipoTutor1'] = $Tutor1->getIDEntidadeAssocTipo()->getIDtiporel();
        $enti['TipoTutorNome1'] = $Tutor1->getIDEntidadeAssocTipo()->getNome();
        $enti['NomeTutor1'] = $Tutor1->getIDEntidadeAssoc()->getNome();
        $enti['CCTutor1'] = $Tutor1->getIDEntidadeAssoc()->getCC();
        $enti['NIFTutor1'] = $Tutor1->getIDEntidadeAssoc()->getNIF();
        $enti['TelfTutor1'] = $Tutor1->getIDEntidadeAssoc()->getTelf();
        $enti['TelmTutor1'] = $Tutor1->getIDEntidadeAssoc()->getTelm();
        $enti['EmailTutor1'] = $Tutor1->getIDEntidadeAssoc()->getEmail();
        $enti['Morada_RuaTutor1'] = $Tutor1->getIDEntidadeAssoc()->getMorada()->getRua();
        $enti['Morada_NumeroTutor1'] = $Tutor1->getIDEntidadeAssoc()->getMorada()->getNumero();
        $enti['Morada_AndarTutor1'] = $Tutor1->getIDEntidadeAssoc()->getMorada()->getAndar();
        $enti['Morada_CodPostal4Tutor1'] = $Tutor1->getIDEntidadeAssoc()->getMorada()->getCodPostal4();
        $enti['Morada_CodPostal3Tutor1'] = $Tutor1->getIDEntidadeAssoc()->getMorada()->getCodPostal3();
        $enti['Morada_LocalidadeTutor1'] = $Tutor1->getIDEntidadeAssoc()->getMorada()->getLocalidade();
      }

      if ($Tutores2 !== $Tutores1) {
        foreach ($Tutores2 as $Tutor2) {
          $enti['IDTutor2'] = $Tutor2->getIDEntidadeAssoc()->getIDEntidade();
          $enti['TipoTutor2'] = $Tutor2->getIDEntidadeAssocTipo()->getIDtiporel();
          $enti['TipoTutorNome2'] = $Tutor2->getIDEntidadeAssocTipo()->getNome();
          $enti['NomeTutor2'] = $Tutor2->getIDEntidadeAssoc()->getNome();
          $enti['CCTutor2'] = $Tutor2->getIDEntidadeAssoc()->getCC();
          $enti['NIFTutor2'] = $Tutor2->getIDEntidadeAssoc()->getNIF();
          $enti['TelfTutor2'] = $Tutor2->getIDEntidadeAssoc()->getTelf();
          $enti['TelmTutor2'] = $Tutor2->getIDEntidadeAssoc()->getTelm();
          $enti['EmailTutor2'] = $Tutor2->getIDEntidadeAssoc()->getEmail();
          $enti['Morada_RuaTutor2'] = $Tutor2->getIDEntidadeAssoc()->getMorada()->getRua();
          $enti['Morada_NumeroTutor2'] = $Tutor2->getIDEntidadeAssoc()->getMorada()->getNumero();
          $enti['Morada_AndarTutor2'] = $Tutor2->getIDEntidadeAssoc()->getMorada()->getAndar();
          $enti['Morada_CodPostal4Tutor2'] = $Tutor2->getIDEntidadeAssoc()->getMorada()->getCodPostal4();
          $enti['Morada_CodPostal3Tutor2'] = $Tutor2->getIDEntidadeAssoc()->getMorada()->getCodPostal3();
          $enti['Morada_LocalidadeTutor2'] = $Tutor2->getIDEntidadeAssoc()->getMorada()->getLocalidade();
        }
      }

      $tiposDocRep = $this->getDoctrine()->getRepository('AppBundle:TipoDocumento');
      $tiposDoc = $tiposDocRep->findAll();

      $responseArr['tiposDoc'] = array();
      foreach ($tiposDoc as $tipo) {
        $responseArr['tiposDoc'][] = array('ID_tipodocumento' => $tipo->getIDTipodocumento(), 'descricao' => $tipo->getDescricao());
      }

      // Modalidades - Select para escolha das modalidades ao Editar //
      $modRep = $this->getDoctrine()->getRepository('AppBundle:Modalidade');
      $modalidades = $modRep->findAll();

      $responseArr['modalidades'] = array();

      foreach ($modalidades as $modalidade) {

        $mod = array();
        $mod['IDModalidade'] = $modalidade->getIDModalidade();
        $mod['Nome'] = $modalidade->getNome();

        $responseArr['modalidades'][] = $mod;
      }

      // Posições - Select para escolha da posição preferida ao Editar //
      $posicoesRep = $this->getDoctrine()->getRepository('AppBundle:Posicao');
      $posicoes = $posicoesRep->findAll();

      $responseArr['posicoes'] = array();

      foreach ($posicoes as $posicao) {

        $pos = array();
        $pos['IDPosicao'] = $posicao->getIDPosicao();
        $pos['Nome'] = $posicao->getNome();

        $responseArr['posicoes'][] = $pos;
      }


      // Tamanhos  - Select para escolha do tamanho do equipamento ao Editar //
      $tamanhosRep = $this->getDoctrine()->getRepository('AppBundle:Tamanho');
      $tamanhos = $tamanhosRep->findAll();


      $responseArr['tamanhos'] = array();

      foreach ($tamanhos as $tamanho) {

        $pos = array();
        $pos['IDTamanho'] = $tamanho->getIDTamanho();
        $pos['Nome'] = $tamanho->getNome();

        $responseArr['tamanhos'][] = $pos;
      }



      // Tipo de Relação  - Select para escolha da relação dos tutores ao atleta no Editar //
      $relRep = $this->getDoctrine()->getRepository('AppBundle:TipoREL');
      $relacoes = $relRep->findAll();

      $responseArr['relacoes'] = array();

      foreach ($relacoes as $relacao) {

        $pos = array();
        $pos['IDtiporel'] = $relacao->getIDtiporel();
        $pos['Nome'] = $relacao->getNome();

        $responseArr['relacoes'][] = $pos;
      }

      $responseArr['epocas'] = $this->getEpocas($entidade);

      $responseArr['entidades'] = $enti;
    }

    $response->setData($responseArr);

    return $response;
  }

  /**
   * @Route("/uploadFile", name="uploadFile", options={"expose"=true} )
   * @Method({"POST"})
   */
  public function uploadFile(Request $request)
  {

    $response = new JsonResponse();
    $arrResponse = array();
    $arrResponse['status'] = 'ok';
    $arrResponse['data'] = array();

    $chunkNumber = $request->request->get('_chunkNumber');
    $upload_dir = $this->container->getParameter("upload_dir") . '/atletas';
    $idEntidade = $request->request->get('idEntidade');



    $dir = $upload_dir . '/' . $idEntidade;

    if (!file_exists($dir)) {
      mkdir($dir, 0777, true);        // cria as subpastas
    }


    foreach ($request->files->getIterator() as $key => $val) {
      $fileName = $val->getClientOriginalName();
      $file = $dir . '\\' . $fileName;
      move_uploaded_file($val->getPathName(), $file . '.' . $chunkNumber);
    }

    $chunkSize = $request->request->get('_chunkSize');
    $currentChunkSize = $request->request->get('_currentChunkSize');
    $totalSize = $request->request->get('_totalSize');

    if (($chunkSize != $currentChunkSize) || (($chunkSize * $chunkNumber) >= $totalSize)) {

      $finalFileName = $dir . '/' . $fileName;
      if (file_exists($dir . '/' . $fileName)) {
        $i = 1;
        while (file_exists($dir . '/' . $i . $fileName)) {
          $i = $i + 1;
        }
        $finalFileName = $dir . '/' . $i . $fileName;
      }

      $finalFile = fopen($finalFileName, 'ab');

      for ($i = 0; $i <= $chunkNumber; $i++) {
        $in = fopen($file . '.' . $i, 'rb');
        if ($in) {
          while ($buff = fread($in, 1048)) {
            fwrite($finalFile, $buff);
          }
        }
        if (fclose($in)) {
          unlink($file . '.' . $i);
        }
      }

      fclose($finalFile);

      $newName = 'atleta_' . date('Ymd') . '_' . rand() . '.pdf';

      if (!rename($dir . '/' . $fileName, $dir . '/' . $newName)) {

        $arrResponse['status'] = 'error';
      }

      $arrResponse['data']['nome'] = $newName;
    }

    $response->setData($arrResponse);
    return $response;
  }

  /**
   * @Route("/saveDocumentoAtleta", name="saveDocumentoAtleta", options={"expose"=true} )
   * @Method({"POST"})
   */
  public function saveDocumentoAtleta(Request $request)
  {
    $dados = json_decode($request->getContent(), true);

    $restricoes =  new Collection(array(
      'REF_entidade'      => array(
        new NotBlank(),
        new NotNull(),
        new Type(array('type' => 'numeric'))
      ),
      'REF_tipodocumento' => array(
        new NotBlank(),
        new NotNull(),
        new Type(array('type' => 'numeric'))
      ),
      'descricao'         => array(
        new NotBlank(),
        new NotNull(),
        new Type(array('type' => 'string'))
      ),
      'ficheiro'          => array(
        new NotBlank(),
        new NotNull(),
        new Type(array('type' => 'string'))
      )
    ));

    $errors = $this->container->get('validator')->validate($dados, $restricoes);

    if (count($errors) !== 0) {
      return new JsonResponse(array('status' => 'error', 'errors' => $errors));
    }

    $em = $this->getDoctrine()->getManager();
    $documentosRep = $em->getRepository('AppBundle:DocumentoEntidade');
    $entidadesRep = $em->getRepository('AppBundle:Entidade');
    $tiposDocRep = $em->getRepository('AppBundle:TipoDocumento');

    $entidade = $entidadesRep->findBy(array('ID_Entidade' => $dados['REF_entidade']));
    $tipoDoc = $tiposDocRep->findBy(array('ID_tipodocumento' => $dados['REF_tipodocumento']));

    $documento = new DocumentoEntidade();

    $documento->setEntidade($entidade[0]);
    $documento->setTipoDocumento($tipoDoc[0]);
    $documento->setDescricao($dados['descricao']);
    $documento->setFicheiro($dados['ficheiro']);

    $em->persist($documento);
    $em->flush();

    $url = 'FILES/atletas/' . $dados['REF_entidade'] . '/' . $documento->getFicheiro();

    $aux = array(
      'ID_documento' => $documento->getIDDocumento(),
      'descricao' => $documento->getDescricao(),
      'ficheiro' => $documento->getFicheiro(),
      'ficheiro_url' => $url,
      'tipo' => $tipoDoc[0]->getDescricao()
    );

    return new JsonResponse(array('status' => 'ok', 'documento' => $aux));
  }

  /**
   * @Route("/removerDocumentoAtleta", name="removerDocumentoAtleta", options={"expose"=true} )
   * @Method({"POST"})
   */
  public function removerDocumentoAtleta(Request $request)
  {
    $dados = json_decode($request->getContent(), true);

    $restricoes =  new Collection(array(
      'ID_documento'      => array(
        new NotBlank(),
        new NotNull(),
        new Type(array('type' => 'numeric'))
      ),
      'ficheiro'          => array(
        new NotBlank(),
        new NotNull(),
        new Type(array('type' => 'string'))
      ),
      'ficheiro_url'      => array(),
      'descricao'         => array(),
      'tipo'              => array()
    ));

    $errors = $this->container->get('validator')->validate($dados, $restricoes);

    if (count($errors) !== 0) {

      return new JsonResponse(array('status' => 'error', 'errors' => $errors));
    }

    $em = $this->getDoctrine()->getManager();
    $documentosRep = $em->getRepository('AppBundle:DocumentoEntidade');

    $documento = $documentosRep->findBy(array('ID_documento' => $dados['ID_documento']));

    $upload_dir = $this->container->getParameter("upload_dir") . '/atletas';

    $file = $upload_dir . '/' . $documento[0]->getEntidade()->getIDEntidade() . '/' . $documento[0]->getFicheiro();

    $em->remove($documento[0]);

    $em->flush();

    @unlink($file);

    return new JsonResponse(array('status' => 'ok'));
  }

  /**
   * @Route("/dadosInserirAtleta", name="dadosInserirAtleta", options={"expose"=true})
   */
  public function dadosInserirAtleta()
  {

    $response = new JsonResponse();
    $responseArr = array();
    $responseArr['status'] = 'ok';
    $responseArr['data'] = array();

    // Modalidades - Select para escolha das modalidades ao Editar //
    $modRep = $this->getDoctrine()->getRepository('AppBundle:Modalidade');
    $modalidades = $modRep->findAll();

    $responseArr['modalidades'] = array();

    foreach ($modalidades as $modalidade) {

      $mod = array();
      $mod['IDModalidade'] = $modalidade->getIDModalidade();
      $mod['Nome'] = $modalidade->getNome();

      $responseArr['modalidades'][] = $mod;
    }

    // Posições - Select para escolha da posição preferida ao Editar //
    $posicoesRep = $this->getDoctrine()->getRepository('AppBundle:Posicao');
    $posicoes = $posicoesRep->findAll();

    $responseArr['posicoes'] = array();

    foreach ($posicoes as $posicao) {

      $pos = array();
      $pos['IDPosicao'] = $posicao->getIDPosicao();
      $pos['Nome'] = $posicao->getNome();

      $responseArr['posicoes'][] = $pos;
    }

    // Tamanhos  - Select para escolha do tamanho do equipamento ao Editar //
    $tamanhosRep = $this->getDoctrine()->getRepository('AppBundle:Tamanho');
    $tamanhos = $tamanhosRep->findAll();

    $responseArr['tamanhos'] = array();

    foreach ($tamanhos as $tamanho) {

      $pos = array();
      $pos['IDTamanho'] = $tamanho->getIDTamanho();
      $pos['Nome'] = $tamanho->getNome();

      $responseArr['tamanhos'][] = $pos;
    }

    // Tipo de Relação  - Select para escolha da relação dos tutores ao atleta no Editar //
    $relRep = $this->getDoctrine()->getRepository('AppBundle:TipoREL');
    $relacoes = $relRep->findAll();

    $responseArr['relacoes'] = array();

    foreach ($relacoes as $relacao) {

      $pos = array();
      $pos['IDtiporel'] = $relacao->getIDtiporel();
      $pos['Nome'] = $relacao->getNome();

      $responseArr['relacoes'][] = $pos;
    }

    $response->setData($responseArr);



    return $response;
  }


  /**
   * @Route("/novoAtleta", name="novoAtleta", options={"expose"=true})
   * @Security("has_role('ROLE_ADMIN')")
   */
  public function novoAtleta(Request $request)
  {

    $tipoEntAtleta = 1;
    $tipoEntTutor = 5;

    $dados = json_decode($request->getContent(), true);
    $outrosErros = [];
    $json['errors'] = array();

    $em = $this->getDoctrine()->getManager();

    //get objeto tipo entidade
    $tipoEntRep = $this->getDoctrine()->getRepository('AppBundle:TipoEntidade');
    $selTipoEnt = $tipoEntRep->find($tipoEntAtleta);


    //validação equipamento------------------------------------------------------------------------
    if (isset($dados['Equipamento_Numero']) || isset($dados['Equipamento_TamanhoID']) || isset($dados['Equipamento_Nome'])) {

      if (!isset($dados['Equipamento_Numero']) || !isset($dados['Equipamento_TamanhoID']) || !isset($dados['Equipamento_Nome']) || empty($dados['Equipamento_Numero']) || empty($dados['Equipamento_TamanhoID']) || empty($dados['Equipamento_Nome'])) {
        $outrosErros[] = "Ao preencher o equipamento, preencha todos os respetivos dados.";
        $NovoEquipamento = false;
      } else {
        $NovoEquipamento = new Equipamento;

        //dados a ser inseridos - novo equipamento
        $NovoEquipamento->setNumero(isset($dados['Equipamento_Numero'])  ? $dados['Equipamento_Numero'] : null);
        $NovoEquipamento->setNome(isset($dados['Equipamento_Nome'])  ? $dados['Equipamento_Nome'] : null);
        $NovoEquipamento->setObservacoes(isset($dados['Equipamento_observacoes'])  ? $dados['Equipamento_observacoes'] : null);

        //get objeto tamanho
        $tamanhoRep = $this->getDoctrine()->getRepository('AppBundle:Tamanho');
        $selTamanho = $tamanhoRep->find($dados['Equipamento_TamanhoID']);
        $NovoEquipamento->setTamanho($selTamanho);
      }
    } else {
      $NovoEquipamento = false;
    }

    //-----------------------------------------------------------------------------------------

    //dados a ser inseridos - nova entidade
    $atleta = new Entidade();
    $atleta->setTipoEnt($selTipoEnt);
    $atleta->setEstado(isset($dados['EstadoID'])  ? $dados['EstadoID'] : null);
    $atleta->setUltimaAtualizacao(new \DateTime("now"));
    $atleta->setNome(isset($dados['Nome']) ? $dados['Nome'] : null);
    $atleta->setPais(isset($dados['Pais'])  ? $dados['Pais'] : null);
    $atleta->setNaturalidade(isset($dados['Naturalidade'])  ? $dados['Naturalidade'] : null);
    $atleta->setDataNasc(isset($dados['DataNasc'])  ? new \DateTime($dados['DataNasc']) : null);

    $atleta->setCC(isset($dados['CC'])  ? $dados['CC'] : null);
    $atleta->setNIF(isset($dados['NIF'])  ? $dados['NIF'] : null);

    $atleta->setHabilitacoes(isset($dados['Habilitacoes'])  ? $dados['Habilitacoes'] : null);
    $atleta->setProfissao(isset($dados['Profissao'])  ? $dados['Profissao'] : null);

    $atleta->setTelf(isset($dados['Telf'])  ? $dados['Telf'] : null);
    $atleta->setTelm(isset($dados['Telm'])  ? $dados['Telm'] : null);
    $atleta->setEmail(isset($dados['Email'])  ? $dados['Email'] : null);

    $atleta->setFotoInscricao(isset($dados['FotoInscricao'])  ? $dados['FotoInscricao'] : 'user.png');

    $moradaAtleta = new Morada;
    $moradaAtleta->setRua(isset($dados['Morada_Rua'])  ? $dados['Morada_Rua'] : null);
    $moradaAtleta->setNumero(isset($dados['Morada_Numero'])  ? $dados['Morada_Numero'] : null);
    $moradaAtleta->setAndar(isset($dados['Morada_Andar'])  ? $dados['Morada_Andar'] : null);
    $moradaAtleta->setCodPostal4(isset($dados['Morada_CodPostal4']) ? $dados['Morada_CodPostal4'] : null);
    $moradaAtleta->setCodPostal3(isset($dados['Morada_CodPostal3']) ? $dados['Morada_CodPostal3'] : null);
    $moradaAtleta->setLocalidade(isset($dados['Morada_Localidade']) ? $dados['Morada_Localidade'] : null);

    $atleta->setMorada($moradaAtleta);

    $atleta->setNLicenca(isset($dados['NLicenca'])  ? $dados['NLicenca'] : null);

    //get e set objeto posição preferida
    if (isset($dados['IDPosicao'])) {
      $posRep = $this->getDoctrine()->getRepository('AppBundle:Posicao');
      $selPosicao = $posRep->find($dados['IDPosicao']);
      $atleta->setPosicaoPreferida($selPosicao);
    }

    //inserir modalidade principal e secundária
    $modalsRep = $this->getDoctrine()->getRepository('AppBundle:Modalidade')->find(1);
    $atleta->addModalidade($modalsRep);



    if (!$dados['ModalidadeID'][1] == null) {
      $selModSecundaria = $dados['ModalidadeID'][1];
      $modalsRep = $this->getDoctrine()->getRepository('AppBundle:Modalidade')->find($selModSecundaria);
      $atleta->addModalidade($modalsRep);
    }


    $atleta->setGSanguineo(isset($dados['GSanguineo'])  ? $dados['GSanguineo'] : null);
    $atleta->setDoencas(isset($dados['Doencas'])  ? $dados['Doencas'] : null);

    if ($NovoEquipamento) {
      $atleta->setEquipamento(isset($dados['Equipamento_Nome'])  ? $NovoEquipamento : null);
    }

    //TUTORES - INSERIR-------------------------------
    $tutor1 = FALSE;
    if (isset($dados['NomeTutor1']) || $dados['NomeTutor1'] != "") {

      $tutor1 = new Entidade();
      $moradaT1 = new Morada();

      $tutorTipo = $this->getDoctrine()->getRepository('AppBundle:TipoEntidade')->find($tipoEntTutor);
      $tutor1->setTipoEnt($tutorTipo);
      $tutor1->setEstado(1);
      $tutor1->setUltimaAtualizacao(new \DateTime("now"));
      $tutor1->setNome(isset($dados['NomeTutor1']) ? $dados['NomeTutor1'] : null);
      $tutor1->setDataNasc(new \DateTime("yesterday"));

      $tutor1->setCC(isset($dados['CCTutor1'])  ? $dados['CCTutor1'] : null);
      $tutor1->setNIF(isset($dados['NIFTutor1'])  ? $dados['NIFTutor1'] : null);

      $tutor1->setTelf(isset($dados['TelfTutor1'])  ? $dados['TelfTutor1'] : null);
      $tutor1->setTelm(isset($dados['TelmTutor1'])  ? $dados['TelmTutor1'] : null);
      $tutor1->setEmail(isset($dados['EmailTutor1'])  ? $dados['EmailTutor1'] : null);

      $tutor1->setFotoInscricao(isset($dados['FotoInscricaoTutor1'])  ? $dados['FotoInscricaoTutor1'] : 'user.png');

      $moradaT1->setRua(isset($dados['Morada_RuaTutor1'])  ? $dados['Morada_RuaTutor1'] : null);
      $moradaT1->setNumero(isset($dados['Morada_NumeroTutor1'])  ? $dados['Morada_NumeroTutor1'] : null);
      $moradaT1->setAndar(isset($dados['Morada_AndarTutor1'])  ? $dados['Morada_AndarTutor1'] : null);
      $moradaT1->setCodPostal4(isset($dados['Morada_CodPostal4Tutor1']) ? $dados['Morada_CodPostal4Tutor1'] : null);
      $moradaT1->setCodPostal3(isset($dados['Morada_CodPostal3Tutor1']) ? $dados['Morada_CodPostal3Tutor1'] : null);
      $moradaT1->setLocalidade(isset($dados['Morada_LocalidadeTutor1']) ? $dados['Morada_LocalidadeTutor1'] : null);

      if (!$moradaT1 && $moradaAtleta) {
        $tutor1->setMorada($moradaAtleta);
      } else {
        $tutor1->setMorada($moradaT1);
      }

      $relacaoTutor1 = new EntidadeREL();
      $relacaoTutor1->setIDEntidade($atleta);
      $relacaoTutor1->setIDEntidadeAssoc($tutor1);
      $relacaoGet = $em->getRepository('AppBundle:TipoREL')->find($dados['TipoTutor1']);
      $relacaoTutor1->setIDEntidadeAssocTipo($relacaoGet);
    }


    //tutor2
    if ($dados['ExisteT2']) {

      $tutor2 = new Entidade();
      $moradaT2 = new Morada();

      $tutorTipo = $this->getDoctrine()->getRepository('AppBundle:TipoEntidade')->find($tipoEntTutor);
      $tutor2->setTipoEnt($tutorTipo);
      $tutor2->setEstado(1);
      $tutor2->setUltimaAtualizacao(new \DateTime("now"));
      $tutor2->setNome(isset($dados['NomeTutor2']) ? $dados['NomeTutor2'] : null);
      $tutor2->setDataNasc(new \DateTime("yesterday"));

      $tutor2->setCC(isset($dados['CCTutor2'])  ? $dados['CCTutor2'] : null);
      $tutor2->setNIF(isset($dados['NIFTutor2'])  ? $dados['NIFTutor2'] : null);

      $tutor2->setTelf(isset($dados['TelfTutor2'])  ? $dados['TelfTutor2'] : null);
      $tutor2->setTelm(isset($dados['TelmTutor2'])  ? $dados['TelmTutor2'] : null);
      $tutor2->setEmail(isset($dados['EmailTutor2'])  ? $dados['EmailTutor2'] : null);

      $tutor2->setFotoInscricao(isset($dados['FotoInscricaoTutor2'])  ? $dados['FotoInscricaoTutor2'] : 'user.png');

      $moradaT2->setRua(isset($dados['Morada_RuaTutor2'])  ? $dados['Morada_RuaTutor2'] : null);
      $moradaT2->setNumero(isset($dados['Morada_NumeroTutor2'])  ? $dados['Morada_NumeroTutor2'] : null);
      $moradaT2->setAndar(isset($dados['Morada_AndarTutor2'])  ? $dados['Morada_AndarTutor2'] : null);
      $moradaT2->setCodPostal4(isset($dados['Morada_CodPostal4Tutor2']) ? $dados['Morada_CodPostal4Tutor2'] : null);
      $moradaT2->setCodPostal3(isset($dados['Morada_CodPostal3Tutor2']) ? $dados['Morada_CodPostal3Tutor2'] : null);
      $moradaT2->setLocalidade(isset($dados['Morada_LocalidadeTutor2']) ? $dados['Morada_LocalidadeTutor2'] : null);

      if (!$moradaT2 && $moradaAtleta) {
        $tutor2->setMorada($moradaAtleta);
      } else {
        $tutor2->setMorada($moradaT2);
      }

      $relacaoTutor2 = new EntidadeREL();
      $relacaoTutor2->setIDEntidade($atleta);
      $relacaoTutor2->setIDEntidadeAssoc($tutor2);
      $relacaoGet = $em->getRepository('AppBundle:TipoREL')->find($dados['TipoTutor2']);
      $relacaoTutor2->setIDEntidadeAssocTipo($relacaoGet);
    } else {
      $tutor2 = false;
      $moradaT2 = false;
    }

    //------------------------------------------------

    //-----------------------------------------------------------------------------------------

    //Validações---------------
    //Validação NIF---------------------------------------

    $erroRecebido = AtletasController::validarNIF($dados['NIF']);

    if ($erroRecebido != null) {
      $outrosErros[] = $erroRecebido;
    }

    if ($tutor1) {
      $erroRecebido = AtletasController::validarNIF($dados['NIFTutor1']);
      if ($erroRecebido != null) {
        $outrosErros[] = $erroRecebido;
      }
    }

    if (isset($dados['NIFTutor2'])) {
      $erroRecebido = AtletasController::validarNIF($dados['NIFTutor2']);
      if ($erroRecebido != null) {
        $outrosErros[] = $erroRecebido;
      }
    }

    $errorsT1 = [];
    $errorsMoradaT1 = [];


    //validators
    $validator = $this->get('validator');
    $errors = $validator->validate($atleta);
    $errors3 = $validator->validate($moradaAtleta);
    if ($tutor1) {
      $errorsT1 = $validator->validate($tutor1);
      $errorsMoradaT1 = $validator->validate($moradaT1);
    }



    if (isset($dados['NomeTutor2'])) {
      $errorsMoradaT2 = $validator->validate($moradaT2);
    } else {
      $errorsMoradaT2 = [];
    }

    if ($NovoEquipamento !== false) {
      $errors2 = $validator->validate($NovoEquipamento);
    } else {
      $errors2 = [];
    }

    if ((count($errors) > 0) or (!empty($outrosErros)) or (count($errors2) > 0) or (count($errors3) > 0) or (count($errorsT1) > 0) or (count($errorsMoradaT1) > 0) or (count($errorsMoradaT2) > 0)) {

      foreach ($errors as $key => $value) {
        //devolução dos erros
        $errors = (string) $value->getMessage();
        $json['errors'][] = $errors;
      }

      foreach ($errors2 as $key => $value) {
        //devolução dos erros
        $errors2 = (string) $value->getMessage();
        $json['errors'][] = $errors2;
      }

      foreach ($errors3 as $key => $value) {
        //devolução dos erros
        $errors3 = (string) $value->getMessage();
        $json['errors'][] = $errors3;
      }

      foreach ($errorsT1 as $key => $value) {
        //devolução dos erros
        $errorsT1 = (string) $value->getMessage();
        $json['errors'][] = $errorsT1;
      }

      foreach ($errorsMoradaT1 as $key => $value) {
        //devolução dos erros
        $errorsMoradaT1 = (string) $value->getMessage();
        $json['errors'][] = $errorsMoradaT1;
      }

      foreach ($errorsMoradaT2 as $key => $value) {
        //devolução dos erros
        $errorsMoradaT2 = (string) $value->getMessage();
        $json['errors'][] = $errorsMoradaT2;
      }

      if (!empty($outrosErros)) {
        $json['errors'] = array_merge($json['errors'], $outrosErros);
      }

      $json['status'] = 'error';
    } else {
      //inserir na base de dados

      if ($NovoEquipamento != false) {
        $em->persist($NovoEquipamento);
      }

      $em->persist($moradaAtleta);

      if ($moradaT1) {
        $em->persist($moradaT1);
      }

      if ($moradaT2) {
        $em->persist($moradaT2);
      }

      $em->persist($atleta);

      if ($tutor1) {
        $em->persist($tutor1);
        $em->persist($relacaoTutor1);
      }

      if ($tutor2) {
        $em->persist($tutor2);
        $em->persist($relacaoTutor2);
      }

      $em->flush();

      $json['status'] = 'ok';
    }



    //json response
    $dados['UltimaAtualizacao'] = new \DateTime("now");
    $json['dados'] = $dados;

    return new JsonResponse($json);
  }


  /**
   * @Route("/editarAtleta", name="editarAtleta", options={"expose"=true})
   * @Security("has_role('ROLE_ADMIN')")
   */
  public function editarAtleta(Request $request)
  {

    $dados = json_decode($request->getContent(), true);
    $outrosErros = [];

    $tipoEntTutor = 5;

    $json['errors'] = array();

    //get objeto a ser editado
    $em = $this->getDoctrine()->getManager();
    $atleta = $em->getRepository('AppBundle:Entidade')->find($dados['ID']);

    //validação equipamento------------------------------------------------------------------------
    if (isset($dados['Equipamento_Numero']) || isset($dados['Equipamento_TamanhoID']) || isset($dados['Equipamento_Nome'])) {

      if (!isset($dados['Equipamento_Numero']) || !isset($dados['Equipamento_TamanhoID']) || !isset($dados['Equipamento_Nome']) || empty($dados['Equipamento_Numero']) || empty($dados['Equipamento_TamanhoID']) || empty($dados['Equipamento_Nome'])) {
        $outrosErros[] = "Ao preencher o equipamento, preencha todos os respetivos dados.";
        $NovoEquipamento = false;
      } else {

        if ($atleta->getEquipamento()) {
          $NovoEquipamento = $atleta->getEquipamento();
        } else {
          $NovoEquipamento = new Equipamento();
        }

        //dados a ser inseridos - novo equipamento
        $NovoEquipamento->setNumero(isset($dados['Equipamento_Numero'])  ? $dados['Equipamento_Numero'] : null);
        $NovoEquipamento->setNome(isset($dados['Equipamento_Nome'])  ? $dados['Equipamento_Nome'] : null);
        $NovoEquipamento->setObservacoes(isset($dados['Equipamento_observacoes'])  ? $dados['Equipamento_observacoes'] : null);

        //get objeto tamanho
        $tamanhoRep = $this->getDoctrine()->getRepository('AppBundle:Tamanho');
        $selTamanho = $tamanhoRep->find($dados['Equipamento_TamanhoID']);
        $NovoEquipamento->setTamanho($selTamanho);
      }
    } else {
      $NovoEquipamento = false;

      $equipamentoAtleta = $atleta->getEquipamento();

      if ($equipamentoAtleta) {
        $atleta->setEquipamento(null);
        $em->remove($equipamentoAtleta);
      }
    }

    //-----------------------------------------------------------------------------------------

    //dados a ser inseridos
    $atleta->setEstado(isset($dados['EstadoID'])  ? $dados['EstadoID'] : 0);
    $atleta->setUltimaAtualizacao(new \DateTime("now"));
    $atleta->setNome(isset($dados['Nome']) ? $dados['Nome'] : null);
    $atleta->setPais(isset($dados['Pais'])  ? $dados['Pais'] : null);
    $atleta->setNaturalidade(isset($dados['Naturalidade'])  ? $dados['Naturalidade'] : null);
    $atleta->setDataNasc(isset($dados['DataNasc'])  ? new \DateTime($dados['DataNasc']) : null);

    $atleta->setCC(isset($dados['CC'])  ? $dados['CC'] : null);
    $atleta->setNIF(isset($dados['NIF'])  ? $dados['NIF'] : null);

    $atleta->setHabilitacoes(isset($dados['Habilitacoes'])  ? $dados['Habilitacoes'] : null);
    $atleta->setProfissao(isset($dados['Profissao'])  ? $dados['Profissao'] : null);

    $atleta->setTelf(isset($dados['Telf'])  ? $dados['Telf'] : null);
    $atleta->setTelm(isset($dados['Telm'])  ? $dados['Telm'] : null);
    $atleta->setEmail(isset($dados['Email'])  ? $dados['Email'] : null);

    $moradaAtleta = $atleta->getMorada();
    $moradaAtleta->setRua(isset($dados['Morada_Rua'])  ? $dados['Morada_Rua'] : null);
    $moradaAtleta->setNumero(isset($dados['Morada_Numero'])  ? $dados['Morada_Numero'] : null);
    $moradaAtleta->setAndar(isset($dados['Morada_Andar'])  ? $dados['Morada_Andar'] : null);
    $moradaAtleta->setCodPostal4(isset($dados['Morada_CodPostal4']) ? $dados['Morada_CodPostal4'] : null);
    $moradaAtleta->setCodPostal3(isset($dados['Morada_CodPostal3']) ? $dados['Morada_CodPostal3'] : null);
    $moradaAtleta->setLocalidade(isset($dados['Morada_Localidade']) ? $dados['Morada_Localidade'] : null);
    $atleta->setMorada($moradaAtleta);

    $atleta->setNLicenca(isset($dados['NLicenca'])  ? $dados['NLicenca'] : null);

    //retirar modalidades inseridas anteriormente
    $modalidadesALLRep = $this->getDoctrine()->getRepository('AppBundle:Modalidade')->findAll();

    foreach ($modalidadesALLRep as $modSingle) {
      try {
        $atleta->removeModalidade($modSingle);
      } catch (Exception $ex) {
        var_dump($ex);
        die();
      }
    }

    //inserir modalidade principal e secundária
    $modalsRep = $this->getDoctrine()->getRepository('AppBundle:Modalidade')->find(1);
    $atleta->addModalidade($modalsRep);

    if (!$dados['ModalidadeID'][1] == null) {
      $selModSecundaria = $dados['ModalidadeID'][1];
      $modalsRep = $this->getDoctrine()->getRepository('AppBundle:Modalidade')->find($selModSecundaria);
      $atleta->addModalidade($modalsRep);
    }

    if ($NovoEquipamento) {
      $atleta->setEquipamento($NovoEquipamento);
    }

    //get e set objeto posição preferida
    if (isset($dados['IDPosicao'])) {
      $posRep = $this->getDoctrine()->getRepository('AppBundle:Posicao');
      $selPosicao = $posRep->find($dados['IDPosicao']);
      $atleta->setPosicaoPreferida($selPosicao);
    }


    $atleta->setGSanguineo(isset($dados['GSanguineo'])  ? $dados['GSanguineo'] : null);
    $atleta->setDoencas(isset($dados['Doencas'])  ? $dados['Doencas'] : null);


    //TUTORES - EDITAR-------------------------------
    $tutor1 = FALSE;
    $tutoresRep = $this->getDoctrine()->getRepository('AppBundle:EntidadeREL');

    if (isset($dados['NomeTutor1']) && $dados['NomeTutor1'] !== "") {
      $newTutor1 = FALSE;

      if (isset($dados['IDTutor1'])) {
        $tutor1 = $em->getRepository('AppBundle:Entidade')->find($dados['IDTutor1']);
        $moradaT1 = $tutor1->getMorada();
      } else {
        $newTutor1 = TRUE;
        $tutor1 = new Entidade();
        $moradaT1 = new Morada();
      }

      $tutorTipo = $this->getDoctrine()->getRepository('AppBundle:TipoEntidade')->find($tipoEntTutor);
      $tutor1->setTipoEnt($tutorTipo);

      $tutor1->setEstado(1);
      $tutor1->setUltimaAtualizacao(new \DateTime("now"));
      $tutor1->setNome(isset($dados['NomeTutor1']) ? $dados['NomeTutor1'] : null);
      $tutor1->setDataNasc(new \DateTime("yesterday"));

      $tutor1->setCC(isset($dados['CCTutor1'])  ? $dados['CCTutor1'] : null);
      $tutor1->setNIF(isset($dados['NIFTutor1'])  ? $dados['NIFTutor1'] : null);

      $tutor1->setTelf(isset($dados['TelfTutor1'])  ? $dados['TelfTutor1'] : null);
      $tutor1->setTelm(isset($dados['TelmTutor1'])  ? $dados['TelmTutor1'] : null);
      $tutor1->setEmail(isset($dados['EmailTutor1'])  ? $dados['EmailTutor1'] : null);

      $tutor1->setFotoInscricao(isset($dados['FotoInscricaoTutor1'])  ? $dados['FotoInscricaoTutor1'] : 'user.png');

      $moradaT1->setRua(isset($dados['Morada_RuaTutor1'])  ? $dados['Morada_RuaTutor1'] : null);
      $moradaT1->setNumero(isset($dados['Morada_NumeroTutor1'])  ? $dados['Morada_NumeroTutor1'] : null);
      $moradaT1->setAndar(isset($dados['Morada_AndarTutor1'])  ? $dados['Morada_AndarTutor1'] : null);
      $moradaT1->setCodPostal4(isset($dados['Morada_CodPostal4Tutor1']) ? $dados['Morada_CodPostal4Tutor1'] : null);
      $moradaT1->setCodPostal3(isset($dados['Morada_CodPostal3Tutor1']) ? $dados['Morada_CodPostal3Tutor1'] : null);
      $moradaT1->setLocalidade(isset($dados['Morada_LocalidadeTutor1']) ? $dados['Morada_LocalidadeTutor1'] : null);

      if ($moradaT1 == $moradaAtleta) {
        $tutor1->setMorada($moradaAtleta);
      } else {
        $tutor1->setMorada($moradaT1);
      }

      if ($newTutor1 && $tutor1) {

        $relacaoTutor1 = new EntidadeREL();
        $relacaoTutor1->setIDEntidade($atleta);
        $relacaoTutor1->setIDEntidadeAssoc($tutor1);
        $relacaoGet = $em->getRepository('AppBundle:TipoREL')->find($dados['TipoTutor1']);
        $relacaoTutor1->setIDEntidadeAssocTipo($relacaoGet);

        $em->persist($tutor1);
        $em->persist($relacaoTutor1);

        if ($moradaT1 != $moradaAtleta) {
          $em->persist($moradaT1);
        }
      }
    } else {
      $Tutores1 = $tutoresRep->findBy(array('ID_Entidade' => $dados['ID']), array('ID_EntidadeRel' => 'ASC'), 1);

      if ($Tutores1) {


        $em->remove($Tutores1[0]);
      }
    }


    $tutor2new = FALSE;
    //tutor2--------------
    if ($dados['ExisteT2']) {

      if (isset($dados['IDTutor2'])) {
        $tutor2 = $em->getRepository('AppBundle:Entidade')->find($dados['IDTutor2']);
        $moradaT2 = $tutor2->getMorada();
      } else {
        $tutor2 = new Entidade();
        $moradaT2 = new Morada();
        $tutor2new = TRUE;
      }

      $tutorTipo = $this->getDoctrine()->getRepository('AppBundle:TipoEntidade')->find($tipoEntTutor);
      $tutor2->setTipoEnt($tutorTipo);
      $tutor2->setEstado(1);
      $tutor2->setUltimaAtualizacao(new \DateTime("now"));

      if ($dados['T2Staff']) {

        $StaffDadosT2 = $em->getRepository('AppBundle:Entidade')->findBy(array('CC' => $dados['CCTutor2']));

        if ($StaffDadosT2) {

          foreach ($StaffDadosT2 as $StaffDados) {
            $findStaff = $em->getRepository('AppBundle:Entidade')->find($StaffDados->getIDEntidade());
          }

          $tutor2 = $findStaff;
          $moradaT2 = false;
        } else {
          $outrosErros[] = 'Não existe Staff com o CC indicado!';
        }
      } else {

        $tutor2->setNome(isset($dados['NomeTutor2']) ? $dados['NomeTutor2'] : null);
        $tutor2->setDataNasc(new \DateTime("yesterday"));

        $tutor2->setCC(isset($dados['CCTutor2'])  ? $dados['CCTutor2'] : null);
        $tutor2->setNIF(isset($dados['NIFTutor2'])  ? $dados['NIFTutor2'] : null);

        $tutor2->setTelf(isset($dados['TelfTutor2'])  ? $dados['TelfTutor2'] : null);
        $tutor2->setTelm(isset($dados['TelmTutor2'])  ? $dados['TelmTutor2'] : null);
        $tutor2->setEmail(isset($dados['EmailTutor2'])  ? $dados['EmailTutor2'] : null);

        $tutor2->setFotoInscricao(isset($dados['FotoInscricaoTutor2'])  ? $dados['FotoInscricaoTutor2'] : 'user.png');

        $moradaT2->setRua(isset($dados['Morada_RuaTutor2'])  ? $dados['Morada_RuaTutor2'] : null);
        $moradaT2->setNumero(isset($dados['Morada_NumeroTutor2'])  ? $dados['Morada_NumeroTutor2'] : null);
        $moradaT2->setAndar(isset($dados['Morada_AndarTutor2'])  ? $dados['Morada_AndarTutor2'] : null);
        $moradaT2->setCodPostal4(isset($dados['Morada_CodPostal4Tutor2']) ? $dados['Morada_CodPostal4Tutor2'] : null);
        $moradaT2->setCodPostal3(isset($dados['Morada_CodPostal3Tutor2']) ? $dados['Morada_CodPostal3Tutor2'] : null);
        $moradaT2->setLocalidade(isset($dados['Morada_LocalidadeTutor2']) ? $dados['Morada_LocalidadeTutor2'] : null);

        if (!$moradaT2 && $moradaAtleta) {
          $tutor2->setMorada($moradaAtleta);
        } else {
          $tutor2->setMorada($moradaT2);
        }
      }

      $relacaoTutor2 = new EntidadeREL();
      $relacaoTutor2->setIDEntidade($atleta);
      $relacaoTutor2->setIDEntidadeAssoc($tutor2);
      $relacaoGet = $em->getRepository('AppBundle:TipoREL')->find($dados['TipoTutor2']);
      $relacaoTutor2->setIDEntidadeAssocTipo($relacaoGet);
    } else {
      $tutor2 = false;
      $moradaT2 = false;

      $Tutores2 = $tutoresRep->findBy(array('ID_Entidade' => $dados['ID']), array('ID_EntidadeRel' => 'DESC'), 1);
      if ($Tutores2) {
        $em->remove($Tutores2[0]);
      }
    }


    //------------------------------------------------
    //VALIDAÇÕES---------------
    //Validação NIF---------------------------------------
    $erroRecebido = AtletasController::validarNIF($dados['NIF']);

    if ($erroRecebido != null) {
      $outrosErros[] = $erroRecebido;
    }

    if (isset($dados['NIFTutor1']) && strlen('NIFTutor1') > 0) {
      $erroRecebido = AtletasController::validarNIF($dados['NIFTutor1']);
      if ($erroRecebido != null) {
        $outrosErros[] = $erroRecebido;
      }
    }

    if ($dados['ExisteT2'] == true && $dados['T2Staff'] == false && isset($dados['NIFTutor2']) && strlen('NIFTutor2') > 0) {
      $erroRecebido = AtletasController::validarNIF($dados['NIFTutor2']);
      if ($erroRecebido != null) {
        $outrosErros[] = $erroRecebido;
      }
    }

    //validators
    $validator = $this->get('validator');
    $errors = $validator->validate($atleta);
    $errors3 = $validator->validate($moradaAtleta);

    $errorsT1 = [];
    $errorsMoradaT1 = [];

    if ($tutor1) {
      $errorsT1 = $validator->validate($tutor1);
      $errorsMoradaT1 = $validator->validate($moradaT1);
    }



    if ($moradaT2) {
      $errorsMoradaT2 = $validator->validate($moradaT2);
    } else {
      $errorsMoradaT2 = [];
    }

    if ($tutor2) {
      $errorsT2 = $validator->validate($tutor2);
    } else {
      $errorsT2 = [];
    }

    if ($NovoEquipamento) {
      $errors2 = $validator->validate($NovoEquipamento);
    } else {
      $errors2 = [];
    }


    if ((count($errors) > 0) or (!empty($outrosErros)) or (count($errors2) > 0) or (count($errors3) > 0) or (count($errorsT1) > 0) or (count($errorsT2) > 0) or (count($errorsMoradaT1) > 0) or (count($errorsMoradaT2) > 0)) {

      foreach ($errors as $key => $value) {
        //devolução dos erros
        $errors = (string) $value->getMessage();
        $json['errors'][] = $errors;
      }

      foreach ($errors2 as $key => $value) {
        //devolução dos erros
        $errors2 = (string) $value->getMessage();
        $json['errors'][] = $errors2;
      }

      foreach ($errors3 as $key => $value) {
        //devolução dos erros
        $errors3 = (string) $value->getMessage();
        $json['errors'][] = $errors3;
      }

      if ($tutor1) {
        foreach ($errorsT1 as $key => $value) {
          //devolução dos erros
          $errorsT1 = (string) $value->getMessage();
          $json['errors'][] = $errorsT1;
        }
      }

      foreach ($errorsT2 as $key => $value) {
        //devolução dos erros
        $errorsT2 = (string) $value->getMessage();
        $json['errors'][] = $errorsT2;
      }

      foreach ($errorsMoradaT1 as $key => $value) {
        //devolução dos erros
        $errorsMoradaT1 = (string) $value->getMessage();
        $json['errors'][] = $errorsMoradaT1;
      }

      foreach ($errorsMoradaT2 as $key => $value) {
        //devolução dos erros
        $errorsMoradaT2 = (string) $value->getMessage();
        $json['errors'][] = $errorsMoradaT2;
      }

      if (!empty($outrosErros)) {
        $json['errors'] = array_merge($json['errors'], $outrosErros);
      }

      $json['status'] = 'error';
    } else {

      if ($NovoEquipamento) {
        $em->persist($NovoEquipamento);
      }

      if ($tutor2) {
        $em->persist($tutor2);
        $em->persist($relacaoTutor2);
        if ($moradaT2) {
          $em->persist($moradaT2);
        }
      }

      $em->flush();

      $json['status'] = 'ok';
    }



    //json response
    $dados['UltimaAtualizacao'] = new \DateTime("now");
    $json['dados'] = $dados;

    return new JsonResponse($json);
  }



  /**
   * @Route("/apagarAtleta", name="deleteAtleta", options={"expose"=true})
   * @Security("has_role('ROLE_ADMIN')")
   */
  public function deleteAtleta(Request $request)
  {

    $dados = json_decode($request->getContent(), true);

    $em = $this->getDoctrine()->getManager();

    $entidade = $em->getRepository('AppBundle:Entidade')->find($dados['ID']);

    $em->remove($entidade);

    $em->flush();

    //json response
    $json['dados'] = $dados;
    $json['status'] = 'ok';

    return new JsonResponse($json);
  }

  /**
   * @Route("/associarModoPagamentoAtleta", name="associarModoPagamentoAtleta", options={"expose"=true})
   * @Method({"POST"})
   */
  public function associarModoPagamentoAtleta(Request $request)
  {
    $dados = json_decode($request->getContent(), true);

    if (!isset($dados['entidade']) || !$dados['entidade'] || !isset($dados['modo']) || !$dados['modo'] || !isset($dados['epoca']) || !$dados['epoca']) {
      return new JsonResponse(['status' => 'error', 'errors' => 'missing parameters']);
    }

    $em = $this->getDoctrine()->getManager();

    $entidade = $em->getRepository('AppBundle:Entidade')->find($dados['entidade']);
    $epoca = $em->getRepository('AppBundle:Epoca')->find($dados['epoca']);
    $modoPagamento = $em->getRepository('AppBundle:ModoPagamento')->find($dados['modo']);

    $mpe = $this->getModoPagamentoEntidadeFromEntidade($entidade, $dados['modo']);

    if (!$mpe) {
      //criar modo pagamento entidade
      $mpe = new ModoPagamentoEntidade();
      $mpe->setEntidade($entidade);
      $mpe->setEpoca($epoca);
      $mpe->setModoPagamento($modoPagamento);
      $mpe->setDescricao($modoPagamento->getDescricao());
    }

    $mpe->setActivo(true);
    $em->persist($mpe);



    //ir buscar os pagamentos do modoPagamento
    //criar pagamentosEntidade a partir desses pagamentos
    foreach ($modoPagamento->getPagamentos() as $pagamento) {

      $pe = $this->getPagamentoEntidadeFromMPE($mpe, $pagamento->getIDPagamento());

      if (!$pe) {
        $pe = new PagamentoEntidade();
        $pe->setModoPagamentoEntidade($mpe);
        $pe->setPagamento($pagamento);
        $pe->setValor($pagamento->getValor());
        $pe->setValorPosLimite($pagamento->getValorPosLimite());
        $pe->setDescricao($pagamento->getDescricao());
        $pe->setBenificio($pagamento->getBenificio());
        $pe->setDescricaoBenificio($pagamento->getDescricaoBenificio());
        $pe->setDataLimite($pagamento->getDataLimite());

        $em->persist($pe);
        $mpe->addPagamento($pe);
      }
    }

    $em->flush();

    $epocas = [];
    $this->getModosPagamentoEntidade($entidade, $epocas);

    return new JsonResponse(['status' => 'ok', 'epocas' => $epocas]);
  }

  /**
   * @Route("/efetuarPagamentoAtleta", name="efetuarPagamentoAtleta", options={"expose"=true})
   * @Method({"POST"})
   */
  public function efetuarPagamentoAtleta(Request $request)
  {

    $dados = json_decode($request->getContent(), true);

    if (!isset($dados['entidade']) || !$dados['entidade'] || !isset($dados['modoPE']) || !$dados['modoPE'] || !isset($dados['pagamento']) || !$dados['pagamento']) {
      return new JsonResponse(['status' => 'error', 'errors' => 'missing parameters']);
    }

    $em = $this->getDoctrine()->getManager();

    $entidade = $em->getRepository('AppBundle:Entidade')->find($dados['entidade']);

    $mpe = $this->getModoPagamentoFromEntidade($entidade, $dados['modoPE']);

    if (!$mpe) {
      return new JsonResponse(['status' => 'error', 'errors' => 'missing modo pagamento entidade']);
    }

    $pagamento = $this->getPagamentoFromMPE($mpe, $dados['pagamento']);

    if (!$pagamento) {
      return new JsonResponse(['status' => 'error', 'errors' => 'missing pagamento entidade']);
    }

    $pagamento->setPago(true);

    $em->persist($pagamento);
    $em->flush();

    return new JsonResponse(['status' => 'ok']);
  }

  /**
   * @Route("/anularPagamentoAtleta", name="anularPagamentoAtleta", options={"expose"=true})
   * @Method({"POST"})
   */
  public function anularPagamentoAtleta(Request $request)
  {
    $dados = json_decode($request->getContent(), true);

    if (!isset($dados['entidade']) || !$dados['entidade'] || !isset($dados['modoPE']) || !$dados['modoPE'] || !isset($dados['pagamento']) || !$dados['pagamento']) {
      return new JsonResponse(['status' => 'error', 'errors' => 'missing parameters']);
    }

    $em = $this->getDoctrine()->getManager();

    $entidade = $em->getRepository('AppBundle:Entidade')->find($dados['entidade']);

    $mpe = $this->getModoPagamentoFromEntidade($entidade, $dados['modoPE']);

    if (!$mpe) {
      return new JsonResponse(['status' => 'error', 'errors' => 'missing modo pagamento entidade']);
    }

    $pagamento = $this->getPagamentoFromMPE($mpe, $dados['pagamento']);

    if (!$pagamento) {
      return new JsonResponse(['status' => 'error', 'errors' => 'missing pagamento entidade']);
    }

    $pagamento->setPago(false);

    $em->persist($pagamento);
    $em->flush();

    return new JsonResponse(['status' => 'ok']);
  }


  /**
   * @Route("/desativarModoPagamentoAtleta", name="desativarModoPagamentoAtleta", options={"expose"=true})
   * @Method({"POST"})
   */
  public function desativarModoPagamentoAtleta(Request $request)
  {
    $dados = json_decode($request->getContent(), true);

    if (!isset($dados['entidade']) || !$dados['entidade'] || !isset($dados['modoPE']) || !$dados['modoPE']) {
      return new JsonResponse(['status' => 'error', 'errors' => 'missing parameters']);
    }

    $em = $this->getDoctrine()->getManager();

    $entidade = $em->getRepository('AppBundle:Entidade')->find($dados['entidade']);

    $mpe = $this->getModoPagamentoFromEntidade($entidade, $dados['modoPE']);

    if (!$mpe) {
      return new JsonResponse(['status' => 'error', 'errors' => 'missing modo pagamento entidade']);
    }

    $mpe->setActivo(false);

    //remover pagamentos entidade que ainda nao foram pagos
    foreach ($mpe->getPagamentos() as $pe) {
      if (!$pe->getPago()) {
        $em->remove($pe);
        $mpe->removePagamento($pe);
      }
    }

    if (sizeof($mpe->getPagamentos())) {
      $em->persist($mpe);
    } else {
      $em->remove($mpe);
      $entidade->removeModoPagamentoEntidade($mpe);
    }

    $em->flush();
    $epocasEntidade = [];
    $this->getModosPagamentoEntidade($entidade, $epocasEntidade);

    $epocas = $this->getEpocas($entidade);


    return new JsonResponse(['status' => 'ok', 'epocasEntidade' => $epocasEntidade, 'epocas' => $epocas]);
  }



  //--------------FUNÇÕES--------------------------------------------------------------------------------------------------

  private static function validarNIF($nif)
  {
    $ignoreFirst = true;
    //Limpamos eventuais espaços a mais
    $nif = trim($nif);

    /*
        var_dump($nif);
        var_dump(!is_numeric($nif));
        var_dump( strlen($nif) != 9 );
        var_dump( !is_numeric($nif) || strlen($nif) != 9 );
        die();*/

    //Verificamos se é numérico e tem comprimento 9
    if ((!is_numeric($nif) || strlen($nif) != 9)) {
      return "O NIF contém 9 digitos.";
    }

    return NULL;

    /*        else {
            $nifSplit=str_split($nif);
            //O primeiro digíto tem de ser 1, 2, 5, 6, 8 ou 9
            //Ou não, se optarmos por ignorar esta "regra"
            if (
                in_array($nifSplit[0], array(1, 2, 5, 6, 8, 9))
                ||
                $ignoreFirst
            ) {
                //Calculamos o dígito de controlo
                $checkDigit=0;
                for($i=0; $i<8; $i++) {
                    $checkDigit+=$nifSplit[$i]*(10-$i-1);
                }
                $checkDigit=11-($checkDigit % 11);
                //Se der 10 então o dígito de controlo tem de ser 0
                if($checkDigit>=10) $checkDigit=0;
                //Comparamos com o último dígito
                if ($checkDigit==$nifSplit[8]) {
                    return null;
                } else {
                    return "O NIF que inseriu não é válido.";
                }
            } else {
                return "O NIF que inseriu não é válido.";
            }
        }*/
  }

  private function getPagamentoEntidadeFromMPE(ModoPagamentoEntidade $mpe, $idPagamento)
  {

    foreach ($mpe->getPagamentos() as $pe) {
      if ($pe->getPagamento()->getIDPagamento() === $idPagamento) {
        return $pe;
      }
    }

    return null;
  }

  private function getModoPagamentoEntidadeFromEntidade(Entidade $entidade, $idModoPagamento)
  {
    foreach ($entidade->getModosPagamentoEntidade() as $mpe) {
      if ($mpe->getModoPagamento()->getIDModoPagamento() === $idModoPagamento) {
        return $mpe;
      }
    }

    return null;
  }

  private function getModoPagamentoFromEntidade(Entidade $entidade, $idModoPagamentoEntidade)
  {

    foreach ($entidade->getModosPagamentoEntidade() as $mpe) {
      if ($mpe->getIDModoPagamentoEntidade() === $idModoPagamentoEntidade) {
        return $mpe;
      }
    }

    return null;
  }

  private function getPagamentoFromMPE(ModoPagamentoEntidade $mpe, $idPagamento)
  {

    foreach ($mpe->getPagamentos() as $pagamento) {
      if ($pagamento->getPagamento()->getIDPagamento() === $idPagamento) {
        return $pagamento;
      }
    }

    return null;
  }

  private function getModosPagamentoEntidade(Entidade $entidade, &$epocas)
  {

    foreach ($entidade->getModosPagamentoEntidade() as $idx => $mpe) {

      $idEpoca = $mpe->getEpoca()->getIDEpoca();

      $modoPagamento = $mpe->getModoPagamento();

      $epocaIdx = $this->getEpocaIndex($epocas, $idEpoca);

      if ($epocaIdx < 0) {
        $epoca = ['ID_epoca' => $idEpoca, 'Nome' => $mpe->getEpoca()->getNome(), 'ModosPagamento' => []];
      }


      $modo = [
        'REF_Epoca' => $idEpoca,
        'ID_Modo_Pagamento_Entidade' => $mpe->getIDModoPagamentoEntidade(),
        'ID_Modo_Pagamento' => $modoPagamento->getIDModoPagamento(),
        'Descricao' => $mpe->getDescricao(),
        'Activo' => $mpe->getActivo(),
        'Pagamentos' => []
      ];

      foreach ($mpe->getPagamentos() as $pe) {
        $pagamento = $pe->getPagamento();

        $modo['Pagamentos'][] = [
          'ID_Pagamento' => $pagamento->getIDPagamento(),
          'Descricao' => $pe->getDescricao(),
          'Valor' => $pe->getValor(),
          'ValorPosLimite' => $pe->getValorPosLimite(),
          'DataLimite' => $pe->getDataLimite()->format('d-m-Y'),
          'Benificio' => $pe->getBenificio(),
          'DescricaoBenificio' => $pe->getDescricaoBenificio(),
          'Pago' => $pe->getPago()
        ];
      }

      if ($epocaIdx < 0) {
        $epoca['ModosPagamento'][] = $modo;
        $epocas[] = $epoca;
      } else {
        $epocas[$epocaIdx]['ModosPagamento'][] = $modo;
      }
    }
  }

  private function getEpocaIndex($epocas = [], $idEpoca)
  {


    foreach ($epocas as $index => $epoca) {
      if ($epoca['ID_epoca'] === $idEpoca) {
        return $index;
      }
    }

    return -1;
  }


  private static function getEpocaAtual($epocasRep)
  {

    $epocas = $epocasRep->findAll();
    $today = new \DateTime("now");

    //buscar dados
    foreach ($epocas as $epoca) {
      $ep = array();
      $ep['DataInicio'] = $epoca->getDataInicio();
      $ep['DataFim'] = $epoca->getDataFim();

      if ($today >= $ep['DataInicio'] and $today <= $ep['DataFim']) {
        return $epoca;
      }
    }
  }

  private function getEpocas(Entidade $entidade)
  {

    $epocasEntidade = [];
    foreach ($entidade->getModosPagamentoEntidade() as $mpe) {
      if ($mpe->getActivo()) {
        $epocasEntidade[] = $mpe->getEpoca()->getIDEpoca();
      }
    }

    $epocaRep = $this->getDoctrine()->getRepository('AppBundle:Epoca');
    $epocas = $epocaRep->findAll();

    $epocasOut = [];

    foreach ($epocas as $epoca) {

      if (!in_array($epoca->getIDEpoca(), $epocasEntidade)) {

        $aux = ['ID_epoca' => $epoca->getIDEpoca(), 'Nome' => $epoca->getNome(), 'ModosPagamento' => []];

        foreach ($epoca->getModosPagamento() as $modo) {

          if ($modo->getActivo()) {

            $m['IDModo'] = $modo->getIDModoPagamento();
            $m['Descricao'] = $modo->getDescricao();
            $m['Pagamentos'] = array();

            foreach ($modo->getPagamentos() as $pagamento) {
              $p['IDPagamento'] = $pagamento->getIDPagamento();
              $p['Descricao'] = $pagamento->getDescricao();
              $p['Valor'] = $pagamento->getValor();
              $p['ValorPosLimite'] = $pagamento->getValorPosLimite();
              $p['DataLimite'] = $pagamento->getDataLimite()->format('d-m-Y');
              $p['Benificio'] = $pagamento->getBenificio();
              $p['DescricaoBenificio'] = $pagamento->getDescricaoBenificio();

              $m['Pagamentos'][] = $p;
            }

            $aux['ModosPagamento'][] = $m;
          }
        }

        if (sizeof($aux['ModosPagamento'])) {
          $epocasOut[] = $aux;
        }
      }
    }

    return $epocasOut;
  }
}
