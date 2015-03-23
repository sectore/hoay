/// <reference path='../definitions.d.ts' />
module hoay.calculate {
  'use strict';

  export class CalculatePageController {

    constructor(private $scope:IMainScope) {
      // Content
      console.log('CalculatePageController');
      $scope.vm = this;
    }

    clickNavBarRight():void {
      console.log('right clicked');
    }

    clickNavBarLeft():void {
      console.log('left clicked');
    }

  }

  angular.module('hoay.calculate')
    .controller('CalculatePageController', CalculatePageController);
}

