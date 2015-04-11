/// <reference path='../definitions.d.ts' />
module hoay.settings {
  'use strict';


  interface ISettingsContentComponentController {

  }

  export class SettingsContentComponentController implements ISettingsContentComponentController {

    // @ngInject
    constructor($scope:IMainScope,
                private $translate:angular.translate.ITranslateService,
                $rootScope:angular.IRootScopeService) {
    }

  }

  angular.module('hoay.settings')
    .controller('SettingsContentComponentController',
    SettingsContentComponentController);
}

