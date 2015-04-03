/// <reference path='../definitions.d.ts' />
module hoay.settings {
  'use strict';


  interface ISettingsContentComponentController {

  }

  export class SettingsContentComponentController implements ISettingsContentComponentController {

    // @ngInject
    constructor($scope:IMainScope,
                private $translate:ng.translate.ITranslateService,
                $rootScope:ng.IRootScopeService) {
    }

  }

  angular.module('hoay.settings')
    .controller('SettingsContentComponentController',
    SettingsContentComponentController);
}

