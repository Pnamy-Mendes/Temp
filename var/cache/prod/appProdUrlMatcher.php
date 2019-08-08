<?php

use Symfony\Component\Routing\Exception\MethodNotAllowedException;
use Symfony\Component\Routing\Exception\ResourceNotFoundException;
use Symfony\Component\Routing\RequestContext;

/**
 * appProdUrlMatcher.
 *
 * This class has been auto-generated
 * by the Symfony Routing Component.
 */
class appProdUrlMatcher extends Symfony\Bundle\FrameworkBundle\Routing\RedirectableUrlMatcher
{
    /**
     * Constructor.
     */
    public function __construct(RequestContext $context)
    {
        $this->context = $context;
    }

    public function match($pathinfo)
    {
        $allow = array();
        $pathinfo = rawurldecode($pathinfo);
        $context = $this->context;
        $request = $this->request;

        if (0 === strpos($pathinfo, '/api')) {
            if (0 === strpos($pathinfo, '/api/atletas')) {
                // all_atletas
                if ($pathinfo === '/api/atletas/all') {
                    return array (  '_controller' => 'AppBundle\\Controller\\AtletasController::getAtletas',  '_route' => 'all_atletas',);
                }

                // all_atletaPerfil
                if (0 === strpos($pathinfo, '/api/atletas/get') && preg_match('#^/api/atletas/get/(?P<id>[^/]++)$#s', $pathinfo, $matches)) {
                    return $this->mergeDefaults(array_replace($matches, array('_route' => 'all_atletaPerfil')), array (  '_controller' => 'AppBundle\\Controller\\AtletasController::getPerfilAtleta',));
                }

                // uploadFile
                if ($pathinfo === '/api/atletas/uploadFile') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_uploadFile;
                    }

                    return array (  '_controller' => 'AppBundle\\Controller\\AtletasController::uploadFile',  '_route' => 'uploadFile',);
                }
                not_uploadFile:

                // saveDocumentoAtleta
                if ($pathinfo === '/api/atletas/saveDocumentoAtleta') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_saveDocumentoAtleta;
                    }

