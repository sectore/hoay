/// <reference path='../definitions.d.ts' />

module hoay.info {
  'use strict';

  angular.module('hoay.info')

    .constant('INFO_PATH', '/info')

    .config(($stateProvider:angular.ui.IStateProvider, INFO_PATH:string) => {

      $stateProvider.state('info', {
        url: INFO_PATH,
        templateUrl: 'info/info-page.html',
        controller: 'InfoPageController as ctrl'
      });

    });
}

