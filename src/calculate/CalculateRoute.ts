/// <reference path='../definitions.d.ts' />

module hoay.calculate {
  'use strict';

  angular.module('hoay.calculate')
    .constant('CALCULATE_PATH', '/')
    .config(($stateProvider:ng.ui.IStateProvider, CALCULATE_PATH:string) => {

      $stateProvider.state('calculate', {
        url: CALCULATE_PATH,
        templateUrl: 'calculate/calculate.html',
        controller: 'CalculatePageController as calculatePageCtrl'
      });

    });
}

