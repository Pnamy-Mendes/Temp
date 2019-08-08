(function() {

'use strict';

dashsoccer.controller('outrasEntidadesController', ['$scope','outrasEntidadesService', 'data', 'Notification', '$uibModal', '$state', function($scope, outrasEntidadesService,data, Notification, $uibModal, $state){

    $scope.listaentidade = data.data['data'].lista;
    $scope.entidades = data.data['data'].data;
    $scope.titulo = data.data['titulo'];
    $scope.tipo = data.data['tipo'];

    $scope.modalidades = data.data['data'].modalidades;
    $scope.escaloes = data.data['data'].escaloes;
    $scope.epocas = data.data['data'].epocas;

    //arrays com os dados dos escalões pelos quais a entidade é responsável
    var escaloesResponsaveis = new Array();

    if(data.data['data'].lista){
      if (data.data['data'].lista['EscRepModal']){

        $scope.escMod = data.data['data'].lista['EscRepModal'];
        $scope.escEpoca = data.data['data'].lista['EscRepEpoca'];
        $scope.escEscalao = data.data['data'].lista['EscRepEscalao'];

          for (var i = 0; i < $scope.escMod.length; i++) {
            escaloesResponsaveis[i] = new Array();
            escaloesResponsaveis[i].push($scope.escMod[i]);
            escaloesResponsaveis[i].push($scope.escEpoca[i]);
            escaloesResponsaveis[i].push($scope.escEscalao[i]);
          };
        
      }
    }

    $scope.escaloesResponsaveis = escaloesResponsaveis;


    //Inserir Nova Entidade----------------------------------------------
     $scope.novaEntidade = function (entidade, tipoE) {

      //preencher os valores escalões responsável
      $scope.escMod = []; $scope.escEpoca = []; $scope.escEscalao = [];
      
      for (var i = 0; i < escaloesResponsaveis.length; i++) {
        $scope.escMod.push(escaloesResponsaveis[i][0]);
        $scope.escEpoca.push(escaloesResponsaveis[i][1]);
        $scope.escEscalao.push(escaloesResponsaveis[i][2]);
      };

      // passar na entidade os novos valores de escalões responsável
      entidade.EscRepModal = $scope.escMod;
      entidade.EscRepEpoca = $scope.escEpoca;
      entidade.EscRepEscalao = $scope.escEscalao;

      var arrDados = new Array(entidade, tipoE);

      console.log(entidade);

            outrasEntidadesService.novaEntidade(arrDados).then(
             function(response){
                if(response.data.status=='ok'){

                    $state.go('outrasEntidades', {tipoEnt: tipoE });

                    //fechar notificações de erros e mostrar uma de sucesso
                    Notification.clearAll();
                    Notification.success({message: 'Guardado com sucesso !', delay: 3000});

              }else{

                    //mostrar notificações de erro
                    console.error(response.data.errors);

                    var msgErros = response.data.errors;
                    for (var i = 0; i <= msgErros.length - 1; i++) {
                      Notification.error({message: msgErros[i], delay: 20000});
              };
                
               }
            });

        };


      //Editar Entidade----------------------------------------------
     $scope.editarEntidade = function (entidade) {

      //preencher os valores escalões responsável
      $scope.escMod = []; $scope.escEpoca = []; $scope.escEscalao = [];
      
      for (var i = 0; i < escaloesResponsaveis.length; i++) {
        $scope.escMod.push(escaloesResponsaveis[i][0]);
        $scope.escEpoca.push(escaloesResponsaveis[i][1]);
        $scope.escEscalao.push(escaloesResponsaveis[i][2]);
      };

      // passar na entidade os novos valores de escalões responsável
      entidade.EscRepModal = $scope.escMod;
      entidade.EscRepEpoca = $scope.escEpoca;
      entidade.EscRepEscalao = $scope.escEscalao;

      console.log(entidade);

            outrasEntidadesService.editarEntidade(entidade).then(
             function(response){
                if(response.data.status=='ok'){

                    $state.go('outrasEntidadesPerfil', {entidadeID: entidade['ID'] });

	                  //fechar notificações de erros e mostrar uma de sucesso
	                  Notification.clearAll();
	                  Notification.success({message: 'Guardado com sucesso !', delay: 3000});

	            }else{

	                  //mostrar notificações de erro
	                  console.error(response.data.errors);

	                  var msgErros = response.data.errors;
	                  for (var i = 0; i <= msgErros.length - 1; i++) {
	                    Notification.error({message: msgErros[i], delay: 20000});
	            };
                
               }
            });

        };



    //Eliminar Entidade----------------------------------------------
    $scope.deleteEntidade = function (entidade, tipoE) {

    var modalInstance = $uibModal.open({
      animation:true,
      backdrop  : 'static',
      keyboard  : false,
      templateUrl: 'templates/confirmMsg.html',
      controller: function($scope){

        $scope.titulo="Entidade";
        $scope.nome=entidade.Nome;

        $scope.ok = function () {

            outrasEntidadesService.deleteEntidade(entidade).then(
             function(response){
               if(response.data.status=='ok'){

                  modalInstance.close();

                  //voltar para a página outras entidades
                   $state.go('outrasEntidades', {tipoEnt: tipoE });

                  //fechar notificações de erros e mostrar uma de sucesso
                  Notification.clearAll();
                  Notification.success({message: 'Eliminado com sucesso !', delay: 3000});

               }
            });
        };

        $scope.cancel = function () {
          modalInstance.dismiss('cancel');
        };
      },
      resolve: {
        registo: function () {
          return entidade;
        }
      }
    });

    modalInstance.result.then(function () {

    }, function () {
      console.log('Modal dismissed at: ' + new Date());
    });

  };


  //adicionar selects para a escolha dos escalões pelo qual a entidade é responsável
  $scope.novoResp = function () {
    $scope.escaloesResponsaveis.push(new Array());
  }


}]);


})();
