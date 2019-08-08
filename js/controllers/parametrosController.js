(function() {

'use strict';

dashsoccer.controller('parametrosController', ['$scope','parametrosService', 'data', '$uibModal', 'Notification', function($scope, parametrosService,data, $uibModal, Notification){


     $scope.modalidades = data.data.modalidades;
     $scope.escaloes = data.data.escaloes;
     $scope.clubes = data.data.clubes;
     $scope.epocas = data.data.epocas;
     //$scope.equipamentoNrMinimo = data.data.equipamentoNrMinimo;
     //$scope.equipamentoNrMaximo=data.data.equipamentoNrMaximo;
     
     var listaClubes = data.data.clubes;
     var listaEpocas = data.data.epocas;
     var listaModalidades = data.data.modalidades;
     var listaEscaloes = data.data.escaloes;

    //EDITAR Registo-------------------------------------------------------------------------------------
    //abrir modal template para edição e novo registo
    $scope.EditData = function (registo, ent, tarefa) {

    var modalInstance = $uibModal.open({
      animation:true,
      backdrop  : 'static',
      keyboard  : false,
      templateUrl: 'templates/edit'+ ent +'.html',
      controller: function($scope, registo, epocas){

        $scope.registo=registo;
        $scope.titulo=tarefa;
        $scope.epocas=epocas;

         $scope.modalidades = data.data.modalidades;
     $scope.escaloes = data.data.escaloes;
     $scope.clubes = data.data.clubes;
     $scope.epocas = data.data.epocas;
        
     console.log($scope.registo)
         $scope.ok = function (ent, tarefa) {

          var action = tarefa+ent;

          parametrosService[action]($scope.registo).then(
           function(response){
             if(response.data.status=='ok'){


               modalInstance.close(response.data.dados);

                if(tarefa=="Novo" || tarefa=="Nova"){
                  //acrescentar novo registo na tabela
                  console.log([response.data.ent]);
                  $scope[response.data.ent].push(response.data.dados);
                }

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

        $scope.cancel = function () {
          modalInstance.dismiss('cancel');

        };
      },
      resolve: {
        registo: function () {
          return registo;
        },
        epocas: function () {
          return $scope.epocas;
        }
      }
    });

    //dados do registo
    modalInstance.result.then(function () {

   }, function () {


              console.log('Modal dismissed at: ' + new Date());
            });

  };

    //ELIMINAR Registo---------------------------------------------------------------------------
    //abrir modal template para eliminar-----------------------------
    $scope.deleteData = function (registo, ent) {

    var modalInstance = $uibModal.open({
      animation:true,
      backdrop  : 'static',
      keyboard  : false,
      templateUrl: 'templates/confirmMsg.html',
      controller: function($scope, registo){

        $scope.registo=registo;
        $scope.titulo=ent;
        $scope.nome=registo.Nome;

        $scope.ok = function () {

           var action = 'delete'+ent;
           var indexDel;
           var group;

           if (listaClubes.indexOf(registo) != -1){
              group = listaClubes;
           }
           if (listaEpocas.indexOf(registo) != -1){
              group = listaEpocas;
           }
           if (listaEscaloes.indexOf(registo) != -1){
              group = listaEscaloes;
           }
           if (listaModalidades.indexOf(registo) != -1){
              group = listaModalidades;
           }

           indexDel = group.indexOf(registo);

           parametrosService[action](registo).then(
             function(response){
               if(response.data.status=='ok'){

                  modalInstance.close();

                  // remove da tabela o registo eliminado
                  group.splice(indexDel, 1);

                  //fechar notificações de erros e mostrar uma de sucesso
                  Notification.clearAll();
                  Notification.success({message: 'Eliminado com sucesso !', delay: 3000});

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

        $scope.cancel = function () {
          modalInstance.dismiss('cancel');
        };
      },
      resolve: {
        registo: function () {
          return registo;
        }
      }
    });

    // dados do registo eliminado
    modalInstance.result.then(function () {

    }, function () {
      console.log('Modal dismissed at: ' + new Date());
    });

  };




}]);

})();
