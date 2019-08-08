'use strict';

 dashsoccer.service('atletasService', ['$http', function ($http) {

	this.getatletas = function () {

		var promise = $http.get(Routing.generate('all_atletas'));

		return promise;
	};

	this.getPerfilAtleta = function (id) {

		var promise = $http.get(Routing.generate('all_atletaPerfil')+'/'+id);

		return promise;
	};

	this.getDadosInserir = function () {

		var promise = $http.get(Routing.generate('dadosInserirAtleta'));

		return promise;
	};

  this.guardarPagamento = function(pagamento){
    var promise = $http.post(Routing.generate('guardarPagamento'), pagamento);

    return promise;
  };

  this.removerPagamento = function(pagamento){
    var promise = $http.post(Routing.generate('removerPagamento'), pagamento);

    return promise;
  };


	this.novoAtleta = function (data) {

		var promise = $http.post(Routing.generate('novoAtleta'),data);

		return promise;
	};

	this.editarAtleta = function (data) {

		var promise = $http.post(Routing.generate('editarAtleta'),data);

		return promise;
	};

	this.deleteAtleta = function (data) {

		var promise = $http.post(Routing.generate('deleteAtleta'),data);

		return promise;
	};

  this.saveDocumento = function (documento){
    var promise = $http.post(Routing.generate('saveDocumentoAtleta'), documento);

    return promise;

  }
  this.removerDocumento = function(documento){
    var promise = $http.post(Routing.generate('removerDocumentoAtleta'), documento);

    return promise;
  }

  this.setModoPagamento = function(modoPagamento){
    var promise = $http.post(Routing.generate('associarModoPagamentoAtleta'), modoPagamento);

    return promise;
  }

  this.efetuarPagamento = function(pagamento){
    var promise = $http.post(Routing.generate('efetuarPagamentoAtleta'), pagamento);

    return promise;
  }

  this.anularPagamento = function(pagamento){
    var promise = $http.post(Routing.generate('anularPagamentoAtleta'), pagamento);

    return promise;
  }

  this.desativarModoPagamento = function(modo){
    var promise = $http.post(Routing.generate('desativarModoPagamentoAtleta'), modo);

    return promise;
  }



 }]);
