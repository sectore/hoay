/// <reference path="../definitions.d.ts" />
var typeScriptIonicApp;
(function (typeScriptIonicApp) {
    var AppController = (function () {
        function AppController($scope) {
            this.$scope = $scope;
            console.log('app loaded');
            // 'vm' stands for 'view model'. An additional benefit to this is to prevent primatives getting
            // assigned to the scope directly
            $scope.vm = this;
        }
        return AppController;
    })();
    typeScriptIonicApp.app = typeScriptIonicApp.app || angular.module('typeScriptIonicApp');
    typeScriptIonicApp.app.controller('AppController', AppController);
})(typeScriptIonicApp || (typeScriptIonicApp = {}));
