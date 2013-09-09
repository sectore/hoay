angular.module('hoay.info', [
  'hoay.app'
  'ngRoute'
  'ng-iscroll'
  'hoay.version'
])

.config([
  '$routeProvider',
  ($routeProvider) ->
    $routeProvider
    .when '/info',
      controller: 'InfoController',
      templateUrl: 'info/info.tpl.html'
])

.controller('InfoController', [
  '$log',
  '$scope',
  '$navigate',
  'Version',
  ($log, $scope, $navigate, Version)->

    $scope.version = Version

    $scope.prev = ->
      $navigate.back()

])
