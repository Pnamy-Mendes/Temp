dashsoccer.directive('fileUpload', function (httpPostFactory) {
    return {
        restrict: 'E',
        scope: {
            id: "@",
            model :"="
        },
        replace:true,
        templateUrl: 'templates/file-upload-directive.html',
        controller: function($scope){

            $scope.update = function(){

                $scope.$apply(function () {
                   $scope.file = $scope.filename;
                });

                console.log($scope);

            }

            $scope.upload = function(){

                httpPostFactory(Routing.generate('fileUpload'), $scope.formData, function (callback) {

                    if (callback.status == 'ok') {

                        $scope.status="ok";
                        $scope.model = callback.dataImage;

                        console.log('ficheiro enviado');
                    }

                });

            }

        },
        link: function (scope, element, attr) {

            var id = scope.id;

            element.bind('change', function (changeEvent) {

                var reader = new FileReader();

                reader.onload = function (loadEvent) {

                    scope.$apply(function () {
                        scope.fileread = loadEvent.target.result;
                    });
                }

                reader.readAsDataURL(changeEvent.target.files[0]);

                //input do ficheiro
                var file = angular.element(document.querySelector('#upload'))[0].files[0];

                scope.formData = new FormData();
                scope.formData.append('id', id);
                scope.formData.append('file', file);
                scope.filename = file.name;

                scope.update();

            });

        }
    };
});

dashsoccer.factory('httpPostFactory', function ($http) {
    return function (file, data, callback) {
        $http({
            url: file,
            method: "POST",
            data: data,
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        }).success(function (response) {
            callback(response);
        });
    };
});
