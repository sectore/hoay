/// <reference path='../../definitions.d.ts' />
module hoay.calculate {
  'use strict';

  export class DateButtonComponentController {

    label:string;
    subLabel:string;

    // @ngInject
    constructor(private $scope: ng.IScope,
                private $attrs: ng.IAttributes) {
    }

  }

  angular.module('hoay.calculate')
    .controller('DateButtonComponentController', DateButtonComponentController);
}

