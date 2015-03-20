/// <reference path='../../definitions.d.ts' />
var typeScriptIonicApp;
(function (typeScriptIonicApp) {
    var components;
    (function (components) {
        var home;
        (function (home) {
            // this export lets us directly initialize this during tests
            var HomeController = (function () {
                function HomeController($scope, $state, $ionicHistory, SampleDataService) {
                    this.$scope = $scope;
                    this.$state = $state;
                    this.$ionicHistory = $ionicHistory;
                    this.SampleDataService = SampleDataService;
                    console.log('home loaded!');
                    // 'vm' stands for 'view model'. An additional benefit to this is to prevent primatives getting
                    // assigned to the scope directly
                    $scope.vm = this;
                    this.data = SampleDataService.getData();
                }
                HomeController.prototype.doLogout = function () {
                    console.log('logout called');
                    this.$state.go('app.login', {}, { location: 'replace' });
                    this.$ionicHistory.nextViewOptions({
                        disableBack: true
                    });
                };
                return HomeController;
            })();
            home.HomeController = HomeController;
            function setRouteState($stateProvider) {
                var state = {
                    url: '/home',
                    views: {
                        menuContent: {
                            templateUrl: 'components/home/home.html',
                            controller: 'HomeController'
                        }
                    }
                };
                $stateProvider.state('app.home', state);
            }
            home.app = home.app || angular.module('typeScriptIonicApp.components.home', ['ionic']);
            home.app.controller('HomeController', HomeController);
            home.app.config(setRouteState);
        })(home = components.home || (components.home = {}));
    })(components = typeScriptIonicApp.components || (typeScriptIonicApp.components = {}));
})(typeScriptIonicApp || (typeScriptIonicApp = {}));
