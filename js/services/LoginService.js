'use strict';

 dashsoccer.service('LoginService', ['$http', function ($http) {


	this.getLoginDados = function () {

		var promise = $http.get(Routing.generate('getUserDados'));

		return promise;
	};

	

 }]);