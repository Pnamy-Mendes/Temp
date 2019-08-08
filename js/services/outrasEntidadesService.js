'use strict';

 dashsoccer.service('outrasEntidadesService', ['$http', function ($http) {

	this.getOutrasEntidades = function (tipoEnt) {

		var promise = $http.get(Routing.generate('all_outrasEntidades')+'/'+tipoEnt);

		return promise;
	};

	this.getOutrasEntidadesPerfil = function (id) {

		var promise = $http.get(Routing.generate('all_outrasEntidadesPerfil')+'/'+id);

		return promise;
	};

	this.getDadosInserir = function (tipoEnt) {

		var promise = $http.post(Routing.generate('getDadosInserir'), tipoEnt);

		return promise;
	};

	this.novaEntidade = function (data) {

		var promise = $http.post(Routing.generate('novaEntidade'),data);

		return promise;
	};

	this.editarEntidade = function (data) {

		var promise = $http.post(Routing.generate('editarEntidade'),data);

		return promise;
	};

	this.deleteEntidade = function (data) {

		var promise = $http.post(Routing.generate('deleteEntidade'),data);

		return promise;
	};

	this.ProfileFileUpload = function (data) {

		var promise = $http.get(Routing.generate('fileUpload'), data);

		return promise;
	};
	

 }]);