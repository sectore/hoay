/// <reference path='../definitions.d.ts' />
module hoay.calculate {
  'use strict';


  interface IResultContentComponentController {

  }

  export class ResultContentComponentController implements IResultContentComponentController {



    // @ngInject
    constructor($scope:IMainScope,
                private $translate:angular.translate.ITranslateService,
                $rootScope:angular.IRootScopeService,
                public dateModel:hoay.common.date.DateModel) {
    }

  }

  angular.module('hoay.result')
    .controller('ResultContentComponentController',
    ResultContentComponentController);
}

