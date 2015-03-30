/// <reference path='../definitions.d.ts' />
module hoay.info {
  'use strict';

  export class InfoPageController {

  }

  hoay.common.util.applyMixins(InfoPageController, [
    hoay.common.navigation.NavigationMixin
  ]);


  angular.module('hoay.info')
    .controller('InfoPageController', InfoPageController);
}

