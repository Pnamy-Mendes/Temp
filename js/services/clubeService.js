'use strict';

 dashsoccer.service('clubeService', ['$http', function ($http) {

	this.getclube = function () {

		var promise = $http.get(Routing.generate('all_clube'));

		return promise;
	};

	this.editarDadosClube = function (data) {

		var promise = $http.post(Routing.generate('editarDadosClube'),data);

		return promise;
	};
	

 }]);