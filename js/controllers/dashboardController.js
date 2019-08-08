(function() {

'use strict';

dashsoccer.controller('dashboardController', ['$scope','dashboardService', 'data', function($scope, clubeService, data){

     $scope.totalAtletas = data.data.totalAtletas;
     $scope.totalAtletasFutebol = data.data.totalAtletasFutebol;
     $scope.totalAtletasNatacao = data.data.totalAtletasNatacao;

     $scope.totalStaff = data.data.totalStaff;
     $scope.totalTreinadores = data.data.totalTreinadores;
     $scope.totalDiretores = data.data.totalDiretores;
     $scope.totalOutroStaff = data.data.totalOutroStaff;

     $scope.EscalaoNOMES = data.data.EscalaoNOMES;

     $scope.totalAtletasEscalao = data.data.totalAtletasEscalao;
     $scope.totalTreinadoresEscalao = data.data.totalTreinadoresEscalao;
     $scope.totalDiretoresEscalao = data.data.totalDiretoresEscalao;
     $scope.totalOutroStaffEscalao = data.data.totalOutroStaffEscalao;

     $scope.SelectEntidade = "Atletas";

      //GRAFICO
      $scope.labels =  $scope.EscalaoNOMES ;
      $scope.series = ['Futebol'];

      $scope.data = $scope.totalAtletasEscalao;
      $scope.tituloEntidade = "Atletas";

      $scope.options = {
        scales: {
            yAxes: [{
                ticks: {
                    min: 0,
                    stepSize: 5
                }
            }]
        }
      };

      $scope.colorsChart = [ '#FFC72B', '#FFBE2C', '#FFB42D', '#FFA72E', '#FF9D2F', '#FF9030', '#FF8430', '#FF7B31', '#FF7032', '#FF6533', '#FF5834'];

      //Função para alterar o gráfico segundo a opção escolhida no select
      $scope.updateChart = function (SelectEntidade) {
        switch(SelectEntidade) {
            case "Atletas":
                $scope.data = $scope.totalAtletasEscalao;
                $scope.tituloEntidade = "Atletas";
                break;
            case "Treinadores":
                $scope.data = $scope.totalTreinadoresEscalao;
                $scope.tituloEntidade = "Treinadores";
                break;
            case "Diretores":
                $scope.data = $scope.totalDiretoresEscalao;
                $scope.tituloEntidade = "Diretores";
                break;
            case "Outro Staff":
                $scope.data = $scope.totalOutroStaffEscalao;
                $scope.tituloEntidade = "Outro Staff";
                break;
            default:
                $scope.data = $scope.totalAtletasEscalao;
                $scope.tituloEntidade = "Atletas";
        }
      }


}]);

})();
