(function() {

'use strict';

dashsoccer.controller('UsersController', ['$scope','UsersService', 'data', '$uibModal', 'Notification', '$rootScope',  function($scope,UsersService,data, $uibModal, Notification, $rootScope){


    $scope.users = data.data.data;
    $scope.userNome = data.data['userNome'];
    $rootScope.userRole = data.data['userRole'];

    var listaUsers =  $scope.users;


    //Utilizadores----------------------------------------------
    //abrir modal template para edição dos Utilizadores
    $scope.EditUser = function (user, tarefa) {

    var modalInstance = $uibModal.open({
      animation:true,
      backdrop  : 'static',
      keyboard  : false,
      templateUrl: 'templates/editUser.html',
      controller: function($scope, utilizador){
 
        $scope.user = utilizador;
        $scope.titulo = tarefa;

         $scope.ok = function () {
       
            var action = tarefa+'User';

            UsersService[action]($scope.user).then(
             function(response){
               if(response.data.status=='ok'){
               
                  if(action=="NovoUser"){
                    //acrescentar novo registo na tabela
                    listaUsers.push(response.data.dados);
                  }

                  modalInstance.close();

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
          //fechar notificações de erros
          Notification.clearAll();
        };
      },
      resolve: {
        utilizador: function () {
          return user;
        }
      }
    });

    //dados da edição dos Utilizadores
    modalInstance.result.then(function () {
   
   }, function () {
              console.log('Modal dismissed at: ' + new Date());
            });

  };

  //Eliminar Utilizador----------------------------------------------
    //abrir modal template para eliminar Utilizador
    $scope.deleteUser = function (user) {

    var modalInstance = $uibModal.open({
      animation:true,
      backdrop  : 'static',
      keyboard  : false,
      templateUrl: 'templates/confirmMsg.html',
      controller: function($scope){

        $scope.user=user;
        $scope.titulo="utilizador";
        $scope.nome=user.Nome;

        $scope.ok = function () {
          var action = 'deleteUser';
          var indexDel = listaUsers.indexOf($scope.user);

            UsersService[action]($scope.user).then(
             function(response){
               if(response.data.status=='ok'){
                
                  // remove da tabela o registo eliminado
                  listaUsers.splice(indexDel, 1);

                  modalInstance.close();

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
          return user;
        }
      }
    });

    
    modalInstance.result.then(function () {

    }, function () {
      console.log('Modal dismissed at: ' + new Date());
    });

  };



      //edição dos Utilizadores
    $scope.EditPasswordOnly = function (user) {

        $scope.user = user;

        UsersService.EditarUser($scope.user).then(
         function(response){
           if(response.data.status=='ok'){
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



}]);

})();
