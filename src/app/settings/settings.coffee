# module definition
# ------------------------------------------------------------
angular.module('hoay.settings', [])

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
    '$scope',
    '$navigate',
    '$translate',
    ($scope, $navigate, $translate)->

      $scope.prev = ->
        $navigate.back()

      $scope.setGerman = ->
        $translate.uses 'de_DE'

      $scope.isGerman = ->
        $translate.uses() is 'de_DE'

      $scope.setEnglish = ->
        $translate.uses 'en_US'

      $scope.isEnglish = ->
        $translate.uses() is 'en_US'


])
