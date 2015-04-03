/// <reference path='../definitions.d.ts' />
module hoay.settings {
  'use strict';

  export class SettingsPageController {

  }

  hoay.common.util.applyMixins(SettingsPageController, [
    hoay.common.navigation.NavigationMixin
  ]);


  angular.module('hoay.settings')
    .controller('SettingsPageController', SettingsPageController);
}

