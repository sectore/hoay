# module definition
# ------------------------------------------------------------
angular.module('hoay.settings', [
  'hoay.app'
  'ngRoute'
  'ngStorage'
  'jm.i18next'
])

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
    'HOAYCONSTANTS'
    ($log, $scope, $window, $navigate, $i18next, $localStorage, hoayConstants)->

      $scope.prev = ->
        $navigate.back()

      $scope.setGerman = ->
        $i18next.options.lng = hoayConstants.LANG_DE_DE
        $localStorage.langID = hoayConstants.LANG_DE_DE

      $scope.isGerman = ->
        $i18next.options.lng is hoayConstants.LANG_DE_DE

      $scope.setEnglish = ->
        $i18next.options.lng = hoayConstants.LANG_EN_US
        $localStorage.langID = hoayConstants.LANG_EN_US

      $scope.isEnglish = ->
        $i18next.options.lng is hoayConstants.LANG_EN_US
])
