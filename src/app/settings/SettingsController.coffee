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

.controller 'SettingsController'
, ($scope, $navigate)->

  $scope.prev = ->
    $navigate.back()

