/// <reference path='../definitions.d.ts' />
module hoay.result {
  'use strict';

  export class ResultPageController {

  }

  hoay.common.util.applyMixins(ResultPageController, [
    hoay.common.navigation.NavigationMixin
  ]);


  angular.module('hoay.result')
    .controller('ResultPageController', ResultPageController);
}

