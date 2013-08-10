# module definition
# ------------------------------------------------------------
angular.module('hoay.settings', [
  'ngMobile'
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
    '$log'
    '$scope',
    '$window',
    '$navigate',
    '$i18next'
    ($log, $scope, $window, $navigate, $i18next)->

      $scope.prev = ->
        $navigate.back()

      $scope.setGerman = ->
        $i18next.options.lng = 'de-DE'

      $scope.isGerman = ->
        $i18next.options.lng is 'de-DE'

      $scope.setEnglish = ->
        $i18next.options.lng = 'en-US'

      $scope.isEnglish = ->
        $i18next.options.lng is 'en-US'
])
