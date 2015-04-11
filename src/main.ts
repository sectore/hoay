/// <reference path='./definitions.d.ts' />

module hoay {

  angular
    .module('hoay', [
      'ionic',
      'LocalStorageModule',
      'pascalprecht.translate',
      'templates',
      'hoay.common.date',
      'hoay.calculate',
      'hoay.result',
      'hoay.settings',
      'hoay.info'
    ])

    .run(($ionicPlatform) => {
      $ionicPlatform.ready(function () {
        // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
        // for form inputs)
        if (window.cordova && window.cordova.plugins.Keyboard) {
          window.cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
        }

        if (window.StatusBar) {
          // org.apache.cordova.statusbar required
          window.StatusBar.styleDefault();
        }
      });
    })

    .config(($stateProvider:angular.ui.IStateProvider,
             $urlRouterProvider:angular.ui.IUrlRouterProvider,
             $locationProvider:angular.ILocationProvider,
             CALCULATE_PATH:string,
             RESULT_PATH:string) => {
      // if none of the above states are matched, use this as the fallback
      $urlRouterProvider.otherwise('/');
      //$urlRouterProvider.otherwise(CALCULATE_PATH);
      //$urlRouterProvider.otherwise(RESULT_PATH);

      // html5Mode (deactivated by using cordova)
      $locationProvider.html5Mode(!window.cordova);
      //$locationProvider.html5Mode(false);
    })

    .config(($translateProvider) => {
      $translateProvider.useStaticFilesLoader({
        prefix: 'locales/',
        suffix: '.json'
      });

      $translateProvider.preferredLanguage('en-US');
    })


    .config(function (localStorageServiceProvider) {
      localStorageServiceProvider
        .setPrefix('hoay')
        .setStorageType('setStorageCookie')
        .setNotify(true, true);
    })

    .config(function ($ionicConfigProvider) {
      $ionicConfigProvider.backButton.previousTitleText(true)
        .icon('ion-chevron-left')
        .text(' ');
    });

}
