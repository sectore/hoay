'use strict'

# module definition
# ------------------------------------------------------------
angular.module('hoay.result', [])

# config
# ------------------------------------------------------------
.config([
  '$routeProvider',
  ($routeProvider) ->
    $routeProvider
    .when '/result',
      controller: 'resultController',
      templateUrl: 'result/result.tpl.html'
])

# controller
# ------------------------------------------------------------
.controller 'resultController', [
  '$scope',
  '$navigate',
  '$log',
  'DateModel'
  ($scope, $navigate, $log, dateModel)->

    $scope.dateModel = dateModel

    $scope.next = ->
      $navigate.go '/settings', 'modal'

    $scope.prev = ->
      $navigate.back()

    $scope.updateStartDate = ->
      dateModel.setStart new Date(67,1,3)

    $scope.updateStartDate2 = ->
      dateModel.setStart new Date(88,2,5)


]
