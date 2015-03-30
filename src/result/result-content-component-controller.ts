/// <reference path='../definitions.d.ts' />
module hoay.calculate {
  'use strict';


  interface IResultContentComponentController {

  }

  export class ResultContentComponentController implements IResultContentComponentController {



    // @ngInject
    constructor($scope:IMainScope,
                private $translate:ng.translate.ITranslateService,
                $rootScope:ng.IRootScopeService) {
    }

  }

  angular.module('hoay.result')
    .controller('ResultContentComponentController',
    ResultContentComponentController);
}

