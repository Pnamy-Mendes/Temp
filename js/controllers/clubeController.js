(function() {

'use strict';

dashsoccer.controller('clubeController', ['$scope','clubeService', 'data', 'Notification', '$state', function($scope, clubeService,data, Notification, $state){

     $scope.clube = data.data.data;

    //Editar Dados Clube Principal----------------------------------------------
    //abrir template para edição dos Atletas
     $scope.editarDadosClube = function (info) {

            clubeService.editarDadosClube(info).then(
             function(response){
                if(response.data.status=='ok'){

                	  $state.go('clube');

	                  //fechar notificações de erros e mostrar uma de sucesso
	                  Notification.clearAll();
	                  Notification.success({message: 'Guardado com sucesso !', delay: 3000});

	            } else {

	                  //mostrar notificações de erro
	                  console.error(response.data.errors);

	                  var msgErros = response.data.errors;
	                  for (var i = 0; i <= msgErros.length - 1; i++) {
	                    Notification.error({message: msgErros[i], delay: 20000});
	            };

               }
            });

        };

}]);

})();
