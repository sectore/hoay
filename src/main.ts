/// <reference path='./definitions.d.ts' />

module hoay {

  angular
    .module('hoay', [
      'ionic',
      'templates',
      'hoay.calculate',
      'hoay.result'
    ])
    .run(function ($ionicPlatform) {
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

    .config(($stateProvider:ng.ui.IStateProvider,
             $urlRouterProvider:ng.ui.IUrlRouterProvider,
             $locationProvider:ng.ILocationProvider,
             CALCULATE_PATH:string) => {
      // if none of the above states are matched, use this as the fallback
      $urlRouterProvider.otherwise(CALCULATE_PATH);

      // html5Mode (deactivated by using cordova)
      $locationProvider.html5Mode(!window.cordova);
    });
}
