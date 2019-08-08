<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\ORM\EntityRepository;

use AppBundle\Entity\Entidade;
use AppBundle\Entity\Morada;

/**
 * @Route("/api/outrasEntidades")
 */
class outrasEntidadesController extends Controller
{
    /**
     * @Route("/all/{tipoEnt}", name="all_outrasEntidades", options={"expose"=true})
     */
    public function getOutrasEntidades(Request $request, $tipoEnt)
    {

        //titulo da pagina conforme o tipo de entidade
        switch ($tipoEnt) {
            case 2:
                $titulo = "Treinadores";
                break;
            case 3:
                $titulo = "Diretores";
                break;
            case 4:
                $titulo = "Outro Staff";
                break;
            default:
                $titulo = "Treinadores";
                break;
        }

        $entidadeRep = $this->getDoctrine()->getRepository('AppBundle:Entidade');
        $entidades = $entidadeRep->findBy(array('TipoEnt' => $tipoEnt));

        $response = new JsonResponse();
        $responseArr = array();
        $responseArr['status'] = 'ok';
        $responseArr['data'] = array();

        foreach ($entidades as $entidade) {

            $enti = array();
            $enti['ID'] = $entidade->getIDEntidade();
            $enti['Nome'] = $entidade->getNome();
            $enti['Estado'] = $entidade->getEstado();
            $enti['Telf'] = $entidade->getTelf();
            $enti['Telm'] = $entidade->getTelm();

            $responseArr['data'][] = $enti;
        }

        $response->setData(array('data' => $responseArr, 'titulo' => $titulo, 'tipo' => $tipoEnt));

        return $response;
    }

    /**
     * @Route("/get/{id}", name="all_outrasEntidadesPerfil", options={"expose"=true})
     */
    public function getPerfilOutrasEntidades(Request $request, $id)
    {

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
            $enti['DataNasc'] = $entidade->getDataNasc()->format('d-m-Y');
            $enti['CC'] = $entidade->getCC();
            $enti['NIF'] = $entidade->getNIF();
            $enti['Habilitacoes'] = $entidade->getHabilitacoes();
            $enti['Profissao'] = $entidade->getProfissao();
            $enti['UltimaAtualizacao'] = $entidade->getUltimaAtualizacao()->format('d-m-Y');
            $enti['FotoInscricao'] = $entidade->getFotoInscricao();
            $enti['FotoCromos'] = $entidade->getFotoCromos();
            //$enti['Inscricao'] = $entidade->getInscricao()->getNome();
            $enti['Estado'] = ($entidade->getEstado() == true ? "Ativo" : "Inativo");
            $enti['EstadoID'] = ($entidade->getEstado() == true ? 1 : 0);
            //$enti['Modalidade'] = $entidade->getModalidades()->getNome();

            //get varios escalões pelos quais a entidade é responsavel
            $emsp = "\xe2\x80\x83";

            foreach ($entidade->getEscaloesResp() as $escResp) {
                $enti['EscaloesResp'][] = $escResp->getModalidades()->getNome()
                    . ' : ' . $emsp
                    . $escResp->getNome()
                    . ' [ ' . $escResp->getEpoca()->getNome() . ' ]';

                $enti['EscRepModal'][] = $escResp->getModalidades()->getNome();
                $enti['EscRepEscalao'][] = $escResp->getIDEscalao();
                $enti['EscRepEpoca'][] = $escResp->getEpoca()->getNome();
            }

            //restantes dados
            // Escalões - Select //
            $escaloesRep = $this->getDoctrine()->getRepository('AppBundle:Escalao');
            $escaloes = $escaloesRep->findAll();

            $responseArr['escaloes'] = array();

            //buscar dados
            foreach ($escaloes as $escalao) {

                $esc = array();
                $esc['IDEscalao'] = $escalao->getIDescalao();
                $esc['Nome'] = $escalao->getNome();
                $esc['EscMod'] = $escalao->getModalidades()->getNome();
                $esc['EscEpoca'] = $escalao->getEpoca()->getNome();

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

            // Epocas - Select //
            $epocasRep = $this->getDoctrine()->getRepository('AppBundle:Epoca');
            $epocas = $epocasRep->findAll();

            $responseArr['epocas'] = array();

            foreach ($epocas as $epoca) {

                $esc = array();
                $esc['IDEpoca'] = $epoca->getIDEpoca();
                $esc['Nome'] = $epoca->getNome();

                $responseArr['epocas'][] = $esc;
            }

            //titulo e parametro da pagina conforme o tipo de entidade
            $titulo = $entidade->getTipoEnt()->getNome();
            $tipo = $entidade->getTipoEnt()->getIDTipoentidade();

            $responseArr['lista'] = $enti;
        }


        $response->setData(array('data' => $responseArr, 'titulo' => $titulo, 'tipo' => $tipo));

        return $response;
    }



