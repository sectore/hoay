# module definition
# ------------------------------------------------------------
angular.module('hoay.settings', [
  'ajoslin.mobile-navigate'
  'ngRoute'
  'ngStorage'
  'jm.i18next'
])

# constants
# ------------------------------------------------------------
.constant 'LANG_ID',
  DE_DE: 'de-DE'
  EN_US: 'en-US'

# configuration
# ------------------------------------------------------------
.config([
  '$routeProvider',
  ($routeProvider) ->
    $routeProvider
    .when '/settings',
      controller: 'settingsController',
      templateUrl: 'settings/settings.tpl.html'
])

# controller
# ------------------------------------------------------------
.controller('settingsController', [
    '$log',
    '$scope',
    '$window',
    '$navigate',
    '$i18next',
    '$localStorage'
    'LANG_ID'
    ($log, $scope, $window, $navigate, $i18next, $localStorage, LANG_ID)->

      $scope.prev = ->
        $navigate.back()

      $scope.setGerman = ->
        $i18next.options.lng = LANG_ID.DE_DE
        $localStorage.langID = LANG_ID.DE_DE

      $scope.isGerman = ->
        $i18next.options.lng is LANG_ID.DE_DE

      $scope.setEnglish = ->
        $i18next.options.lng = LANG_ID.EN_US
        $localStorage.langID = LANG_ID.EN_US

      $scope.isEnglish = ->
        $i18next.options.lng is LANG_ID.EN_US
])
