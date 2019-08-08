'use strict';

 dashsoccer.service('dashboardService', ['$http', function ($http) {


	this.getTotais = function () {

		var promise = $http.get(Routing.generate('dashboardTotais'));

		return promise;
	};


	

 }]);