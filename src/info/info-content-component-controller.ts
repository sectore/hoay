/// <reference path='../definitions.d.ts' />
module hoay.info {
  'use strict';


  interface IInfoContentComponentController {

  }

  export class InfoContentComponentController implements IInfoContentComponentController {

    // @ngInject
    constructor($scope:IMainScope,
                private $translate:angular.translate.ITranslateService,
                $rootScope:angular.IRootScopeService) {
    }

  }

  angular.module('hoay.info')
    .controller('InfoContentComponentController',
    InfoContentComponentController);
}

