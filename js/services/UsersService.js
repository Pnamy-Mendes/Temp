'use strict';

 dashsoccer.service('UsersService', ['$http', function ($http) {

	this.getUsers = function () {

		var promise = $http.get(Routing.generate('all_utilizadores'));

		return promise;
	};

	this.getUser = function () {

		var promise = $http.get(Routing.generate('getUser'));

		return promise;
	};

	this.EditarUser = function (data) {

		var promise = $http.post(Routing.generate('editUser'),data);

		return promise;
	};

	this.NovoUser = function (data) {

		var promise = $http.post(Routing.generate('insertUser'),data);

		return promise;
	};

	this.deleteUser = function (data) {

		var promise = $http.post(Routing.generate('deleteUser'),data);

		return promise;
	};
	

 }]);