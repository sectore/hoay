angular.module('hoay.info', [
  'ng-iscroll'
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

    $scope.sayHello = ->
      alert('hello')

])
