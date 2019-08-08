(function() {

'use strict';

dashsoccer.controller('atletasController', ['$scope','atletasService', 'data', 'Notification', '$uibModal','$uibModalStack','$state','Upload','$location','$timeout',
  function($scope, atletasService, data, Notification, $uibModal,$uibModalStack, $state, Upload, $location,$timeout){

      $scope.escaloes = data.data.escaloes;
      $scope.modalidades = data.data.modalidades;
      $scope.posicoes = data.data.posicoes;
      $scope.tamanhos = data.data.tamanhos;
      $scope.relacoes = data.data.relacoes;
      $scope.tiposDoc = data.data.tiposDoc;
      $scope.epocas = data.data.epocas;

      if(data.data.entidades){
        $scope.entidades = data.data.entidades;
      }
      else{
        $scope.entidades = {};
      }

      $scope.hasT2 = $scope.entidades.IDTutor2 ? true : false;


      //Inserir Atleta----------------------------------------------
     //abrir template para inserir um atleta
     $scope.novoAtleta = function (entidade) {
            atletasService.novoAtleta(entidade).then(
             function(response){
                if(response.data.status=='ok'){

                    $state.go('atletas');

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


      //Editar Atleta----------------------------------------------
     //abrir template para edição dos Atletas
     $scope.editarAtleta = function (entidade) {
          entidade.ExisteT2= (entidade.NomeTutor2==null && entidade.CCTutor2==null ) ? false : true;
          entidade.T2Staff= (entidade.CCTutor2!=null && entidade.NIFTutor2==null) ? true : false;

            atletasService.editarAtleta(entidade).then(
             function(response){
                if(response.data.status=='ok'){

                    $state.go('atletaPerfil', {entidadeID: entidade['ID'] });

	                  //fechar notificações de erros e mostrar uma de sucesso
	                  Notification.clearAll();
	                  Notification.success({message: 'Guardado com sucesso !', delay: 3000});

	            }else{

	                  //mostrar notificações de erro
	                  //console.error(response.data.errors);

	                  var msgErros = response.data.errors;
	                  for (var i = 0; i <= msgErros.length - 1; i++) {
	                    Notification.error({message: msgErros[i], delay: 20000});
	            };

               }
            });

        };

    $scope.desativarModoPagamento = function(mpe){
      var modo = { entidade: $scope.entidades.ID, modoPE: mpe.ID_Modo_Pagamento_Entidade};

      atletasService.desativarModoPagamento(modo).then(function(response){
        if (response.data.status === 'ok'){

          $scope.entidades.Epocas = response.data.epocasEntidade;
          $scope.epocas = response.data.epocas;
          mpe.Activo = 0;

          Notification.clearAll();
          Notification.success({message: 'Modo de pagamento desativado.', delay: 3000});
        }else{
          Notification.error({message: 'Erro a desativar modo de pagamento.', delay: 20000});
        }

      });
    }

    $scope.anularPagamento = function(mpe, pagamento){
      var pagamentoEntidade ={ entidade: $scope.entidades.ID, modoPE: mpe, pagamento: pagamento.ID_Pagamento};

      atletasService.anularPagamento(pagamentoEntidade).then(function(response) {
        if (response.data.status === 'ok'){

          pagamento.Pago = 0;

          Notification.clearAll();
          Notification.success({message: 'Pagamento anulado.', delay: 3000});
        }else{
          Notification.error({message: 'Erro a anular pagamento.', delay: 20000});
        }

      });
    }

    $scope.efetuarPagamento = function(mpe, pagamento){

      var pagamentoEntidade ={ entidade: $scope.entidades.ID, modoPE: mpe, pagamento: pagamento.ID_Pagamento};

      atletasService.efetuarPagamento(pagamentoEntidade).then(function(response){

        if (response.data.status === 'ok'){

          pagamento.Pago = 1;

          Notification.clearAll();
          Notification.success({message: 'Pagamento efetuado.', delay: 3000});
        }else{
          Notification.error({message: 'Erro a efetuar pagamento.', delay: 20000});
        }
      });

    }

    $scope.escolherModoPagamento = function(modo, epoca){

      var modoPagamentoEntidade = { entidade: $scope.entidades.ID, modo: modo, epoca: epoca};

      atletasService.setModoPagamento(modoPagamentoEntidade).then(function(response){

          if (response.data.status === 'ok'){
              var idx = false;

              angular.forEach($scope.epocas, function(value, key){
                if ( value.ID_epoca === epoca){
                  idx = key;
                }
              });

            $scope.epocas.splice(idx, 1);

            if (!$scope.epocas.length){
              $uibModalStack.dismissAll('');
            }

            $scope.entidades.Epocas = response.data.epocas;

            Notification.clearAll();
            Notification.success({message: 'Modo de pagamento associado com sucesso.', delay: 3000});
          }else{
            Notification.error({message: 'Erro a associar modo de pagamento.', delay: 20000});
          }
      });

    };

    $scope.showModosPagamento = function(){

      var modalInstance = $uibModal.open({
        animation:true,
        backdrop  : 'static',
        keyboard  : false,
        templateUrl: 'templates/modalModosPagamento.html',
        controller: function($scope, epocas, escolherModoPagamento){

          $scope.escolherModoPagamento = escolherModoPagamento;
          $scope.epocas = epocas;

          $scope.ok = function () {
              modalInstance.dismiss('ok');
          };

          $scope.cancel = function () {
            modalInstance.dismiss('cancel');
          };
        },
        resolve: {
          epocas: function () {
            return $scope.epocas;
          },
          escolherModoPagamento: function(){
            return $scope.escolherModoPagamento;
          }
        }
      });

    }

    $scope.saveDocumentos = function() {

        var modalInstance = $uibModal.open({
            animation: true,
            templateUrl: 'fileUploadModal',
            controller: function ($scope, tiposDoc, idEntidade, documentos) {

                $scope.documentos = documentos;
                $scope.tiposDoc = tiposDoc;

                $scope.popup = {
                    opened: false
                };
                $scope.open = function () {
                    $scope.popup.opened = true;
                };
                $scope.options = {
                    format: 'yyyy-MM-dd',
                    startingDay: 1
                };
                $scope.upload = function () {
                      var file = $scope.documento.ficheiro;

                        Upload.upload({
                            url: Routing.generate('uploadFile'),
                            data: {file: file, 'idEntidade': idEntidade},
                            resumeChunkSize: '1MB'
                        }).then(function (resp) {

                            //console.log(resp);
                            console.log('Success uploaded. Response: ' + resp.data.data.nome);

                            $scope.documento.REF_entidade = idEntidade;
                            $scope.documento.ficheiro = resp.data.data.nome;

                            atletasService.saveDocumento($scope.documento).then(function (json) {

                                if (json.data && json.data.status === 'ok') {

                                    documentos.push(json.data.documento);
                                    Notification.success({message: 'Guardado com sucesso !', delay: 3000});
                                    //upload completo, fecha o modal
                                    modalInstance.close($scope.ocorrencia);
                                } else {
                                    var msgErros = json.data.errors;
                                    for (var i = 0; i <= msgErros.length - 1; i++) {
                	                    Notification.error({message: msgErros[i], delay: 20000});
                                    }
                                }
                            });
                        }, function (resp) {
                            console.log('Error status: ' + resp.status);
                            Notification.error({message: 'Erro a guardar documento', delay: 20000});
                        }, function (evt) {

                            var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
                            if (progressPercentage > 100) {
                                progressPercentage = 100;
                            }
                            $scope.progress = progressPercentage;
                        });

                }

                $scope.cancel = function () {
                    modalInstance.dismiss('cancel');
                };
            },
            size: 'md',
            resolve: {
                tiposDoc: function () {
                    return $scope.tiposDoc;
                },
                idEntidade: function () {
                    return $scope.entidades.ID;
                },
                documentos: function () {
                    return $scope.entidades.Documentos;
                },
            }
        });

        modalInstance.result.then(function () {
        });


    };


  $scope.deleteDocumento = function(doc, idx){

      atletasService.removerDocumento(doc).then(function(response){

          if ( response.data.status === 'ok'){

            $scope.entidades.Documentos.splice(idx, 1);
            Notification.clearAll();
            Notification.success({message: 'Guardado com sucesso !', delay: 3000});

          }else{
            Notification.error({message: 'Erro a guardar documento', delay: 20000});
          }

      });

  }

    //Eliminar Atleta----------------------------------------------
    //abrir modal template para eliminar Atleta
  $scope.deleteAtleta = function (entidade) {

    var modalInstance = $uibModal.open({
      animation:true,
      backdrop  : 'static',
      keyboard  : false,
      templateUrl: 'templates/confirmMsg.html',
      controller: function($scope){

        $scope.titulo="Atleta";
        $scope.nome=entidade.Nome;

        $scope.ok = function () {

            atletasService.deleteAtleta(entidade).then(
             function(response){
               if(response.data.status=='ok'){

                  modalInstance.close();

                  //voltar para a página atletas
                  $state.go('atletas');

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

   //copiar morada do atleta para os tutores
  $scope.copiarMoradaT1 = function () {
    $scope.entidades.Morada_RuaTutor1 = $scope.entidades.Morada_Rua;
    $scope.entidades.Morada_NumeroTutor1 = $scope.entidades.Morada_Numero;
    $scope.entidades.Morada_AndarTutor1 = $scope.entidades.Morada_Andar;
    $scope.entidades.Morada_CodPostal4Tutor1 = $scope.entidades.Morada_CodPostal4;
    $scope.entidades.Morada_CodPostal3Tutor1 = $scope.entidades.Morada_CodPostal3;
    $scope.entidades.Morada_LocalidadeTutor1 = $scope.entidades.Morada_Localidade;
  }

  $scope.copiarMoradaT2 = function () {
    $scope.entidades.Morada_RuaTutor2 = $scope.entidades.Morada_Rua;
    $scope.entidades.Morada_NumeroTutor2 = $scope.entidades.Morada_Numero;
    $scope.entidades.Morada_AndarTutor2 = $scope.entidades.Morada_Andar;
    $scope.entidades.Morada_CodPostal4Tutor2 = $scope.entidades.Morada_CodPostal4;
    $scope.entidades.Morada_CodPostal3Tutor2 = $scope.entidades.Morada_CodPostal3;
    $scope.entidades.Morada_LocalidadeTutor2 = $scope.entidades.Morada_Localidade;
  }

  $scope.toogleEquipamento = function(){
    $scope.entidades.Equipamento_Nome = null;
    $scope.entidades.Equipamento_Numero = null;
    $scope.entidades.Equipamento_TamanhoID = null;
  }

  $scope.toggleTutor2 = function() {
    $scope.hasT2 = !$scope.hasT2;

    $scope.entidades.IDTutor2 = null;
    $scope.entidades.TipoTutor2 = null;
    $scope.entidades.NomeTutor2 = null;
    $scope.entidades.CCTutor2 = null;
    $scope.entidades.NIFTutor2 = null;
    $scope.entidades.TelfTutor2 = null;
    $scope.entidades.TelmTutor2 = null;
    $scope.entidades.EmailTutor2 = null;
    $scope.entidades.Morada_RuaTutor2 = null;
    $scope.entidades.Morada_NumeroTutor2 = null;
    $scope.entidades.Morada_AndarTutor2 = null;
    $scope.entidades.Morada_CodPostal4Tutor2 = null;
    $scope.entidades.Morada_CodPostal3Tutor2 = null;
    $scope.entidades.Morada_LocalidadeTutor2 = null;
  }



}]);

})();
