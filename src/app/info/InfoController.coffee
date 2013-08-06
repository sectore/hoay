angular.module('hoay.info', [])

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

    $scope.translateValues =
      version: Version

    $log.info "version #{Version}"

    $scope.prev = ->
      $navigate.back()

])
