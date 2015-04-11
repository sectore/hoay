/// <reference path='../../definitions.d.ts' />

module hoay.components.home {
    export interface IHomeScope extends hoay.common.ICoreScope {
        vm: {
            doLogout: () => void;
            data: string;
        }
    }

    // this export lets us directly initialize this during tests
    export class HomeController {
        public data:string;

        constructor(public $scope:IHomeScope, private $state:angular.ui.IStateService, private $ionicHistory, private SampleDataService) {
            console.log('home loaded!');
            // 'vm' stands for 'view model'. An additional benefit to this is to prevent primatives getting
            // assigned to the scope directly
            $scope.vm = this;
            this.data = SampleDataService.getData();
        }

        doLogout() {
            console.log('logout called');
            this.$state.go('app.login', {}, {location: 'replace'});
            this.$ionicHistory.nextViewOptions({
                disableBack: true
            });
        }
    }

    function setRouteState($stateProvider:angular.ui.IStateProvider) {
        var state:angular.ui.IState = {
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

    export var app:angular.IModule = app || angular.module('hoay.components.home', ['ionic']);
    app.controller('HomeController', HomeController);
    app.config(setRouteState);
}
