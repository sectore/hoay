'use strict'

angular.module('hoay.calculate', [])

.config([
  '$routeProvider',
  ($routeProvider) ->
    $routeProvider
    .when '/',
      controller: 'CalculateController',
      templateUrl: 'calculate/calculate.tpl.html'
])

.controller 'CalculateController',[
  '$scope',
  '$rootScope',
  '$navigate',
  '$log',
  '$translate',
  ($scope, $rootScope, $navigate, $log, $translate)->

    $scope.enddate = new Date()
    $scope.startdate = new Date()

    $scope.showResult = ->
      $navigate.go '/result'

    $scope.showSettings = ->
      $navigate.go '/settings', 'modal'

    $scope.showInfo = ->
      $navigate.go '/info', 'modal'

    $rootScope.$on 'translationChangeSuccess', ->
      updateDates()

    updateDates = ->
      #TODO: using custom filter
    #    $log.info $translate.uses()
    #    if $translate.uses() is 'en_US'
    #      $scope.startDate = "01/23/1978"
    #    else
    #      $scope.startDate = "23.01.1978"


    updateDates()
]


