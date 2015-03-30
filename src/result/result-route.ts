/// <reference path='../definitions.d.ts' />

module hoay.result {
  'use strict';

  angular.module('hoay.result')
    .constant('RESULT_PATH', '/result')
    .config(($stateProvider:ng.ui.IStateProvider, RESULT_PATH:string) => {

      $stateProvider.state('result', {
        url: RESULT_PATH,
        templateUrl: 'result/result.html',
        controller: 'ResultPageController as resultPageCtrl'
      });

    });
}