                    return array (  '_controller' => 'AppBundle\\Controller\\AtletasController::saveDocumentoAtleta',  '_route' => 'saveDocumentoAtleta',);
                }
                not_saveDocumentoAtleta:

                // removerDocumentoAtleta
                if ($pathinfo === '/api/atletas/removerDocumentoAtleta') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_removerDocumentoAtleta;
                    }

                    return array (  '_controller' => 'AppBundle\\Controller\\AtletasController::removerDocumentoAtleta',  '_route' => 'removerDocumentoAtleta',);
                }
                not_removerDocumentoAtleta:

                // dadosInserirAtleta
                if ($pathinfo === '/api/atletas/dadosInserirAtleta') {
                    return array (  '_controller' => 'AppBundle\\Controller\\AtletasController::dadosInserirAtleta',  '_route' => 'dadosInserirAtleta',);
                }

                // novoAtleta
                if ($pathinfo === '/api/atletas/novoAtleta') {
                    return array (  '_controller' => 'AppBundle\\Controller\\AtletasController::novoAtleta',  '_route' => 'novoAtleta',);
                }

                // editarAtleta
                if ($pathinfo === '/api/atletas/editarAtleta') {
                    return array (  '_controller' => 'AppBundle\\Controller\\AtletasController::editarAtleta',  '_route' => 'editarAtleta',);
                }

                if (0 === strpos($pathinfo, '/api/atletas/a')) {
                    // deleteAtleta
                    if ($pathinfo === '/api/atletas/apagarAtleta') {
                        return array (  '_controller' => 'AppBundle\\Controller\\AtletasController::deleteAtleta',  '_route' => 'deleteAtleta',);
                    }

                    // associarModoPagamentoAtleta
                    if ($pathinfo === '/api/atletas/associarModoPagamentoAtleta') {
                        if ($this->context->getMethod() != 'POST') {
                            $allow[] = 'POST';
                            goto not_associarModoPagamentoAtleta;
                        }

                        return array (  '_controller' => 'AppBundle\\Controller\\AtletasController::associarModoPagamentoAtleta',  '_route' => 'associarModoPagamentoAtleta',);
                    }
                    not_associarModoPagamentoAtleta:

                }

                // efetuarPagamentoAtleta
                if ($pathinfo === '/api/atletas/efetuarPagamentoAtleta') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_efetuarPagamentoAtleta;
                    }

                    return array (  '_controller' => 'AppBundle\\Controller\\AtletasController::efetuarPagamentoAtleta',  '_route' => 'efetuarPagamentoAtleta',);
                }
                not_efetuarPagamentoAtleta:

                // anularPagamentoAtleta
                if ($pathinfo === '/api/atletas/anularPagamentoAtleta') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_anularPagamentoAtleta;
                    }

                    return array (  '_controller' => 'AppBundle\\Controller\\AtletasController::anularPagamentoAtleta',  '_route' => 'anularPagamentoAtleta',);
                }
                not_anularPagamentoAtleta:

                // desativarModoPagamentoAtleta
                if ($pathinfo === '/api/atletas/desativarModoPagamentoAtleta') {
                    if ($this->context->getMethod() != 'POST') {
                        $allow[] = 'POST';
                        goto not_desativarModoPagamentoAtleta;
                    }

                    return array (  '_controller' => 'AppBundle\\Controller\\AtletasController::desativarModoPagamentoAtleta',  '_route' => 'desativarModoPagamentoAtleta',);
                }
                not_desativarModoPagamentoAtleta:

            }

            if (0 === strpos($pathinfo, '/api/clube')) {
                // all_clube
                if ($pathinfo === '/api/clube/all') {
                    return array (  '_controller' => 'AppBundle\\Controller\\ClubeController::getClube',  '_route' => 'all_clube',);
                }

                // editarDadosClube
                if ($pathinfo === '/api/clube/editarDadosClube') {
                    return array (  '_controller' => 'AppBundle\\Controller\\ClubeController::editarDadosClube',  '_route' => 'editarDadosClube',);
                }

            }

            // dashboardTotais
            if ($pathinfo === '/api/dashboard/dashboardTotais') {
                return array (  '_controller' => 'AppBundle\\Controller\\DashboardController::dashboardTotais',  '_route' => 'dashboardTotais',);
            }

        }

        // homepage
        if (rtrim($pathinfo, '/') === '') {
            if (substr($pathinfo, -1) !== '/') {
                return $this->redirect($pathinfo.'/', 'homepage');
            }

            return array (  '_controller' => 'AppBundle\\Controller\\DefaultController::indexAction',  '_route' => 'homepage',);
        }

        if (0 === strpos($pathinfo, '/api/parametros')) {
            // all_parametros
            if ($pathinfo === '/api/parametros/all') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::getParametros',  '_route' => 'all_parametros',);
            }

            // insertClube
            if ($pathinfo === '/api/parametros/novoClube') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::insertClube',  '_route' => 'insertClube',);
            }

            // editClube
            if ($pathinfo === '/api/parametros/editarClube') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::editClube',  '_route' => 'editClube',);
            }

            // deleteClube
            if ($pathinfo === '/api/parametros/apagarClube') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::deleteClube',  '_route' => 'deleteClube',);
            }

            // insertEpoca
            if ($pathinfo === '/api/parametros/novaEpoca') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::insertEpoca',  '_route' => 'insertEpoca',);
            }

            // editEpoca
            if ($pathinfo === '/api/parametros/editarEpoca') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::editEpoca',  '_route' => 'editEpoca',);
            }

            // deleteEpoca
            if ($pathinfo === '/api/parametros/apagarEpoca') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::deleteEpoca',  '_route' => 'deleteEpoca',);
            }

            // getEpoca
            if (0 === strpos($pathinfo, '/api/parametros/getEpoca') && preg_match('#^/api/parametros/getEpoca/(?P<id>[^/]++)$#s', $pathinfo, $matches)) {
                return $this->mergeDefaults(array_replace($matches, array('_route' => 'getEpoca')), array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::getEpoca',));
            }

            // addModoPagamento
            if ($pathinfo === '/api/parametros/addModoPagamento') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::addModoPagamento',  '_route' => 'addModoPagamento',);
            }

            // editarModoPagamento
            if ($pathinfo === '/api/parametros/editarModoPagamento') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::editarModoPagamento',  '_route' => 'editarModoPagamento',);
            }

            // removeModoPagamento
            if ($pathinfo === '/api/parametros/removeModoPagamento') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::removeModoPagamento',  '_route' => 'removeModoPagamento',);
            }

            // addPagamento
            if ($pathinfo === '/api/parametros/addPagamento') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::addPagamento',  '_route' => 'addPagamento',);
            }

            // editarPagamento
            if ($pathinfo === '/api/parametros/editarPagamento') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::editarPagamento',  '_route' => 'editarPagamento',);
            }

            // removePagamento
            if ($pathinfo === '/api/parametros/removePagamento') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::removePagamento',  '_route' => 'removePagamento',);
            }

            // insertEscalao
            if ($pathinfo === '/api/parametros/novoEscalao') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::insertEscalao',  '_route' => 'insertEscalao',);
            }

            // editEscalao
            if ($pathinfo === '/api/parametros/editarEscalao') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::editEscalao',  '_route' => 'editEscalao',);
            }

            // deleteEscalao
            if ($pathinfo === '/api/parametros/apagarEscalao') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::deleteEscalao',  '_route' => 'deleteEscalao',);
            }

            // insertModalidade
            if ($pathinfo === '/api/parametros/novaModalidade') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::insertModalidade',  '_route' => 'insertModalidade',);
            }

            // editModalidade
            if ($pathinfo === '/api/parametros/editarModalidade') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::editModalidade',  '_route' => 'editModalidade',);
            }

            // deleteModalidade
            if ($pathinfo === '/api/parametros/apagarModalidade') {
                return array (  '_controller' => 'AppBundle\\Controller\\ParametrosController::deleteModalidade',  '_route' => 'deleteModalidade',);
            }

        }

        // login
        if ($pathinfo === '/login') {
            return array (  '_controller' => 'AppBundle\\Controller\\SecurityController::loginAction',  '_route' => 'login',);
        }

        if (0 === strpos($pathinfo, '/api')) {
            if (0 === strpos($pathinfo, '/api/utilizadores')) {
                // all_utilizadores
                if ($pathinfo === '/api/utilizadores/all') {
                    return array (  '_controller' => 'AppBundle\\Controller\\UtilizadoresController::getUtilizadores',  '_route' => 'all_utilizadores',);
                }

                // getUser
                if ($pathinfo === '/api/utilizadores/utilizador') {
                    return array (  '_controller' => 'AppBundle\\Controller\\UtilizadoresController::getUser',  '_route' => 'getUser',);
                }

                // insertUser
                if ($pathinfo === '/api/utilizadores/novoUtilizador') {
                    return array (  '_controller' => 'AppBundle\\Controller\\UtilizadoresController::insertUser',  '_route' => 'insertUser',);
                }

                // editUser
                if ($pathinfo === '/api/utilizadores/editarUtilizador') {
                    return array (  '_controller' => 'AppBundle\\Controller\\UtilizadoresController::editUser',  '_route' => 'editUser',);
                }

                // deleteUser
                if ($pathinfo === '/api/utilizadores/apagarUtilizador') {
                    return array (  '_controller' => 'AppBundle\\Controller\\UtilizadoresController::deleteUser',  '_route' => 'deleteUser',);
                }

                // getUserDados
                if ($pathinfo === '/api/utilizadores/getUserDados') {
                    return array (  '_controller' => 'AppBundle\\Controller\\UtilizadoresController::getUserDados',  '_route' => 'getUserDados',);
                }

            }

            // validateLogin
            if ($pathinfo === '/api/login/validateLogin') {
                return array (  '_controller' => 'AppBundle\\Controller\\loginController::validateLogin',  '_route' => 'validateLogin',);
            }

            if (0 === strpos($pathinfo, '/api/outrasEntidades')) {
                // all_outrasEntidades
                if (0 === strpos($pathinfo, '/api/outrasEntidades/all') && preg_match('#^/api/outrasEntidades/all/(?P<tipoEnt>[^/]++)$#s', $pathinfo, $matches)) {
                    return $this->mergeDefaults(array_replace($matches, array('_route' => 'all_outrasEntidades')), array (  '_controller' => 'AppBundle\\Controller\\outrasEntidadesController::getOutrasEntidades',));
                }

                // all_outrasEntidadesPerfil
                if (0 === strpos($pathinfo, '/api/outrasEntidades/get') && preg_match('#^/api/outrasEntidades/get/(?P<id>[^/]++)$#s', $pathinfo, $matches)) {
                    return $this->mergeDefaults(array_replace($matches, array('_route' => 'all_outrasEntidadesPerfil')), array (  '_controller' => 'AppBundle\\Controller\\outrasEntidadesController::getPerfilOutrasEntidades',));
                }

                // getDadosInserir
                if ($pathinfo === '/api/outrasEntidades/dadosInserirEntidade') {
                    return array (  '_controller' => 'AppBundle\\Controller\\outrasEntidadesController::getDadosInserir',  '_route' => 'getDadosInserir',);
                }

                // novaEntidade
                if ($pathinfo === '/api/outrasEntidades/novaEntidade') {
                    return array (  '_controller' => 'AppBundle\\Controller\\outrasEntidadesController::novaEntidade',  '_route' => 'novaEntidade',);
                }

                // editarEntidade
                if ($pathinfo === '/api/outrasEntidades/editarEntidade') {
                    return array (  '_controller' => 'AppBundle\\Controller\\outrasEntidadesController::editarEntidade',  '_route' => 'editarEntidade',);
                }

                // deleteEntidade
                if ($pathinfo === '/api/outrasEntidades/apagarEntidade') {
                    return array (  '_controller' => 'AppBundle\\Controller\\outrasEntidadesController::deleteEntidade',  '_route' => 'deleteEntidade',);
                }

                // fileUpload
                if ($pathinfo === '/api/outrasEntidades/fileUpload') {
                    return array (  '_controller' => 'AppBundle\\Controller\\outrasEntidadesController::fileUpload',  '_route' => 'fileUpload',);
                }

            }

        }

        // fos_js_routing_js
        if (0 === strpos($pathinfo, '/js/routing') && preg_match('#^/js/routing(?:\\.(?P<_format>js|json))?$#s', $pathinfo, $matches)) {
            return $this->mergeDefaults(array_replace($matches, array('_route' => 'fos_js_routing_js')), array (  '_controller' => 'fos_js_routing.controller:indexAction',  '_format' => 'js',));
        }

        // logout
        if ($pathinfo === '/logout') {
            return array('_route' => 'logout');
        }

        throw 0 < count($allow) ? new MethodNotAllowedException(array_unique($allow)) : new ResourceNotFoundException();
    }
}
