'use strict'

angular.module('hoay.info', [])

.config([
  '$routeProvider',
  ($routeProvider) ->
    $routeProvider
    .when '/info',
      controller: 'InfoController',
      templateUrl: 'info/info.tpl.html'
])

.controller 'InfoController'
, ($scope, $navigate)->

  $scope.prev = ->
    $navigate.back()

