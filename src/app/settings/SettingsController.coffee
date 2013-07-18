'use strict'

angular.module('hoay.settings', [])

.config([
  '$routeProvider',
  ($routeProvider) ->
    $routeProvider
    .when '/settings',
      controller: 'SettingsController',
      templateUrl: 'settings/settings.tpl.html'
])

.controller('SettingsController', [
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
