'use strict';

 dashsoccer.service('parametrosService', ['$http', function ($http) {

	this.getParametros = function () {

		var promise = $http.get(Routing.generate('all_parametros'));

		return promise;
	};

  this.getEpoca = function(id){
    var promise = $http.get(Routing.generate('getEpoca')+'/'+id);

    return promise;
  };

  this.editarModoPagamento = function(data){
    var promise = $http.post(Routing.generate('editarModoPagamento'), data);

    return promise;
  }

  this.removeModoPagamento = function(data){
    var promise = $http.post(Routing.generate('removeModoPagamento'), data);

    return promise;
  }

  this.addModoPagamento = function(data){
    var promise = $http.post(Routing.generate('addModoPagamento'), data);

    return promise;
  }

  this.editarPagamento = function(data){
    var promise = $http.post(Routing.generate('editarPagamento'), data);

    return promise;
  }

  this.addPagamento = function(data){
    var promise = $http.post(Routing.generate('addPagamento'), data);

    return promise;
  }

  this.removePagamento = function(data){
    var promise = $http.post(Routing.generate('removePagamento'), data);

    return promise;
  }

	this.NovoClube = function (data) {

		var promise = $http.post(Routing.generate('insertClube'),data);

		return promise;
	};

	this.EditarClube = function (data) {

		var promise = $http.post(Routing.generate('editClube'),data);

		return promise;
	};


	this.deleteClube = function (data) {

		var promise = $http.post(Routing.generate('deleteClube'),data);

		return promise;
	};

	this.NovaEpoca = function (data) {

		var promise = $http.post(Routing.generate('insertEpoca'),data);

		return promise;
	};

	this.EditarEpoca = function (data) {

		var promise = $http.post(Routing.generate('editEpoca'),data);

		return promise;
	};

	this.deleteEpoca = function (data) {

		var promise = $http.post(Routing.generate('deleteEpoca'),data);

		return promise;
	};

	this.NovoEscalao = function (data) {

		var promise = $http.post(Routing.generate('insertEscalao'),data);

		return promise;
	};

	this.EditarEscalao = function (data) {

		var promise = $http.post(Routing.generate('editEscalao'),data);

		return promise;
	};

	this.deleteEscalao = function (data) {

		var promise = $http.post(Routing.generate('deleteEscalao'),data);

		return promise;
	};

	this.NovaModalidade = function (data) {

		var promise = $http.post(Routing.generate('insertModalidade'),data);

		return promise;
	};

	this.EditarModalidade = function (data) {

		var promise = $http.post(Routing.generate('editModalidade'),data);

		return promise;
	};

	this.deleteModalidade = function (data) {

		var promise = $http.post(Routing.generate('deleteModalidade'),data);

		return promise;
	};


 }]);
