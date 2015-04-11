/// <reference path='../../definitions.d.ts' />
module hoay.calculate {
  'use strict';

  export class DateButtonComponentController {

    label:string;
    subLabel:string;

    // @ngInject
    constructor(private $scope: angular.IScope,
                private $attrs: angular.IAttributes) {
    }

  }

  angular.module('hoay.common.date')
    .controller('DateButtonComponentController', DateButtonComponentController);
}