    /**
     * @Route("/dadosInserirEntidade", name="getDadosInserir", options={"expose"=true})
     */
    public function getDadosInserir(Request $request)
    {

        $dados = json_decode($request->getContent(), true);
        $tipoEnt = $dados;

        //titulo da pagina conforme o tipo de entidade
        switch ($tipoEnt) {
            case 2:
                $titulo = "Treinadores";
                break;
            case 3:
                $titulo = "Diretores";
                break;
            case 4:
                $titulo = "Outro Staff";
                break;
            default:
                $titulo = "Treinadores";
                break;
        }

        $response = new JsonResponse();
        $responseArr = array();
        $responseArr['status'] = 'ok';
        $responseArr['data'] = array();


        // Escalões - Select //
        $escaloesRep = $this->getDoctrine()->getRepository('AppBundle:Escalao');
        $escaloes = $escaloesRep->findAll();

        $responseArr['escaloes'] = array();

        //buscar dados
        foreach ($escaloes as $escalao) {

            $esc = array();
            $esc['IDEscalao'] = $escalao->getIDescalao();
            $esc['Nome'] = $escalao->getNome();
            $esc['EscMod'] = $escalao->getModalidades()->getNome();
            $esc['EscEpoca'] = $escalao->getEpoca()->getNome();

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

        // Epocas - Select //
        $epocasRep = $this->getDoctrine()->getRepository('AppBundle:Epoca');
        $epocas = $epocasRep->findAll();

        $responseArr['epocas'] = array();

        foreach ($epocas as $epoca) {

            $esc = array();
            $esc['IDEpoca'] = $epoca->getIDEpoca();
            $esc['Nome'] = $epoca->getNome();

            $responseArr['epocas'][] = $esc;
        }

        $response->setData(array('data' => $responseArr, 'titulo' => $titulo, 'tipo' => $tipoEnt));



        return $response;
    }


    /**
     * @Route("/novaEntidade", name="novaEntidade", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
    public function novaEntidade(Request $request)
    {

        $dadosArr = json_decode($request->getContent(), true);
        $outrosErros = [];
        $json['errors'] = array();

        $dados = $dadosArr[0];
        $tipoEnt = $dadosArr[1];

        $em = $this->getDoctrine()->getManager();

        //get objeto tipo entidade
        $tipoEntRep = $this->getDoctrine()->getRepository('AppBundle:TipoEntidade');
        $selTipoEnt = $tipoEntRep->find($tipoEnt);

        //dados a ser inseridos - nova entidade
        $novaEntidade = new Entidade();
        $novaEntidade->setTipoEnt($selTipoEnt);
        $novaEntidade->setEstado(isset($dados['EstadoID'])  ? $dados['EstadoID'] : null);
        $novaEntidade->setUltimaAtualizacao(new \DateTime("now"));
        $novaEntidade->setNome(isset($dados['Nome']) ? $dados['Nome'] : null);
        $novaEntidade->setPais(isset($dados['Pais'])  ? $dados['Pais'] : null);
        $novaEntidade->setNaturalidade(isset($dados['Naturalidade'])  ? $dados['Naturalidade'] : null);
        $novaEntidade->setDataNasc(isset($dados['DataNasc'])  ? new \DateTime($dados['DataNasc']) : null);

        $novaEntidade->setCC(isset($dados['CC'])  ? $dados['CC'] : null);
        $novaEntidade->setNIF(isset($dados['NIF'])  ? $dados['NIF'] : null);

        $novaEntidade->setHabilitacoes(isset($dados['Habilitacoes'])  ? $dados['Habilitacoes'] : null);
        $novaEntidade->setProfissao(isset($dados['Profissao'])  ? $dados['Profissao'] : null);

        $novaEntidade->setTelf(isset($dados['Telf'])  ? $dados['Telf'] : null);
        $novaEntidade->setTelm(isset($dados['Telm'])  ? $dados['Telm'] : null);
        $novaEntidade->setEmail(isset($dados['Email'])  ? $dados['Email'] : null);

        $novaEntidade->setFotoInscricao(isset($dados['FotoInscricao'])  ? $dados['FotoInscricao'] : 'user.png');

        //Inserir Morada
        $morada = new Morada();
        $morada->setRua(isset($dados['Morada_Rua'])  ? $dados['Morada_Rua'] : null);
        $morada->setNumero(isset($dados['Morada_Numero'])  ? $dados['Morada_Numero'] : null);
        $morada->setAndar(isset($dados['Morada_Andar'])  ? $dados['Morada_Andar'] : null);
        $morada->setCodPostal4(isset($dados['Morada_CodPostal4']) ? $dados['Morada_CodPostal4'] : null);
        $morada->setCodPostal3(isset($dados['Morada_CodPostal3']) ? $dados['Morada_CodPostal3'] : null);
        $morada->setLocalidade(isset($dados['Morada_Localidade']) ? $dados['Morada_Localidade'] : null);

        $novaEntidade->setMorada($morada);


        //VALIDAÇÕES---------------

        //Validação NIF---------------------------------------
        $ignoreFirst = true;
        //Limpamos eventuais espaços a mais
        $nif = trim($dados['NIF']);
        //Verificamos se é numérico e tem comprimento 9
        if (!is_numeric($nif) || strlen($nif) != 9) {
            $outrosErros[] = "O NIF contém 9 digitos.";
        } else {
            $nifSplit = str_split($nif);
            //O primeiro digíto tem de ser 1, 2, 5, 6, 8 ou 9
            //Ou não, se optarmos por ignorar esta "regra"
            if (
                in_array($nifSplit[0], array(1, 2, 5, 6, 8, 9))
                ||
                $ignoreFirst
            ) {
                //Calculamos o dígito de controlo
                $checkDigit = 0;
                for ($i = 0; $i < 8; $i++) {
                    $checkDigit += $nifSplit[$i] * (10 - $i - 1);
                }
                $checkDigit = 11 - ($checkDigit % 11);
                //Se der 10 então o dígito de controlo tem de ser 0
                if ($checkDigit >= 10) $checkDigit = 0;
                //Comparamos com o último dígito
                if ($checkDigit == $nifSplit[8]) {
                    $novaEntidade->setNIF($nif);
                } else {
                    $outrosErros[] = "O NIF que inseriu não é válido.";
                }
            } else {
                $outrosErros[] = "O NIF que inseriu não é válido.";
            }
        }
        //-------------------------------------------------------

        $validator = $this->get('validator');
        $errors = $validator->validate($novaEntidade);
        $errors2 = $validator->validate($morada);

        if ((count($errors) > 0) or (!empty($outrosErros)) or (count($errors2) > 0)) {

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

            if (!empty($outrosErros)) {
                $json['errors'] = array_merge($json['errors'], $outrosErros);
            }

            $json['status'] = 'error';
        } else {
            //inserir na base de dados
            $em->persist($morada);
            $em->persist($novaEntidade);

            $em->flush();

            //inserir escalões responsável
            $responsavelRep = $this->getDoctrine()->getRepository('AppBundle:Entidade')->find($novaEntidade->getIDEntidade());

            foreach ($dados['EscRepEscalao'] as $escR) {
                $escRRep = $this->getDoctrine()->getRepository('AppBundle:Escalao')->find($escR);
                $responsavelRep->addEscaloesResp($escRRep);
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
     * @Route("/editarEntidade", name="editarEntidade", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
    public function editarEntidade(Request $request)
    {

        $dados = json_decode($request->getContent(), true);

        $outrosErros = [];
        $json['errors'] = array();

        $em = $this->getDoctrine()->getManager();

        //get objeto tipo entidade
        $entidadeRep = $this->getDoctrine()->getRepository('AppBundle:Entidade');
        $novaEntidade = $entidadeRep->find($dados['ID']);

        //dados a ser inseridos - nova entidade
        $novaEntidade->setEstado(isset($dados['EstadoID'])  ? $dados['EstadoID'] : null);
        $novaEntidade->setUltimaAtualizacao(new \DateTime("now"));
        $novaEntidade->setNome(isset($dados['Nome']) ? $dados['Nome'] : null);
        $novaEntidade->setPais(isset($dados['Pais'])  ? $dados['Pais'] : null);
        $novaEntidade->setNaturalidade(isset($dados['Naturalidade'])  ? $dados['Naturalidade'] : null);
        $novaEntidade->setDataNasc(isset($dados['DataNasc'])  ? new \DateTime($dados['DataNasc']) : null);

        $novaEntidade->setCC(isset($dados['CC'])  ? $dados['CC'] : null);
        $novaEntidade->setNIF(isset($dados['NIF'])  ? $dados['NIF'] : null);


        $novaEntidade->setHabilitacoes(isset($dados['Habilitacoes'])  ? $dados['Habilitacoes'] : null);
        $novaEntidade->setProfissao(isset($dados['Profissao'])  ? $dados['Profissao'] : null);

        $novaEntidade->setTelf(isset($dados['Telf'])  ? $dados['Telf'] : null);
        $novaEntidade->setTelm(isset($dados['Telm'])  ? $dados['Telm'] : null);
        $novaEntidade->setEmail(isset($dados['Email'])  ? $dados['Email'] : null);

        $morada = $novaEntidade->getMorada();
        $morada->setRua(isset($dados['Morada_Rua'])  ? $dados['Morada_Rua'] : null);
        $morada->setNumero(isset($dados['Morada_Numero'])  ? $dados['Morada_Numero'] : null);
        $morada->setAndar(isset($dados['Morada_Andar'])  ? $dados['Morada_Andar'] : null);
        $morada->setCodPostal4(isset($dados['Morada_CodPostal4']) ? $dados['Morada_CodPostal4'] : null);
        $morada->setCodPostal3(isset($dados['Morada_CodPostal3']) ? $dados['Morada_CodPostal3'] : null);
        $morada->setLocalidade(isset($dados['Morada_Localidade']) ? $dados['Morada_Localidade'] : null);

        $novaEntidade->setMorada($morada);


        //remover e re-inserir escalões responsável
        $responsavelRep = $this->getDoctrine()->getRepository('AppBundle:Entidade')->find($dados['ID']);
        $ESCresponsavelRep = $this->getDoctrine()->getRepository('AppBundle:Escalao')->findAll();

        foreach ($ESCresponsavelRep as $ESCresponsavel) {
            $responsavelRep->removeEscaloesResp($ESCresponsavel);
        }

        foreach ($dados['EscRepEscalao'] as $escR) {
            $escRRep = $this->getDoctrine()->getRepository('AppBundle:Escalao')->find($escR);
            $responsavelRep->addEscaloesResp($escRRep);
        }


        //VALIDAÇÕES---------------

        //Validação NIF---------------------------------------
        //Limpamos eventuais espaços a mais
        $nif = trim($dados['NIF']);
        //Verificamos se é numérico e tem comprimento 9
        if (!is_numeric($nif) || strlen($nif) != 9) {
            $outrosErros[] = "O NIF contém 9 digitos.";
        } else {
            $nifSplit = str_split($nif);
            //O primeiro digíto tem de ser 1, 2, 5, 6, 8 ou 9
            //Ou não, se optarmos por ignorar esta "regra"
            if (
                in_array($nifSplit[0], array(1, 2, 5, 6, 8, 9))
                ||
                $ignoreFirst
            ) {
                //Calculamos o dígito de controlo
                $checkDigit = 0;
                for ($i = 0; $i < 8; $i++) {
                    $checkDigit += $nifSplit[$i] * (10 - $i - 1);
                }
                $checkDigit = 11 - ($checkDigit % 11);
                //Se der 10 então o dígito de controlo tem de ser 0
                if ($checkDigit >= 10) $checkDigit = 0;
                //Comparamos com o último dígito
                if ($checkDigit == $nifSplit[8]) {
                    $novaEntidade->setNIF(isset($dados['NIF'])  ? $dados['NIF'] : null);
                } else {
                    $outrosErros[] = "O NIF que inseriu não é válido.";
                }
            } else {
                $outrosErros[] = "O NIF que inseriu não é válido.";
            }
        }
        //-------------------------------------------------------

        $validator = $this->get('validator');
        $errors = $validator->validate($novaEntidade);
        $errors2 = $validator->validate($morada);

        if ((count($errors) > 0) or (!empty($outrosErros)) or (count($errors2) > 0)) {

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

            if (!empty($outrosErros)) {
                $json['errors'] = array_merge($json['errors'], $outrosErros);
            }

            $json['status'] = 'error';
        } else {
            //inserir na base de dados
            $em->persist($morada);
            $em->persist($novaEntidade);

            $em->flush();

            $json['status'] = 'ok';
        }

        //json response
        $dados['UltimaAtualizacao'] = new \DateTime("now");
        $json['dados'] = $dados;

        return new JsonResponse($json);
    }


    /**
     * @Route("/apagarEntidade", name="deleteEntidade", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
    public function deleteEntidade(Request $request)
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
     * @Route("/fileUpload", name="fileUpload", options={"expose"=true})
     * @Security("has_role('ROLE_ADMIN')")
     */
    public function fileUpload(Request $request)
    {

        // $_POST parameters
        $ID = $request->request->get('id');

        $errors = [];
        $maxFileSize = 2097152;

        if (isset($_FILES['file']) && $_FILES['file']['error'] == 0) {


            $image = $_FILES["file"]["name"];
            $path_info = pathinfo($image);
            if ($path_info['extension'] == 'jpg' || $path_info['extension'] == 'jpeg' || $path_info['extension'] == 'png' || $path_info['extension'] == 'PNG' || $path_info['extension'] == 'gif') {
                if ($_FILES["file"]["size"] <= $maxFileSize) {

                    // uploads image in the folder images
                    $temp = explode(".", $_FILES["file"]["name"]);
                    $newfilename = substr(md5(time()), 0, 10) . '.' . end($temp);
                    move_uploaded_file($_FILES['file']['tmp_name'], 'img/uploads/' . $newfilename);
                    //echo json_encode($newfilename);
                    $em = $this->getDoctrine()->getManager();
                    $entidade = $em->getRepository('AppBundle:Entidade')->find($ID);
                    $entidade->setFotoInscricao('uploads/' . $newfilename);
                    $em->persist($entidade);
                    $em->flush();
                } else {
                    $errors[] = "invalid file size";
                }
            } else {
                $errors[] = "format not supported";
            }
        }

        //json response
        $json['dataImage'] = 'uploads/' . $newfilename;
        $json['errors'] = $errors;
        $json['status'] = 'ok';

        return new JsonResponse($json);
    }

    /**
     * @Route("/allModosPagamento", name="all_modosPagamento", options={"expose"=true})
     */
    public function getAllModosPagamento()
    {


        $epocaRep = $this->getDoctrine()->getRepository('AppBundle:ModoPagamentoEntidade');
        $epocas = $epocaRep->findAll();

        $response = new JsonResponse();
        $responseArr = array();
        $responseArr['status'] = 'ok';
        $responseArr['data'] = array();

        foreach ($epocas as $epocaRep) {

            $info = array();
            $info['Descricao'] = $epocaRep->getDescricao();


            $responseArr['data'][] = $info;
        }

        $response->setData($responseArr);

        return $response;
    }

    
}
