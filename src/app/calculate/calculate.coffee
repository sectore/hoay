'use strict'

# module definition
# ------------------------------------------------------------
angular.module('hoay.calculate', [])

# config
# ------------------------------------------------------------
.config([
  '$routeProvider',
  ($routeProvider) ->
    $routeProvider
      .when '/calculate',
        controller: 'calculateController',
        templateUrl: 'calculate/calculate.tpl.html'
])

# controller
# ------------------------------------------------------------
.controller 'calculateController',[
  '$scope',
  '$rootScope',
  '$navigate',
  '$log',
  '$translate',
  'dateModel'
  ($scope, $rootScope, $navigate, $log, $translate, dateModel)->

    $scope.showResult = ->
      $navigate.go '/result'

    $scope.showSettings = ->
      $navigate.go '/settings', 'modal'

    $scope.showInfo = ->
      $navigate.go '/info', 'modal'

    $rootScope.$on 'translationChangeSuccess', ->
      setDates()

    setDates = ->
      $scope.endDate = dateModel.endDate
      $scope.startDate = dateModel.startDate

    setDates()
]


