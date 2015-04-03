/// <reference path='../definitions.d.ts' />
module hoay.calculate {
  'use strict';


  export class CalculatePageController {

    // @ngInject
    constructor(private $state:angular.ui.IStateService) {
      console.log('CalculatePageController');
    }
  }

  hoay.common.util.applyMixins(CalculatePageController, [
    hoay.common.navigation.NavigationMixin
  ]);

  angular.module('hoay.calculate')
    .controller('CalculatePageController', CalculatePageController);
}

