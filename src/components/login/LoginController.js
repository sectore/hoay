/// <reference path='../../definitions.d.ts' />
var typeScriptIonicApp;
(function (typeScriptIonicApp) {
    var components;
    (function (components) {
        var login;
        (function (login) {
            var LoginController = (function () {
                function LoginController($scope, $state, $ionicHistory) {
                    this.$scope = $scope;
                    this.$state = $state;
                    this.$ionicHistory = $ionicHistory;
                    this.username = 'default';
                    console.log('Login loaded');
                    // 'vm' stands for 'view model'. An additional benefit to this is to prevent primatives getting
                    // assigned to the scope directly
                    $scope.vm = this;
                }
                LoginController.prototype.doLogin = function () {
                    console.log('login called for ' + this.username);
                    this.$state.go('app.home', {}, { location: 'replace' });
                    this.$ionicHistory.nextViewOptions({
                        disableBack: true
                    });
                };
                return LoginController;
            })();
            login.LoginController = LoginController;
            function loginConfig($stateProvider) {
                var state = {
                    url: '/login',
                    views: {
                        menuContent: {
                            templateUrl: 'components/login/login.html',
                            controller: 'LoginController'
                        }
                    }
                };
                $stateProvider.state('app.login', state);
            }
            login.app = login.app || angular.module('typeScriptIonicApp.components.login', ['ionic']);
            login.app.controller('LoginController', LoginController);
            login.app.config(loginConfig);
        })(login = components.login || (components.login = {}));
    })(components = typeScriptIonicApp.components || (typeScriptIonicApp.components = {}));
})(typeScriptIonicApp || (typeScriptIonicApp = {}));
