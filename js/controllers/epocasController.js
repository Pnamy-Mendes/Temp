(function() {

'use strict';

dashsoccer.controller('epocasController', ['$scope','parametrosService', 'data', '$uibModal', 'Notification', function($scope, parametrosService,data, $uibModal, Notification){

  $scope.epoca = data.data.epoca;

  $scope.newModo = { Descricao: '', REF_Epoca: $scope.epoca.IDEpoca, Pagamentos: []};

  $scope.addModo = function(){
    parametrosService.addModoPagamento($scope.newModo).then(function(response){
      if(response.data.status === 'ok'){
        $scope.epoca.ModosPagamento.push(response.data.modo);
        $scope.newModo = { Descricao: '', REF_Epoca: $scope.epoca.IDEpoca, Pagamentos: []};

        Notification.success({message: 'Modo Pagamento adicionado!', delay: 3000});
      }else{
          Notification.error({message: 'Erro a remover modo pagamento!', delay: 20000});
      }
    });
  }

  $scope.detailsModo = function(modoPagamento){
    var modalInstance = $uibModal.open({
      animation:true,
      backdrop  : 'static',
      size: 'lg',
      keyboard  : false,
      templateUrl: 'templates/pagamentos.html',
      controller: function($scope){

        $scope.titulo= "Pagamentos";

        $scope.modo = modoPagamento;
        $scope.pagamentos = modoPagamento.Pagamentos;

        $scope.makeNewPagamento = function(){
          var pagamento =  {
            Descricao: '',
            Valor: '',
            DataLimite: '',
            ValorPosLimite: '',
            Benificio: false,
            DescricaoBenificio: '',
            REF_ModoPagamento: modoPagamento.IDModo
          };

          return pagamento;
        }

        $scope.new = $scope.makeNewPagamento();

        $scope.editarPagamento = function(pagamentoForm, idPagamento){
          var pagamento = pagamentoForm.$data;

          pagamento.ID_Pagamento = idPagamento;

          //colocar prompt
          var confirmInstance = $uibModal.open({
            templateUrl: 'confirmPagamento.html',
            animation:true,
            backdrop  : 'static',
            keyboard: false,

            controller: function($scope, parametrosService, pagamento, rowform, Notification, modo){
                $scope.setPagamento = function(pagamento){
                  var idx = -1;

                  angular.forEach(modo.Pagamentos, function(aux, i){
                    if (aux.ID_Pagamento == pagamento.ID_Pagamento){
                      idx = i;
                    }
                  });

                  if ( idx > 0){
                    modo.Pagamentos[idx] = pagamento;
                  }
                }

                $scope.yes = function(){
                  pagamento.alterarPagamentosEntidade = true;


                  parametrosService.editarPagamento(pagamento).then(function(response){
                    if (response.data.status === 'ok'){
                      confirmInstance.dismiss('yes');

                      $scope.setPagamento(pagamento);

                      rowform.$hide();
                      Notification.success({message: 'Pagamento guardado!', delay: 3000});
                    }else{
                      Notification.error({message: 'Erro a editar pagamento!', delay: 20000});
                    }
                  });
                };

                $scope.no = function(){
                  pagamento.alterarPagamentosEntidade = false;
                  parametrosService.editarPagamento(pagamento).then(function(response){
                    if (response.data.status === 'ok'){
                      confirmInstance.dismiss('no');

                      $scope.setPagamento(pagamento);

                      rowform.$hide();
                      Notification.success({message: 'Pagamento guardado!', delay: 3000});
                    }else{
                      Notification.error({message: 'Erro a editar pagamento!', delay: 20000});
                    }
                  });
                }

                $scope.cancel = function(){
                  confirmInstance.dismiss('cancel');
                }
            },
            resolve: {
              parametrosService: function () {
                return parametrosService;
              },
              pagamento: function(){
                return pagamento;
              },
              rowform : function(){
                return pagamentoForm;
              },
              modo : function(){
                return $scope.modo;
              }
            }
          });

        }

        $scope.removePagamento = function(pagamento){

          parametrosService.removePagamento(pagamento).then(function(response){
            if (response.data.status === 'ok'){
              var idx = $scope.pagamentos.indexOf(pagamento);
              $scope.pagamentos.splice(idx, 1);
              Notification.success({message: 'Pagamento removido!', delay: 3000});

            }else{
              if (response.data.errors === 'fk_exception'){
                Notification.error({message: 'Erro a remover pagamento! Pagamento encontra-se associado a atletas.', delay: 20000});

              }else{
                Notification.error({message: 'Erro a remover pagamento!', delay: 20000});
              }

            }

          });

        }


        $scope.addPagamento = function(){
          parametrosService.addPagamento($scope.new).then(function(response){
            if (response.data.status === 'ok'){
                Notification.success({message: 'Pagamento adicionado!', delay: 3000});
                $scope.modo.Pagamentos.push($scope.new);
                $scope.addPagamentoForm.$cancel();
                $scope.new = $scope.makeNewPagamento();
            }else{
              Notification.error({message: 'Erro a adicionar pagamento!', delay: 20000});
            }
          });
        }

        $scope.cancel = function () {
          modalInstance.dismiss('cancel');
        };

      }
    });
  }

  $scope.editModo = function(modoPagamento){
    var modalInstance = $uibModal.open({
      animation:true,
      backdrop  : 'static',
      keyboard  : false,
      templateUrl: 'templates/modopagamento.html',
      controller: function($scope){

        $scope.titulo= "Modo Pagamento";

        $scope.modo = angular.copy(modoPagamento);

        $scope.ok = function(){

          //var data = {IDModo: $scope.modo.IDModo, Descricao: this.editModoFrm.descricao, Activo: this.editModoFrm.checkbox_activo};

          //console.log(data);


          parametrosService.editarModoPagamento($scope.modo).then(function(response){

            if(response.data.status === 'ok'){
                modoPagamento.Descricao = $scope.modo.Descricao;
                modoPagamento.Activo = $scope.modo.Activo;
                modalInstance.close();
                Notification.success({message: 'Modo Pagamento alterado!', delay: 3000});
            }else{
              Notification.error({message: 'Erro a alterar modo de pagamento!', delay: 20000});
            }
          });


        }

        $scope.cancel = function () {
          modalInstance.dismiss('cancel');
        };

      }
    });
  }

  $scope.removeModo = function(modoPagamento){
    parametrosService.removeModoPagamento(modoPagamento).then(function(response){

      if (response.data.status === 'ok'){
      var idx = $scope.epoca.ModosPagamento.indexOf(modoPagamento);
      $scope.epoca.ModosPagamento.splice(idx, 1);
      Notification.success({message: 'Modo pagamento removido!', delay: 3000});
    }else{

      if (response.data.errors === 'fk_exception'){
        Notification.error({message: 'Erro a remover modo pagamento! Modo de pagamento encontra-se associado a atletas.', delay: 20000});

      }else{
        Notification.error({message: 'Erro a remover modo pagamento!', delay: 20000});
      }
    }
  });
  }





}]);

})();
