  var dashsoccer = angular.module('dashsoccer', ['ui.router', 'smart-table', 'ui.bootstrap', 'blockUI', 'ui-notification', 'datetime', 'chart.js','ngFileUpload','xeditable']);

  dashsoccer.config(function($stateProvider, $urlRouterProvider, blockUIConfig) {
      //mudar template do loading
      //blockUIConfig.templateUrl = 'loading.html';

      // Change the default overlay message
      blockUIConfig.message = 'Aguarde...';

      // Change the default delay to 100ms before the blocking is visible
      blockUIConfig.delay = 100;


      // For any unmatched url, redirect to /state1
      $urlRouterProvider.otherwise("/home");

      // Now set up the states
      $stateProvider.state('index', {
          abstract: true,
          //url: '/',
          views: {
            '@' : {
              templateUrl: 'templates/layout.html',
            },
            'top@index' : { templateUrl: 'templates/header.html', controller: 'UsersController'},
            'left@index' : { templateUrl: 'templates/sidebar.html'},
            'main@index' : { templateUrl: 'templates/main.html'}
          },
           resolve: {
                data: function(LoginService){
                    return LoginService.getLoginDados();
                }
            }
        })

        //HOME
        .state('home', {
        parent: 'index',
        url: "/home",
        views: {
         'main@index' : {
             templateUrl: "templates/dashboardHome.html",
            controller: 'dashboardController'
          }
         },
         resolve: {
              data: function(dashboardService){
                  return dashboardService.getTotais();
              }
         }
        })

      //CLUBE
      .state('clube', {
          parent: 'index',
          url: "/clube",
          views: {
           'main@index' : {
            templateUrl: "templates/clubeInfo.html",
          controller: 'clubeController'
        }
       },
       resolve: {
            data: function(clubeService){
                return clubeService.getclube();
            }
        }
      })

      //CLUBE - EDIT (ADMIN)
      .state('EDITclube', {
          parent: 'index',
          url: "/editarclube",
          views: {
           'main@index' : {
            templateUrl: "templates/EDITclubeInfo.html",
          controller: 'clubeController'
        }
       },
       resolve: {
            data: function(clubeService){
                return clubeService.getclube();
            }
        }
      })

      //ATLETAS
      .state('atletas', {
          parent: 'index',
          url: "/atletas",
          views: {
           'main@index' : {
          templateUrl: "templates/atletas.html",
          controller: 'atletasController'
        }
       },
       resolve: {
            data: function(atletasService){
                return atletasService.getatletas();
            }
        }
      })

      
      

      //ATLETA - PERFIL
      .state('atletaPerfil', {
          parent: 'index',
          url: "/atletaPerfil/{entidadeID:int}",
          views: {
           'main@index' : {
          templateUrl: "templates/atletaPerfil.html",
          controller: 'atletasController'
        }
       },
       resolve: {
            data: function(atletasService, $stateParams){
                return atletasService.getPerfilAtleta($stateParams.entidadeID);
            }
        }
      })

     

      //ATLETA - Novo PERFIL (ADMIN)
      .state('NEWatletaPerfil', {
          parent: 'index',
          url: "/NovoAtletaPerfil/",
          views: {
           'main@index' : {
          templateUrl: "templates/EDITatletaPerfil.html",
          controller: 'atletasController'
        }
       },
       resolve: {
            data: function(atletasService){
                return atletasService.getDadosInserir();
            }
        }
      })

      //ATLETA - EDITAR PERFIL (ADMIN)
      .state('EDITatletaPerfil', {
          parent: 'index',
          url: "/EditarAtletaPerfil/{entidadeID:int}",
          views: {
           'main@index' : {
          templateUrl: "templates/EDITatletaPerfil.html",
          controller: 'atletasController'
        }
       },
       resolve: {
            data: function(atletasService, $stateParams){
                return atletasService.getPerfilAtleta($stateParams.entidadeID);
            }
        }
      })

      

      //outrasEntidades
      .state('outrasEntidades', {
          parent: 'index',
          url: "/outrasEntidades/{tipoEnt:int}",
          views: {
           'main@index' : {
          templateUrl: "templates/outrasEntidades.html",
          controller: 'outrasEntidadesController'
        }
       },
       resolve: {
            data: function(outrasEntidadesService, $stateParams){
                return outrasEntidadesService.getOutrasEntidades($stateParams.tipoEnt);
            }
        }
      })

      //outrasEntidades - PERFIL
      .state('outrasEntidadesPerfil', {
      parent: 'index',
      url: "/outrasEntidadesPerfil/{entidadeID:int}",
      views: {
           'main@index' : {
             templateUrl: "templates/outrasEntidadesPerfil.html",
             controller: 'outrasEntidadesController'
        }
       },
       resolve: {
            data: function(outrasEntidadesService, $stateParams){
                return outrasEntidadesService.getOutrasEntidadesPerfil($stateParams.entidadeID);
            }
        }
      })

      //outrasEntidades - NOVA (ADMIN)
      .state('NEWoutrasEntidades', {
      parent: 'index',
      url: "/novaEntidade/{tipoEnt:int}",
      views: {
           'main@index' : {
      templateUrl: "templates/EDIToutrasEntidades.html",
          controller: 'outrasEntidadesController'
        }
       },
       resolve: {
            data: function(outrasEntidadesService, $stateParams){
                return outrasEntidadesService.getDadosInserir($stateParams.tipoEnt);
            }
        }
      })

      //outrasEntidades - EDIT (ADMIN)
      .state('EDIToutrasEntidades', {
      parent: 'index',
      url: "/editarEntidade/{entidadeID:int}",
      views: {
           'main@index' : {
             templateUrl: "templates/EDIToutrasEntidades.html",
          controller: 'outrasEntidadesController'
        }
       },
       resolve: {
            data: function(outrasEntidadesService, $stateParams){
                return outrasEntidadesService.getOutrasEntidadesPerfil($stateParams.entidadeID);
            }
        }
      })

      //GESTÃO DE UTILIZADORES (ADMIN)
      .state('gestaoUsers', {
          parent: 'index',
          url: "/gestaoUsers",
          views: {
           'main@index' : {
          templateUrl: "templates/gestaoUsers.html",
          controller: 'UsersController'
        }
       },
       resolve: {
            data: function(UsersService){
                return UsersService.getUsers();
            }
        }
      })

      //PARAMETRIZAÇÃO (ADMIN)
      .state('parametrizacao', {
          parent: 'index',
          url: "/parametrizacao",
          views: {
           'main@index' : {
          templateUrl: "templates/parametrizacao.html",
          controller: 'parametrosController'
        }
       },
       resolve: {
            data: function(parametrosService,  $uibModal){
                return parametrosService.getParametros();
            }
        }
      })

      //ATLETA - PERFIL
      .state('parametrizacaoEpoca', {
          parent: 'index',
          url: "/parametrizacao/epoca/{epocaID}",
          views: {
           'main@index' : {
          templateUrl: "templates/parametrizacaoEpoca.html",
          controller: 'epocasController'
        }
       },
       resolve: {
            data: function(parametrosService, $stateParams){
                return parametrosService.getEpoca($stateParams.epocaID);
            }
        }
      })

      //HISTORICO
      .state('historico', {
          parent: 'index',
          url: "/historico",
          views: {
           'main@index' : {
          templateUrl: "templates/historico.html"
        }
       }
      })

      //Definicoes
      .state('definicoes', {
          parent: 'index',
          url: "/definicoes",
          views: {
           'main@index' : {
          templateUrl: "templates/definicoes.html",
          controller: 'UsersController'
        }
       },
       resolve: {
            data: function(UsersService){
                return UsersService.getUser();
            }
        }
      })


});


    //GERAL
    dashsoccer.run(function($rootScope,$state,editableOptions, editableThemes) {

      editableThemes.bs3.buttonsClass = 'btn-sm';
      editableThemes.bs3.inputClass = 'input-sm';
      editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2', 'default'

      //erros log caso statechangeerror
     $rootScope.$on('$stateChangeError',function(event, toState, toParams, fromState, fromParams, error){
       console.log('$stateChangeError - fired when an error occurs during transition.');
       console.log(arguments);
       console.log(error);
     });

      // Show/Hide sidebar dropdown
      $rootScope.showmenu=false;

      $rootScope.showmenu = "hidden";

      $rootScope.openmenu = function() {
        if ($rootScope.showmenu == "show"){
          $rootScope.showmenu="hidden";

        }else{
         $rootScope.showmenu="show";
        }

      }

      // Show/Hide profilebox dropdown
      $rootScope.showuser=false;

      $rootScope.openUser = function() {
        if ($rootScope.showuser == "show"){
          $rootScope.showuser="hidden";

        }else{
         $rootScope.showuser="show";
        }

      }

      // Show/Hide sidebar
      /* $rootScope.showSidebar=false;

      $rootScope.openSidebar = function() {
        if ($rootScope.showSidebar == "show"){
          $rootScope.showSidebar="hidden";

        }else{
         $rootScope.showSidebar="show";
        }

      } */

      $rootScope.sidebarClosed=false;

      $rootScope.showSidebar = function() {
        $rootScope.sidebarClosed = !$rootScope.sidebarClosed;
      }

    });
