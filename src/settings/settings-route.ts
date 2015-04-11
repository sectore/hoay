/// <reference path='../definitions.d.ts' />

module hoay.settings {
  'use strict';

  angular.module('hoay.settings')

    .constant('SETTINGS_PATH', '/settings')

    .config(($stateProvider:angular.ui.IStateProvider, SETTINGS_PATH:string) => {

      $stateProvider.state('settings', {
        url: SETTINGS_PATH,
        templateUrl: 'settings/settings-page.html',
        controller: 'SettingsPageController as ctrl'
      });

    });
}

