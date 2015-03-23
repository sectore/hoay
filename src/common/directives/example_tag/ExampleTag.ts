/// <reference path='../../../definitions.d.ts' />

module hoay.common.directives {
    export interface IExampleTagDirectiveScope extends hoay.common.ICoreScope {
        vm: {
        }
    }

    export class ExampleTagDirective implements ng.IDirective {
        public restrict = 'E';
        public templateUrl = 'common/directives/example_tag/index.html';
        public controller = 'ExampleTagDirectiveController';
        public scope = {};

        constructor() {
        }
    }

    export class ExampleTagDirectiveController {
        constructor(public $scope:IExampleTagDirectiveScope) {
            $scope.vm = this;
        }
    }

    // this module is re-declared per directive
    export var app:ng.IModule = app || angular.module('hoay.common.directives', ['templates', 'ionic']);
    app.directive('exampleTag', () => new ExampleTagDirective());
    app.controller('ExampleTagDirectiveController', ExampleTagDirectiveController);

}
