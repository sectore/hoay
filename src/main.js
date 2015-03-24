/// <reference path='./definitions.d.ts' />
var hoay;
(function (hoay) {
    angular.module('hoay', [
        'ionic',
        'localStorageServiceProvider',
        'pascalprecht.translate',
        'templates',
        'hoay.common.date',
        'hoay.calculate',
        'hoay.result'
    ]).run(function ($ionicPlatform) {
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
    }).config(function ($stateProvider, $urlRouterProvider, $locationProvider, CALCULATE_PATH, RESULT_PATH) {
        // if none of the above states are matched, use this as the fallback
        $urlRouterProvider.otherwise('/');
        //$urlRouterProvider.otherwise(CALCULATE_PATH);
        //$urlRouterProvider.otherwise(RESULT_PATH);
        // html5Mode (deactivated by using cordova)
        $locationProvider.html5Mode(!window.cordova);
    }).config(['$translateProvider', function ($translateProvider) {
        console.log('$translateProvider', $translateProvider);
        $translateProvider.useStaticFilesLoader({
            prefix: 'locales/',
            suffix: '.json'
        });
        $translateProvider.preferredLanguage('en-US');
    }]).config(function (localStorageServiceProvider) {
        localStorageServiceProvider.setPrefix('hoay').setStorageType('setStorageCookie').setNotify(true, true);
    });
})(hoay || (hoay = {}));
//# sourceMappingURL=main.js.map