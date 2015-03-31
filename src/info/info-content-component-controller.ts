/// <reference path='../definitions.d.ts' />
module hoay.info {
  'use strict';


  interface IInfoContentComponentController {

  }

  export class InfoContentComponentController implements IInfoContentComponentController {

    // @ngInject
    constructor($scope:IMainScope,
                private $translate:ng.translate.ITranslateService,
                $rootScope:ng.IRootScopeService) {
    }

  }

  angular.module('hoay.info')
    .controller('InfoContentComponentController',
    InfoContentComponentController);
}

