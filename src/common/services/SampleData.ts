/// <reference path='../../definitions.d.ts' />

module hoay.common.services {

    export interface ISampleData {
        getData: () => string;
    }

    export class SampleData implements ISampleData {
        static $inject = ['$log'];

        constructor(private $log:ng.ILogService) {
        }

        getData():string {
            this.$log.log('getData() called');
            return 'LoremIpsum';
        }
    }

    export var app:ng.IModule = app || angular.module('hoay.common.services', ['ionic']);
    app.service('SampleDataService', SampleData);
}
